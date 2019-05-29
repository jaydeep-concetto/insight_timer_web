import 'package:flutter_web/material.dart';
import 'dart:math';

mixin ScrollListener {
  Future<double> setOpacity(
      double opacityLevel, ScrollController _scrollController) async {
    double newOpacity;

    double opacity = max(0, min(1, (-50 + _scrollController.offset) / 50));

    if (opacity != 0.0 && opacity != 1.0) {
      newOpacity = opacity;
    } else if (_scrollController.offset <= 50) {
      if (opacityLevel != 0.0) {
        newOpacity = 0.0;
      }
    } else {
      if (opacityLevel != 1.0) {
        newOpacity = 1.0;
      }
    }
    return newOpacity;
  }
}
