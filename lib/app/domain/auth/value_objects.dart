import 'package:dartz/dartz.dart';

import '../core/failures.dart';
import '../core/value_objects.dart';
import '../core/value_validators.dart';

class EmailAddressOrUsename extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddressOrUsename(String input) {
    assert(input != null);
    return EmailAddressOrUsename._(
      validateString(input, 4),
    );
  }

  const EmailAddressOrUsename._(this.value);
}

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}

class StrongPassword extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory StrongPassword(String input) {
    assert(input != null);
    return StrongPassword._(
      validateStrongPassword(input),
    );
  }

  const StrongPassword._(this.value);
}

class Username extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Username(String input) {
    assert(input != null);
    return Username._(
      validateString(input, 6),
    );
  }

  const Username._(this.value);
}

class FirstName extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory FirstName(String input) {
    assert(input != null);
    return FirstName._(
      validateString(input, 2),
    );
  }

  const FirstName._(this.value);
}

class LastName extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory LastName(String input) {
    assert(input != null);
    return LastName._(
      validateString(input, 3),
    );
  }

  const LastName._(this.value);
}

class Birthdate extends ValueObject<DateTime> {
  final Either<ValueFailure<DateTime>, DateTime> value;

  factory Birthdate(DateTime input, int minimoDeEdad) {
    assert(input != null);
    return Birthdate._(
      validateDate(input, minimoDeEdad),
    );
  }

  const Birthdate._(this.value);
}

class UserSex extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory UserSex(String input) {
    assert(input != null);
    return UserSex._(
      validateString(input, 3),
    );
  }

  const UserSex._(this.value);
}

class Country extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Country(String input) {
    assert(input != null);
    return Country._(
      validateString(input, 3),
    );
  }

  const Country._(this.value);
}

class City extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory City(String input) {
    assert(input != null);
    return City._(
      validateString(input, 3),
    );
  }

  const City._(this.value);
}

class Telephone extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Telephone(String input) {
    assert(input != null);
    return Telephone._(
      validatePhoneNumber(input),
    );
  }

  const Telephone._(this.value);
}

class ImageUrl extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory ImageUrl(String input) {
    assert(input != null);
    return ImageUrl._(
      validateString(input, 10),
    );
  }

  const ImageUrl._(this.value);
}

class Sport extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Sport(String input) {
    assert(input != null);
    return Sport._(
      validateString(input, 3),
    );
  }

  const Sport._(this.value);
}

class TeamObject extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory TeamObject(String input) {
    assert(input != null);
    return TeamObject._(
      validateString(input, 3),
    );
  }

  const TeamObject._(this.value);
}
