import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart' show required;

import '../../../domain/auth/auth_failure.dart';
import '../../../utils/app_information.dart';
import '../../../utils/utils.dart';
import '../../models/user/user_local.dart';
import '../../providers/local/local_storage.dart';

class FirebaseAuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();
  final LocalStorage _localStorage = Get.find<LocalStorage>();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signOut() {
    return Future.wait([
      _firebaseAuth.signOut(),
      _localStorage.cleanAll(),
      _googleSignIn.signOut(),
      FacebookAuth.instance.logOut(),
    ]);
  }

  static var client = http.Client();

  Future<Either<AuthFailure, String>> getEmailFromUsername(
      {String username}) async {
    String _username = Utils().superAmigable(username);
    String url = AppInformation.cloudFunctionsURL +
        "/getEmailFromUsername?username=" +
        _username +
        "&token=" +
        AppInformation.cloudFunctionsToken;

    var response = await client.get(url);

    Either<AuthFailure, String> _return =
        left(AuthFailure.getUsernameCloudErrorUnknow());
    if (response.statusCode == 200) {
      var body = response.body.trim();
      _return = right(body);
    } else if (response.statusCode == 500) {
      _return = left(AuthFailure.getUsernameCloudServerError());
    }
    return _return;
  }

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required String emailAddress,
    @required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailAddress, password: password);

      final User user = _firebaseAuth.currentUser;
      final uid = user.uid;

      Either<AuthFailure, Unit> failureOrSuccess =
          await guardarUID(uid, emailAddress, 'Email');

      await failureOrSuccess.fold((l) => null, (r) async {
        UserLocal _userLocal = UserLocal(
          id: user.uid,
          email: emailAddress,
        );

        Either<Unit, Unit> _saveUser = await _localStorage.saveUser(_userLocal);
        failureOrSuccess = _saveUser.fold(
            (l) => left(const AuthFailure.saveUserError()), (r) => right(unit));
      });

      return failureOrSuccess;
    } on FirebaseAuthException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const AuthFailure.insufficientPermission());
      } else if (e.code == 'wrong-password' || e.code == 'user-not-found') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required String emailAddress,
    @required String password,
    @required String username,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      Either<AuthFailure, User> _createUser = await createUser(
        emailAddress: emailAddress,
        username: username,
        metodoInicioSesion: 'Email',
      );

      return await _createUser.fold((failure) {
        return left(failure);
      }, (user) async {
        UserLocal _userLocal = UserLocal(
          id: user.uid,
          email: emailAddress,
          username: username,
        );
        Either<Unit, Unit> _saveUser = await _localStorage.saveUser(_userLocal);
        return _saveUser.fold((l) => left(const AuthFailure.saveUserError()),
            (r) {
          user.sendEmailVerification();
          return right(unit);
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const AuthFailure.insufficientPermission());
      } else if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  Future<Either<AuthFailure, Unit>> createUsername({
    @required UserLocal user,
    @required String username,
  }) async {
    try {
      Either<AuthFailure, Unit> _createUsername =
          await isUsernameAlreadyExist(username);

      return await _createUsername.fold((failure) {
        return left(failure);
      }, (_) async {
        Either<AuthFailure, Unit> _createUsername = await createUsernameInDB(
          emailAddress: user.email,
          username: username,
        );
        return await _createUsername.fold((failure) {
          return left(failure);
        }, (_) async {
          UserLocal _userLocal = UserLocal(
            id: user.id,
            email: user.email,
            username: username,
          );
          Either<Unit, Unit> _saveUser =
              await _localStorage.saveUser(_userLocal);
          return _saveUser.fold((l) => left(const AuthFailure.saveUserError()),
              (r) => right(unit));
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const AuthFailure.insufficientPermission());
      } else if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  Future<Either<AuthFailure, Unit>> sendEmailResetPassword(
      {@required String emailAddress}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: emailAddress);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const AuthFailure.insufficientPermission());
      } else if (e.code == 'user-not-found') {
        return left(const AuthFailure.invalidEmailAndPasswordCombination());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  Future<Either<AuthFailure, Unit>> saveUser({
    String emailAddress = '',
    String username = '',
    String metodoInicioSesion = '',
    String idGoogle = '',
    String idFacebook = '',
    String image = '',
  }) async {
    try {
      bool _isUserAlreadyExist =
          await isUserAlreadyExist(emailAddress: emailAddress);

      if (_isUserAlreadyExist) {
        final User user = _firebaseAuth.currentUser;
        final uid = user.uid;
        await guardarUID(uid, emailAddress, metodoInicioSesion);
      } else {
        Either<AuthFailure, User> _createUser = await createUser(
          emailAddress: emailAddress,
          username: username,
          metodoInicioSesion: metodoInicioSesion,
          idFacebook: idFacebook,
          image: image,
        );

        return _createUser.fold((failure) => left(failure), (r) => right(unit));
      }
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const AuthFailure.insufficientPermission());
      } else {
        return left(const AuthFailure.unexpected());
      }
    }
  }

  Future<bool> isUserAlreadyExist({@required String emailAddress}) async {
    try {
      DocumentSnapshot document =
          await _firebaseFirestore.collection('users').doc(emailAddress).get();
      if (document.exists) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<Either<AuthFailure, Unit>> isUsernameAlreadyExist(
      String username) async {
    try {
      QuerySnapshot snapshots =
          await _firebaseFirestore.collection('users').get();

      bool check = checkExistUsername(snapshots, username);

      return check
          ? left(const AuthFailure.usernameAlreadyInUse())
          : right(unit);
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const AuthFailure.insufficientPermission());
      } else {
        return left(const AuthFailure.unexpected());
      }
    }
  }

  bool checkExistUsername(QuerySnapshot snapshots, String username) {
    String actualName = username.trim();
    String actualNameAmigable = Utils().superAmigable(username);

    bool _return = false;
    if (snapshots.docs.isNotEmpty) {
      snapshots.docs.forEach((document) {
        if (document.data()['username'] != null) {
          String nombre = document.data()['username'].toString();
          if (actualName == nombre) {
            _return = true;
          }
        }
        if (document.data()['usernameAmigable'] != null) {
          String nombreAmigable =
              document.data()['usernameAmigable'].toString();
          if (actualNameAmigable == nombreAmigable) {
            _return = true;
          }
        }
      });
    }
    return _return;
  }

  Future<Either<AuthFailure, User>> createUser({
    String emailAddress = '',
    String username = '',
    String metodoInicioSesion = '',
    String idGoogle = '',
    String idFacebook = '',
    String image = '',
  }) async {
    try {
      final User user = _firebaseAuth.currentUser;
      final uid = user.uid;
      await _firebaseFirestore.collection('users').doc(emailAddress).set({
        'username': username.trim(),
        'usernameAmigable': Utils().superAmigable(username),
        'email': emailAddress,
        'metodoInicioSesion': metodoInicioSesion,
        'idGoogle': idGoogle,
        'idFacebook': idFacebook,
        'image': image,
        'createdDate': DateTime.now(),
      }).then(
          (value) async => guardarUID(uid, emailAddress, metodoInicioSesion));
      return right(user);
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const AuthFailure.insufficientPermission());
      } else {
        return left(const AuthFailure.unexpected());
      }
    }
  }

  Future<Either<AuthFailure, Unit>> createUsernameInDB({
    @required String emailAddress,
    @required String username,
  }) async {
    try {
      await _firebaseFirestore.collection('users').doc(emailAddress).update({
        'username': username,
        'usernameAmigable': Utils().superAmigable(username),
        'updatedDate': DateTime.now(),
      });
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const AuthFailure.insufficientPermission());
      } else {
        return left(const AuthFailure.unexpected());
      }
    }
  }

  Future<Either<AuthFailure, Unit>> guardarUID(
      String uid, String emailAddress, String metodoInicioSesion) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(emailAddress)
          .collection('uids')
          .doc(uid)
          .set({
        'uid': uid,
        'metodoInicioSesion': metodoInicioSesion,
        'ultimoInicioSesion': DateTime.now(),
      });
      return right(unit);
    } on PlatformException catch (e) {
      if (e.message.contains('permission-denied')) {
        return left(const AuthFailure.insufficientPermission());
      } else {
        return left(const AuthFailure.unexpected());
      }
    }
  }

  Future<void> reenviarEmailVerification() async {
    return await _firebaseAuth.currentUser.sendEmailVerification();
  }

  Future<bool> checkEmailVerification() async {
    await _firebaseAuth.currentUser.reload();
    return _firebaseAuth.currentUser.emailVerified;
  }

  Future<Either<AuthFailure, Unit>> signInWithFacebook() async {
    try {
      AccessToken accessToken = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();
      Either<AuthFailure, Unit> _return = left(AuthFailure.unexpected());

      if (userData != null) {
        if (userData['email'] != null) {
          String idFacebook = accessToken.userId.toString();
          String userEmail = userData['email'].toString();
          String userPicture = userData['picture']['data']['url'].toString();

          final credential = FacebookAuthProvider.credential(accessToken.token);

          await _firebaseAuth
              .signInWithCredential(credential)
              .then((userCredential) async {
            final User user = userCredential.user;
            Either<AuthFailure, Unit> _saveUser = await saveUser(
              emailAddress: userEmail,
              metodoInicioSesion: 'Facebook',
              idFacebook: idFacebook,
              image: userPicture ?? '',
            );
            await _saveUser.fold((l) => null, (r) async {
              UserLocal _userLocal = UserLocal(
                id: user.uid,
                email: userEmail,
                image: userPicture ?? '',
              );
              Either<Unit, Unit> _saveUserLocal =
                  await _localStorage.saveUser(_userLocal);
              _saveUser = _saveUserLocal.fold(
                  (l) => left(const AuthFailure.saveUserError()),
                  (r) => right(unit));
            });
            _return = _saveUser;
          });
        } else {
          _return = left(const AuthFailure.unableToGetEmail());
        }
      }

      return _return;
    } on FacebookAuthException catch (e) {
      switch (e.errorCode) {
        case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
          return left(AuthFailure.fbOperationInProgress());
        case FacebookAuthErrorCode.CANCELLED:
          return left(AuthFailure.cancelledByUser());
        case FacebookAuthErrorCode.FAILED:
          return left(AuthFailure.serverError());
      }
      return left(AuthFailure.unexpected());
    }
    // try {
    //   AccessToken accessToken = await _facebookAuth.isLogged;
    //   dynamic userData;

    //   if (accessToken != null) {
    //     userData = await _facebookAuth.getUserData();
    //   } else {
    //     final LoginResult result = await _facebookAuth.login();
    //     if (result.status == 200) {
    //       userData = await _facebookAuth.getUserData();
    //       accessToken = result.accessToken;
    //     } else if (result.status == 403) {
    //       return left(const AuthFailure.cancelledByUser());
    //     } else {
    //       return left(const AuthFailure.serverError());
    //     }
    //   }
    //   if (userData != null) {
    //     if (userData['email'] != null) {
    //       String idFacebook = accessToken.userId.toString();
    //       String userEmail = userData['email'].toString();
    //       String userName = userData['name'].toString();
    //       String userPicture = userData['picture']['data']['url'].toString();

    //       final credential = FacebookAuthProvider.credential(accessToken.token);

    //       return _firebaseAuth
    //           .signInWithCredential(credential)
    //           .then((userCredential) async {
    //         final User user = userCredential.user;
    //         Either<AuthFailure, Unit> _saveUser = await saveUser(
    //           emailAddress: userEmail,
    //           metodoInicioSesion: 'Facebook',
    //           idFacebook: idFacebook,
    //         );
    //         await _saveUser.fold((l) => null, (r) async {
    //           UserLocal _userLocal = UserLocal(
    //             id: user.uid,
    //             email: userEmail,
    //             image: userPicture ?? '',
    //           );
    //           Either<Unit, Unit> _saveUserLocal =
    //               await _localStorage.saveUser(_userLocal);
    //           _saveUser = _saveUserLocal.fold(
    //               (l) => left(const AuthFailure.saveUserError()),
    //               (r) => right(unit));
    //         });
    //         return _saveUser;
    //       });
    //     } else {
    //       return left(const AuthFailure.unableToGetEmail());
    //     }
    //   } else {
    //     return left(const AuthFailure.insufficientPermission());
    //   }
    // } on FacebookAuthException catch (e) {
    //   switch (e.errorCode) {
    //     case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
    //       print("You have a previous login operation in progress");
    //       break;
    //     case FacebookAuthErrorCode.CANCELLED:
    //       print("login cancelled");
    //       break;
    //     case FacebookAuthErrorCode.FAILED:
    //       print("login failed");
    //       break;
    //   }
    //   return left(const AuthFailure.unexpected());
    // }
  }

  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return left(const AuthFailure.cancelledByUser());
      }

      if (googleUser.email != null) {
        final googleAuthentication = await googleUser.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuthentication.idToken,
          accessToken: googleAuthentication.accessToken,
        );

        String userEmail = googleUser.email;

        return _firebaseAuth
            .signInWithCredential(credential)
            .then((userCredential) async {
          final User user = userCredential.user;
          Either<AuthFailure, Unit> _saveUser = await saveUser(
            emailAddress: userEmail,
            metodoInicioSesion: 'Google',
            idGoogle: googleUser.id,
            image: googleUser.photoUrl ?? '',
          );
          await _saveUser.fold((l) => null, (r) async {
            UserLocal _userLocal = UserLocal(
              id: user.uid,
              email: userEmail,
              image: googleUser.photoUrl ?? '',
            );
            Either<Unit, Unit> _saveUserLocal =
                await _localStorage.saveUser(_userLocal);
            _saveUser = _saveUserLocal.fold(
                (l) => left(const AuthFailure.saveUserError()),
                (r) => right(unit));
          });
          return _saveUser;
        });
      } else {
        return left(const AuthFailure.unableToGetEmail());
      }
    } on PlatformException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }
}
