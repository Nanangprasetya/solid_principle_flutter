
import 'package:formz/formz.dart';

import '../../../core/core.dart';

class BodyValidator extends FormzInput<String, TitleValidationError> {
  const BodyValidator.pure() : super.pure('');
  const BodyValidator.dirty([String value = '']) : super.dirty(value);

  @override
  TitleValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : TitleValidationError.empty;
  }
}
