import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;

  /// default type button is elevatedButton or FillButton
  final TypeButton? typeButton;

  /// [text] is Optional but paramenter [child] is required
  final String? text;

  /// [child] is Optional but paramenter [text] is required
  final Widget? child;
  final TextStyle? textStyle;

  /// if type button is outllinedbutton so use the backgroundColor for line color default is [AppColors.primary]
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final FocusNode? focusNode;
  final Color? textColor;

  const AppButton({
    Key? key,
    required this.onPressed,
    this.text,
    this.child,
    this.typeButton = TypeButton.elevatedButton,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
    this.backgroundColor,
    this.textColor,
    this.focusNode,
  })  : assert(text == null || child == null, 'Please use either [title] or [child] parameter'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor = (typeButton == TypeButton.textButton)
        ? AppColors.transparent
        : (typeButton == TypeButton.outlinedButton)
            ? AppColors.transparent
            : (typeButton == TypeButton.disableButton)
                ? AppColors.disable
                : backgroundColor ?? AppColors.primary;

    BorderSide _borderLine = (typeButton == TypeButton.textButton)
        ? BorderSide.none
        : (typeButton == TypeButton.outlinedButton)
            ? BorderSide(width: 1.0, color: backgroundColor ?? AppColors.primary)
            : BorderSide.none;

    Color _textColor = (typeButton == TypeButton.textButton)
        ? textColor ?? AppColors.white
        : (typeButton == TypeButton.outlinedButton)
            ? textColor ?? AppColors.white
            : (typeButton == TypeButton.disableButton)
                ? AppColors.blackText
                : textColor ?? AppColors.white;

    if (typeButton == TypeButton.outlinedButton) {
      return OutlinedButton(
        onPressed: () => onPressed!(),
        focusNode: focusNode,
        style: OutlinedButton.styleFrom(side: _borderLine, primary: _backgroundColor, padding: padding),
        child: child ??
            Text(
              text!,
              textAlign: TextAlign.center,
              style: textStyle ?? Get.textTheme.button!.copyWith(color: _textColor, height: 1),
            ),
      );
    }

    if (typeButton == TypeButton.textButton) {
      return TextButton(
        onPressed: () => onPressed!(),
        focusNode: focusNode,
        style: TextButton.styleFrom(padding: padding),
        child: child ??
            Text(
              text!,
              textAlign: TextAlign.center,
              style: textStyle ?? Get.textTheme.button!.copyWith(color: _textColor, height: 1),
            ),
      );
    }

    return ElevatedButton(
      onPressed: () => onPressed!(),
      focusNode: focusNode,
      style: ElevatedButton.styleFrom(primary: _backgroundColor, padding: padding),
      child: child ??
          Text(
            text!,
            textAlign: TextAlign.center,
            style: textStyle ?? Get.textTheme.button!.copyWith(color: _textColor, height: 1),
          ),
    );
  }
}
