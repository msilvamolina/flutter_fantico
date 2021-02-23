import 'package:dartz/dartz.dart';

import 'failures.dart';

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateOptionalEmailAddress(
    String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if (input.length == 0) {
    return right(input);
  } else {
    if (RegExp(emailRegex).hasMatch(input)) {
      return right(input);
    } else {
      return left(ValueFailure.invalidEmail(failedValue: input));
    }
  }
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}

Either<ValueFailure<List<T>>, List<T>> validateMaxListLength<T>(
  List<T> input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(ValueFailure.listTooLong(failedValue: input, max: maxLength));
  }
}

Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.exceedingLength(failedValue: input, max: maxLength),
    );
  }
}

Either<ValueFailure<String>, String> validateMinMaxStringLength(
  String input,
  int minLength,
  int maxLength,
) {
  if (input.length >= minLength) {
    if (input.length <= maxLength) {
      return right(input);
    } else {
      return left(
        ValueFailure.exceedingLength(failedValue: input, max: maxLength),
      );
    }
  } else {
    return left(ValueFailure.shortString(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateStrongPassword(String input) {
  if (input.length >= 6) {
    const passwordRegex = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
    if (RegExp(passwordRegex).hasMatch(input)) {
      return right(input);
    } else {
      return left(ValueFailure.weakPassword(failedValue: input));
    }
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateOptionalString(
    String input, int length) {
  if (input.length == 0) {
    return right(input);
  } else {
    if (input.length >= length) {
      return right(input);
    } else {
      return left(ValueFailure.shortString(failedValue: input));
    }
  }
}

Either<ValueFailure<String>, String> validateOptionalUrl(
    String input, int length) {
  if (input.length == 0) {
    return right(input);
  } else {
    if (input.length >= length) {
      var urlPattern =
          r"(https?|ftp)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
      if (RegExp(urlPattern, caseSensitive: false).firstMatch(input) != null) {
        return right(input);
      } else {
        return left(ValueFailure.invalidUrl(failedValue: input));
      }
    } else {
      return left(ValueFailure.shortString(failedValue: input));
    }
  }
}

Either<ValueFailure<String>, String> validateOptionalPhoneNumber(String input) {
  if (input.length == 0) {
    return right(input);
  } else {
    var pattern = r'(^(?:[+0]9)?[0-9]{6,12}$)';
    if (RegExp(pattern).hasMatch(input)) {
      return right(input);
    } else {
      return left(ValueFailure.invalidPhoneNumber(failedValue: input));
    }
  }
}

Either<ValueFailure<String>, String> validatePhoneNumber(String input) {
  var pattern = r'(^(?:[+0]9)?[0-9]{6,12}$)';
  if (RegExp(pattern).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidPhoneNumber(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateNumber(String input) {
  var pattern = r'(^(?:[+0]9)?[0-9]{1,6}$)';
  if (RegExp(pattern).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidNumber(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateString(String input, int length) {
  if (input.length >= length) {
    return right(input);
  } else {
    return left(ValueFailure.shortString(failedValue: input));
  }
}

Either<ValueFailure<DateTime>, DateTime> validateDate(
    DateTime input, int minimoDeEdad) {
  if (input != null) {
    DateTime now = new DateTime.now();
    final difference = now.difference(input).inDays / 365;
    if (difference < minimoDeEdad) {
      return left(ValueFailure.invalidMinimumDate(failedValue: input));
    }
  } else {
    return left(ValueFailure.invalidDate(failedValue: input));
  }
  return right(input);
}

Either<ValueFailure<String>, String> validateInt(String input, int length) {
  if (input.length >= 0) {
    try {
      int number = int.parse(input);
      if (number > length) {
        return right(number.toString());
      }
    } catch (e) {}
  }
  return left(ValueFailure.invalidInt(failedValue: input));
}

Either<ValueFailure<String>, String> validateDouble(String input, int length) {
  if (input.length == 0) {
    return right(input);
  } else {
    try {
      double number = double.parse(input);
      if (number > length) {
        return right(number.toString());
      }
    } catch (e) {}
  }
  return left(ValueFailure.invalidDouble(failedValue: input));
}

Either<ValueFailure<String>, String> validateOptionalDouble(String input) {
  if (input.length == 0) {
    return right(input);
  } else {
    try {
      double number = double.parse(input);
      return right(number.toString());
    } catch (e) {}
  }
  return left(ValueFailure.invalidDouble(failedValue: input));
}

Either<ValueFailure<String>, String> validetePriceComparation(
    String price, String priceComparation) {
  try {
    double _price = double.parse(price);
    double _priceComparation = double.parse(priceComparation);
    if (_priceComparation >= _price) {
      return right(_priceComparation.toString());
    }
  } catch (e) {}
  return left(
      ValueFailure.invalidPriceComparation(failedValue: priceComparation));
}
