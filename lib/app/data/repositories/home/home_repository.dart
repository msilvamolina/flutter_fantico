import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../domain/home/home_failure.dart';
import '../../../utils/utils.dart';
import '../../models/fixture/fixture.dart';
import '../../models/forecast/forecast.dart';
import '../../models/league/league.dart';
import '../../models/user/user_local.dart';
import '../../models/user_public/user_public.dart';
import '../../providers/local/local_storage.dart';

class HomeRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final LocalStorage _localStorage = Get.find<LocalStorage>();
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();

  Future<UserLocal> getSignedInUser() async {
    final User user = _firebaseAuth.currentUser;
    if (user != null) {
      return await _localStorage.getUser();
    }
    return null;
  }

  Future<Either<HomeFailure, UserLocal>> getUserInformation(
      UserLocal user) async {
    try {
      final userDoc =
          await _firebaseFirestore.collection('users').doc(user.email).get();

      bool _usuarioHabilitado = true;
      String _username = '';

      if (userDoc.data()['usuarioHabilitado'] != null) {
        _usuarioHabilitado = userDoc.data()['usuarioHabilitado'];
      }
      if (userDoc.data()['username'] != null) {
        _username = userDoc.data()['username'].toString();
      }

      if (_usuarioHabilitado == false) {
        return left(const HomeFailure.userBanned());
      }

      if (_username == '') {
        return left(const HomeFailure.usernameEmpty());
      }

      if (_username == 'error') {
        return left(const HomeFailure.usernameError());
      }

      UserLocal newUser = UserLocal.fromFirestore(userDoc);
      await _localStorage.saveUser(newUser);
      return right(newUser);
    } catch (e) {
      return left(const HomeFailure.unexpected());
    }
  }

  bool checkEmailVerification() {
    String providerId = _firebaseAuth.currentUser.providerData[0].providerId;
    if (providerId == 'facebook.com') {
      return true;
    } else if (providerId == 'google.com') {
      return true;
    }
    return _firebaseAuth.currentUser.emailVerified;
  }

  // Stream<List<Forecast>> getUserForecast(String userEmail) async* {
  //   try {
  //     Stream<QuerySnapshot> snapshots = _firebaseFirestore
  //         .collection('forecasts')
  //         .where('userEmail', isEqualTo: userEmail)
  //         .snapshots();

  //     yield* snapshots.map((snapshot) {
  //       return snapshot.docs.map((doc) => Forecast.fromFirestore(doc)).toList();
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Stream<List<Forecast>> getAllForecasts() async* {
    try {
      // DateTime today = DateTime.now();
      // DateTime startDate = today.add(new Duration(days: -3));
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('forecasts')
          // .where("createdDate", isGreaterThanOrEqualTo: startDate)
          .orderBy('createdDate', descending: false)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs.map((doc) => Forecast.fromFirestore(doc)).toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<List<UserPublic>> getAllUsers() async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('users')
          .orderBy('username')
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => UserPublic.fromFirestore(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  // Stream<List<UserStreaks>> getAllUsersStreaks() async* {
  //   try {
  //     Stream<QuerySnapshot> snapshots =
  //         _firebaseFirestore.collection('usersStreaks').snapshots();

  //     yield* snapshots.map((snapshot) {
  //       return snapshot.docs
  //           .map((doc) => UserStreaks.fromFirestore(doc))
  //           .toList();
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Stream<List<League>> getAllLeagues() async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('leagues')
          .where('active', isEqualTo: true)
          .snapshots();

      yield* snapshots.map((snapshot) {
        List<League> list =
            snapshot.docs.map((doc) => League.fromFirestore(doc)).toList();
        return orderLeagues(list);
      });
    } catch (e) {
      print(e);
    }
  }

  List<League> orderLeagues(List<League> list) {
    list.sort((a, b) => a.order.compareTo(b.order));
    return list;
  }

  Stream<List<Fixture>> getAllFixtures() async* {
    DateTime today = DateTime.now();
    DateTime yesteday = today.add(new Duration(days: -1));
    DateTime tomorrow = today.add(new Duration(days: 2));

    String yestedayStr = Utils().onlyDate(yesteday);
    String tomorrowStr = Utils().onlyDate(tomorrow);

    DateTime dateTime = DateTime.parse('$yestedayStr 00:00:00');
    DateTime dateTime2 = DateTime.parse('$tomorrowStr 00:00:00');
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('fixtures')
          .where("eventDateStart", isGreaterThanOrEqualTo: dateTime)
          .where("eventDateStart", isLessThanOrEqualTo: dateTime2)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs.map((doc) => Fixture.fromFirestore(doc)).toList();
      });
    } catch (e) {
      print(e);
    }
  }
}
