import 'package:flutter/material.dart';

class Input {
  static Widget textFormField({TextEditingController controller}) {
    return TextFormField(
      autofocus: true,
      controller: controller,
    );
  }
}
