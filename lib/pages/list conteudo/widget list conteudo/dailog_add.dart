import 'package:flutter/material.dart';
import 'package:list_user_bloc/widgets/dialog.dart';
import 'package:list_user_bloc/widgets/text_form_field.dart';

import '../list_conteudo_bloc.dart';

Widget iconAddConteudo({
  BuildContext context,
  String idTarefa,
  ConteudoBloc controllerBloc,
}) {
  TextEditingController controller = TextEditingController();

  void _confirm() {
    if (controller.text.trim().isNotEmpty) {
      controllerBloc.addConteudo(
          conteudo: controller.text.trim(), idTarefa: idTarefa);
      controller.clear();
      Navigator.pop(context);
    }
  }

  return IconButton(
    icon: Icon(Icons.add),
    onPressed: () {
      showInfo(
        context: context,
        label: 'Add detalhe',
        content: Input.textFormField(
            controller: controller,
            onEditingComplete: () {
              _confirm();
            }),
        textOK: 'Confirmar',
        confirmAction: () {
          _confirm();
        },
      );
    },
  );
}
