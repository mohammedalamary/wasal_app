import 'package:flutter/material.dart';

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final Color activeColor;

  const CustomRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: activeColor,
    );
  }
}