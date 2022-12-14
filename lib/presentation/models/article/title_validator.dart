import 'package:formz/formz.dart';

import '../../../core/core.dart';

class TitleValidator extends FormzInput<String, TitleValidationError> {
  const TitleValidator.pure() : super.pure('');
  const TitleValidator.dirty([String value = '']) : super.dirty(value);

  @override
  TitleValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : TitleValidationError.empty;
  }
}
