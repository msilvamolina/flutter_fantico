import 'package:freezed_annotation/freezed_annotation.dart';

part 'rankings_failure.freezed.dart';

@freezed
abstract class RankingsFailure with _$RankingsFailure {
  const factory RankingsFailure.unexpected() = _Unexpected;
  const factory RankingsFailure.insufficientPermission() =
      _InsufficientPermission;
  const factory RankingsFailure.unableToUpdate() = _UnableToUpdate;
  const factory RankingsFailure.empty() = _Empty;
}
