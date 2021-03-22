import 'package:flutter/material.dart';

class Input {
  static Widget textFormField({
    TextEditingController controller,
    @required VoidCallback onEditingComplete,
  }) {
    return TextFormField(
      autofocus: true,
      textInputAction: TextInputAction.done,
      controller: controller,
      onEditingComplete: onEditingComplete,
    );
  }
}
