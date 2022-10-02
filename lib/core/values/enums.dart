import 'package:flutter/material.dart';

typedef TypeResponsive<S> = Widget? Function(BuildContext context);

enum TypeButton { elevatedButton, textButton, outlinedButton, disableButton }

enum MainTab { article, photos, users }
