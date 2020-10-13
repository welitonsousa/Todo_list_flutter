import 'package:flutter/material.dart';

class Menu {
  void showOptions(BuildContext context, int index, {List<Widget> children}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                child: ListView(
                  shrinkWrap: true,
                  children: children,
                ),
              );
            },
          );
        });
  }
}
