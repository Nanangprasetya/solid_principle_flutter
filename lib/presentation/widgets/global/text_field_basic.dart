import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/core.dart';
class TextFieldBasic extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final String hint;
  final bool enabled;
  final bool multiline;
  final String? initialValue;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final String? suffixText;
  final String? Function(String?)? validator;
  final bool obscure;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final int? maxLength;
  final String? errorText;
  final bool? autocorrect;
  final Iterable<String>? autofillHints;

  const TextFieldBasic({
    Key? key,
    this.controller,
    required this.title,
    required this.hint,
    this.initialValue,
    this.enabled = true,
    this.multiline = false,
    this.inputType,
    this.inputAction,
    this.suffixText,
    this.validator,
    this.obscure = false,
    this.onChanged,
    this.focusNode,
    this.maxLength = 225,
    this.errorText,
    this.autocorrect = true,
    this.autofillHints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        initialValue: initialValue,
        controller: controller,
        focusNode: focusNode,
        autofillHints: autofillHints,
        keyboardType: inputType == null ? null : inputType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.shadowGrey, width: 1),
            borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey, width: 2),
            borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
          ),
          label: Text(title),
          alignLabelWithHint: true,
          floatingLabelStyle: TextStyle(
            color: AppColors.greyText,
          ),
          hintText: hint,
          contentPadding: EdgeInsets.all(AppDimens.marginPaddingMedium),
          suffixText: suffixText,
          errorText: errorText,
        ),
        enabled: enabled,
        maxLines: multiline ? 4 : 1,
        textInputAction: inputAction == null ? null : inputAction,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscure,
        onChanged: onChanged,
        autocorrect: autocorrect!,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
        ],
      ),
    );
  }
}
