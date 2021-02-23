import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.exceedingLength({
    @required T failedValue,
    @required int max,
  }) = ExceedingLength<T>;
  const factory ValueFailure.empty({
    @required T failedValue,
  }) = Empty<T>;
  const factory ValueFailure.multiline({
    @required T failedValue,
  }) = Multiline<T>;
  const factory ValueFailure.listTooLong({
    @required T failedValue,
    @required int max,
  }) = ListTooLong<T>;
  const factory ValueFailure.invalidEmail({
    @required T failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    @required T failedValue,
  }) = ShortPassword<T>;
  const factory ValueFailure.weakPassword({
    @required T failedValue,
  }) = WeakPassword<T>;
  const factory ValueFailure.shortString({
    @required T failedValue,
  }) = ShortString<T>;
  const factory ValueFailure.invalidDate({
    @required T failedValue,
  }) = InvalidDate<T>;
  const factory ValueFailure.invalidMinimumDate({
    @required T failedValue,
  }) = InvalidMinimumDate<T>;
  const factory ValueFailure.invalidInt({
    @required T failedValue,
  }) = InvalidInt<T>;
  const factory ValueFailure.invalidDouble({
    @required T failedValue,
  }) = InvalidDouble<T>;
  const factory ValueFailure.invalidPriceComparation({
    @required T failedValue,
  }) = InvalidPriceComparation<T>;
  const factory ValueFailure.invalidUrl({
    @required T failedValue,
  }) = InvalidUrl<T>;
  const factory ValueFailure.invalidPhoneNumber({
    @required T failedValue,
  }) = InvalidPhoneNumber<T>;
  const factory ValueFailure.invalidNumber({
    @required T failedValue,
  }) = InvalidNumber<T>;
}
