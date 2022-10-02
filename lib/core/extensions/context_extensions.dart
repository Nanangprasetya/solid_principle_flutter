import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ContextExtensions on BuildContext {
  bool get isDesktop => this.width <= 1200;
}
