import 'package:flutter/material.dart';

extension ToastExt on BuildContext {
  void showToast({required Widget content}) {
    final snack = SnackBar(
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: content,
      ),
    );
    ScaffoldMessenger.of(this).showSnackBar(snack);
  }
}
