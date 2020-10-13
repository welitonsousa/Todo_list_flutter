import 'package:flutter/material.dart';
import 'package:list_user_bloc/data/data.dart';
import 'package:list_user_bloc/pages/list%20conteudo/list_conteudo_user.dart';
import 'package:list_user_bloc/pages/list%20tarefas/list_taredas_bloc.dart';
import 'package:list_user_bloc/pages/list%20tarefas/widget%20tarefas/menu.dart';
import 'package:list_user_bloc/widgets/dialog.dart';
import 'package:list_user_bloc/widgets/text_form_field.dart';

class ListTarefas extends StatelessWidget {
  final controller = TextEditingController();
  final TarefasBloc controllerBloc = TarefasBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              TextEditingController controllerAddTarefa = TextEditingController();
              showInfo(
                  context: context,
                  label: 'Adicionar Tarefa',
                  textOK: 'Confirmar',
                  conformAction: () {
                    if (controllerAddTarefa.text.trim().isNotEmpty) {
                      controllerBloc.postTarefa(controllerAddTarefa.text.trim());
                      controllerAddTarefa.clear();
                      Navigator.pop(context);
                    }
                  },
                  content: textFormField(controller: controllerAddTarefa));
            },
          )
        ],
        title: Text('Tarefas'),
      ),
      body: _body(),
    );
  }

  _body() {
    return StreamBuilder<List<Tarefa>>(
      stream: controllerBloc.stream,
      initialData: [],
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalhesList(
                      tarefa: snapshot.data[index],
                    ),
                  ),
                );
              },
              title: Text(snapshot.data[index].nome),
              onLongPress: (){
                controller.text = snapshot.data[index].nome;
                menuTarefas(context: context, tarefa: snapshot.data[index], controllerBloc: controllerBloc, controller: controller);
              },
            );
          },
        );
      },
    );
  }
}
