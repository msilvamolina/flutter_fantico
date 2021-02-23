import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_streaks.freezed.dart';
part 'user_streaks.g.dart';

@freezed
abstract class UserStreaks implements _$UserStreaks {
  const UserStreaks._();
  factory UserStreaks.fromJson(Map<String, dynamic> json) =>
      _$UserStreaksFromJson(json);

  const factory UserStreaks({
    @required String id,
    @required String userEmail,
    String timeRange,
    String type,
    int streakPositive,
    int streakNegative,
    DateTime createdDate,
    DateTime updatedDate,
  }) = _UserStreaks;

  factory UserStreaks.fromFirestore(DocumentSnapshot doc) {
    String userEmail = '';
    String timeRange = '';
    String type = '';
    int streakPositive = 0;
    int streakNegative = 0;
    DateTime createdDate;
    DateTime updatedDate;

    userEmail = (doc.data()['userEmail'] ?? '').toString();
    timeRange = (doc.data()['timeRange'] ?? '').toString();
    type = (doc.data()['type'] ?? '').toString();

    if (doc.data()['createdDate'] != null) {
      createdDate = doc.data()['createdDate'].toDate();
    }

    if (doc.data()['updatedDate'] != null) {
      updatedDate = doc.data()['updatedDate'].toDate();
    }

    if (doc.data()['streakPositive'] != null) {
      try {
        streakPositive =
            int.parse((doc.data()['streakPositive'] ?? "0").toString());
      } catch (e) {}
    }

    if (doc.data()['streakNegative'] != null) {
      try {
        streakNegative =
            int.parse((doc.data()['streakNegative'] ?? "0").toString());
      } catch (e) {}
    }

    return UserStreaks(
      id: doc.id,
      userEmail: userEmail,
      timeRange: timeRange,
      type: type,
      streakPositive: streakPositive,
      streakNegative: streakNegative,
      createdDate: createdDate,
      updatedDate: updatedDate,
    );
  }
}
