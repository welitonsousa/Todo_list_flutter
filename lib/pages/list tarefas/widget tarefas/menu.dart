import 'package:flutter/cupertino.dart';
import 'package:list_user_bloc/data/data.dart';
import 'package:list_user_bloc/pages/list%20conteudo/widget%20list%20conteudo/menu.dart';
import 'package:list_user_bloc/pages/list%20tarefas/list_tarefas_bloc.dart';
import 'package:list_user_bloc/widgets/dialog.dart';
import 'package:list_user_bloc/widgets/menu.dart';
import 'package:list_user_bloc/widgets/text_form_field.dart';

menuTarefas({
  BuildContext context,
  Tarefa tarefa,
  TarefasBloc controllerBloc,
  TextEditingController controller,
}) {

  Menu().showOptions(context, 1, children: [
    containerBox(
        title: 'Editar',
        onPressed: () {
          Navigator.pop(context);
          showInfo(
            context: context,
            label: 'Editar tarefa',
            content: Input.textFormField(controller: controller),
            textOK: 'Confirmar',
            conformAction: () {
              if (controller.text.trim().isNotEmpty) {
                controllerBloc.editTarefa(
                    idTarefa: tarefa.uuid, name: controller.text.trim());
                controller.clear();
                Navigator.pop(context);
              }
            },
          );
        }),
    containerBox(
        title: 'Deletar',
        onPressed: () {
          controllerBloc.deleteTarefa(idTarefa: tarefa.uuid);
          Navigator.pop(context);
        }),
  ]);
}
