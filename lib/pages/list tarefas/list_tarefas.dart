import 'package:flutter/material.dart';
import 'package:list_user_bloc/data/data.dart';
import 'package:list_user_bloc/pages/list%20conteudo/list_conteudo.dart';
import 'package:list_user_bloc/pages/list%20tarefas/list_tarefas_bloc.dart';
import 'package:list_user_bloc/pages/list%20tarefas/widget%20tarefas/menu.dart';
import 'package:list_user_bloc/widgets/dialog.dart';
import 'package:list_user_bloc/widgets/text_form_field.dart';

class ListTarefas extends StatefulWidget {
  @override
  _ListTarefasState createState() => _ListTarefasState();
}

class _ListTarefasState extends State<ListTarefas> {
  final controller = TextEditingController();

  final TarefasBloc controllerBloc = TarefasBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas'),
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
                  content: Input.textFormField(controller: controllerAddTarefa));
            },
          )
        ],
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
