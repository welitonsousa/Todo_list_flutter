import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_user_bloc/data/data.dart';
import 'package:list_user_bloc/widgets/menu.dart';
import '../list_conteudo_bloc.dart';
import 'dialog_edit.dart';

menuConteudoPage({
  Conteudo conteudo,
  BuildContext context,
  String idTarefa,
  ConteudoBloc controllerBloc,
  TextEditingController controller,
}) {
  Menu().showOptions(
    context,
    1,
    children: [
      containerBox(
        title: 'Editar',
        onPressed: () {
          Navigator.pop(context);
          controller.text = conteudo.conteudoName;
           editConteudo(
              conteudo: conteudo,
              idUser: idTarefa,
              context: context,
              controller: controller,
              controllerBloc: controllerBloc);
          
        },
      ),
      containerBox(
        title: 'Deletar',
        onPressed: () {
          controllerBloc.deleteConteudo(
              idConteudo: conteudo.idConteudo, idTarefa: idTarefa);
          Navigator.pop(context);
        },
      )
    ],
  );
}

containerBox({String title, Function onPressed}) {
  return ConstrainedBox(
    constraints: const BoxConstraints(minWidth: double.infinity),
    child: FlatButton(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            '$title',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        onPressed: onPressed),
  );
}
