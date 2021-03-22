import 'package:flutter/material.dart';
import 'package:list_user_bloc/data/data.dart';
import 'package:list_user_bloc/widgets/dialog.dart';
import 'package:list_user_bloc/widgets/text_form_field.dart';

import '../list_conteudo_bloc.dart';

editConteudo({
  Conteudo conteudo,
  BuildContext context,
  TextEditingController controller,
  String idUser,
  ConteudoBloc controllerBloc,
}) {
  void _confirm() {
    if (controller.text.trim().isNotEmpty) {
      controllerBloc.editConteudo(
          checked: conteudo.checked,
          idConteudo: conteudo.idConteudo,
          editDetalhe: controller.text.trim(),
          idTarefa: idUser);
      controller.clear();
      Navigator.pop(context);
    }
  }

  return showInfo(
    context: context,
    label: 'Editar detalhe',
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
}
