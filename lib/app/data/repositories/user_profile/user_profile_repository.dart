import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;

import '../../../domain/auth/auth_failure.dart';
import '../../../utils/utils.dart';
import '../../models/user/user_local.dart';

class UserProfileRepository {
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();

  Future<Either<AuthFailure, Unit>> saveProfile({
    @required UserLocal user,
  }) async {
    try {
      await _firebaseFirestore.collection('users').doc(user.email).update({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'birthdate': user.birthdate,
        'sex': user.sex,
        'country': user.country,
        'city': user.city,
        'telephone': user.telephone,
        'updatedDate': DateTime.now(),
        'savePerfilFirstTime': user.savePerfilFirstTime,
        'puntos': user.puntos,
        'perfilCompletado': user.perfilCompletado,
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

  Future<Either<AuthFailure, String>> uploadImage(
      {@required File imageFile, @required String emailAddress}) async {
    try {
      final String extensionArchivo =
          Utils().findExtension(imageFile.toString());
      final String nombreImagen = "profile.$extensionArchivo";

      Reference ref = FirebaseStorage.instance
          .ref()
          .child('users/$emailAddress/$nombreImagen');

      UploadTask task = ref.putFile(imageFile);

      String imageURL = "";
      String _imageURLtemp = "";
      await task.whenComplete(() async {
        _imageURLtemp = await ref.getDownloadURL();
      });

      if (_imageURLtemp != "") {
        Either<AuthFailure, Unit> _saveImageInDB = await saveImage(
            emailAddress: emailAddress, imageURL: _imageURLtemp);

        _saveImageInDB.fold((failure) {
          return left(const AuthFailure.insufficientPermission());
        }, (_) {
          imageURL = _imageURLtemp;
        });
      }

      return right(imageURL);
    } on PlatformException catch (e) {
      if (e.message.contains('PERMISSION_DENIED')) {
        return left(const AuthFailure.insufficientPermission());
      } else {
        return left(const AuthFailure.unexpected());
      }
    }
  }

  Future<Either<AuthFailure, Unit>> saveImage({
    @required String emailAddress,
    @required String imageURL,
  }) async {
    try {
      await _firebaseFirestore.collection('users').doc(emailAddress).update({
        'image': imageURL,
        'updatedImage': DateTime.now(),
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
}
