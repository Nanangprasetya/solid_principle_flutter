import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ListRowWidget extends StatelessWidget {
  final String label;
  final String value;
  final Color? textColor;
  final bool hasBackground;
  final Color? background;
  final double letterSpacing;
  final bool multiLine;
  final bool isLoaded;
  final double fontSize;
  final bool isShowTooltip;
  final bool? boldLabel;

  const ListRowWidget({
    Key? key,
    required this.label,
    required this.value,
    this.textColor,
    this.hasBackground = false,
    this.background,
    this.letterSpacing = 1.0,
    this.multiLine = false,
    this.isLoaded = true,
    this.fontSize = 14,
    this.isShowTooltip = false,
    this.boldLabel = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        !hasBackground
            ? Text(
                label,
                style: TextStyle(
                  color: boldLabel! ? AppColors.blackText : AppColors.greyText,
                  fontWeight: boldLabel! ? FontWeight.w600 : null,
                  fontSize: boldLabel! ? 14 : 13,
                ),
              )
            : Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: AppColors.greyText,
                    fontSize: 13,
                  ),
                ),
              ),
        SizedBox(width: 16.0),
        !hasBackground
            ? Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  decoration: hasBackground
                      ? BoxDecoration(
                          color: background,
                          borderRadius: BorderRadius.circular(20),
                        )
                      : null,
                  padding: hasBackground ? const EdgeInsets.symmetric(horizontal: 5, vertical: 2) : null,
                  child: isShowTooltip
                      ? Tooltip(
                          message: value,
                          child: Text(
                            value,
                            maxLines: (multiLine) ? 3 : 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: hasBackground ? Colors.white : textColor,
                              fontSize: hasBackground ? 12 : 14,
                              fontWeight: FontWeight.w700,
                              letterSpacing: hasBackground ? letterSpacing : 0,
                            ),
                          ),
                        )
                      : Text(
                          value,
                          maxLines: (multiLine) ? 3 : 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: hasBackground ? Colors.white : textColor,
                            fontSize: hasBackground ? 12 : 14,
                            fontWeight: FontWeight.w700,
                            letterSpacing: hasBackground ? letterSpacing : 0,
                          ),
                        ),
                ),
              )
            : Container(
                alignment: Alignment.centerRight,
                decoration: hasBackground
                    ? BoxDecoration(
                        color: background,
                        borderRadius: BorderRadius.circular(20),
                      )
                    : null,
                padding: hasBackground ? const EdgeInsets.symmetric(horizontal: 5, vertical: 2) : null,
                child: Text(
                  value,
                  maxLines: (multiLine) ? 3 : 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: hasBackground ? Colors.white : textColor,
                    fontSize: hasBackground ? 12 : fontSize,
                    fontWeight: FontWeight.w700,
                    letterSpacing: hasBackground ? letterSpacing : 0,
                  ),
                ),
              )
      ],
    );
  }
}
