import 'package:freezed_annotation/freezed_annotation.dart';

part 'fixture_failure.freezed.dart';

@freezed
abstract class FixtureFailure with _$FixtureFailure {
  const factory FixtureFailure.cancelledByUser() = CancelledByUser;
  const factory FixtureFailure.serverError() = ServerError;
  const factory FixtureFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
  const factory FixtureFailure.insufficientPermission() =
      InsufficientPermission;
  const factory FixtureFailure.unexpected() = Unexpected;
  const factory FixtureFailure.saveUserError() = SaveUserError;
  const factory FixtureFailure.saveForecastError() = SaveForecastError;
  const factory FixtureFailure.saveStreakError() = SaveStreakError;
  const factory FixtureFailure.fixtureFinalized() = FixtureFinalized;
  const factory FixtureFailure.forecastScoreError() = ForecastScoreError;
  const factory FixtureFailure.forecastScoreTieError() = ForecastScoreTieError;
  const factory FixtureFailure.unabledEditForm() = UnabledEditForm;
  const factory FixtureFailure.unableSaveForecast() = UnableSaveForecast;
}
