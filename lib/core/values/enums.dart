import 'package:flutter/material.dart';

typedef TypeResponsive<S> = Widget? Function(BuildContext context);

enum TypeButton { elevatedButton, textButton, outlinedButton, disableButton }

enum MainTab { article, photos, users }

enum TypePage { detail, form }

enum TitleValidationError { empty }

enum BodyValidationError { empty }
