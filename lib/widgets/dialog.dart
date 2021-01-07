import 'package:flutter/material.dart';
import 'package:list_user_bloc/utils/constants.dart';

Future<bool> showInfo({
  @required BuildContext context,
  @required Widget content,
  String label = '',
  String textCancel,
  String textOK = 'OK',
  Function cancelAction,
  Function conformAction,
}) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              "$label",
              style: TextStyle(color: colorMain),
            ),
            content: content,
            actions: <Widget>[
              textCancel != null
                  ? FlatButton(
                      child: Text(
                        '$textCancel',
                        style: TextStyle(color: colorMain),
                      ),
                      onPressed: () {
                        Navigator.pop(context, false);
                        if (cancelAction != null) cancelAction();
                      })
                  : Container(),
              FlatButton(
                  child: Text(
                    '$textOK',
                    style: TextStyle(color: colorMain),
                  ),
                  onPressed: () {
                    if (conformAction != null)
                      conformAction();
                    else {
                      Navigator.pop(context);
                    }
                  }),
            ],
          ));
}
