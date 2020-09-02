import 'package:formz/formz.dart';
import 'package:jumpets_app/models/enums/activity_level.dart';

enum AdStringValidationError { empty }

class AdString extends FormzInput<String, AdStringValidationError> {
  const AdString.pure([String value = '']) : super.pure(value);
  const AdString.dirty([String value = '']) : super.dirty(value);

  @override
  AdStringValidationError validator(String value) {
    return value?.isEmpty == true ? AdStringValidationError.empty : null;
  }
}

enum AdDoubleValidationError { invalid }

class AdDouble extends FormzInput<double, AdDoubleValidationError> {
  const AdDouble.pure([double value = 0.0]) : super.pure(value);
  const AdDouble.dirty([double value = 0.0]) : super.dirty(value);

  @override
  AdDoubleValidationError validator(double value) {
    return value == 0.0 ? AdDoubleValidationError.invalid : null;
  }
}
