// Flutter imports:
import 'package:flutter/material.dart';

extension MaterialPropX<T> on T {
  WidgetStateProperty<T> get wrapMatProp =>
      WidgetStateProperty.resolveWith<T>((states) => this);
}

extension NumWidgetExtension on num {
  Widget get hGap => SizedBox(
        height: toDouble(),
      );
  Widget get wGap => SizedBox(
        width: toDouble(),
      );
}
