import 'package:flutter/material.dart';
import 'package:list_user_bloc/data/data.dart';
import 'package:list_user_bloc/pages/list%20conteudo/widget%20list%20conteudo/dailog_add.dart';
import 'package:list_user_bloc/pages/list%20conteudo/widget%20list%20conteudo/menu.dart';
import 'list_conteudo_bloc.dart';

class DetalhesList extends StatefulWidget {
  final Tarefa tarefa;
  DetalhesList({this.tarefa});
  @override
  _DetalhesListState createState() => _DetalhesListState();
}

class _DetalhesListState extends State<DetalhesList> {
  ConteudoBloc controllerConteudoBloc = ConteudoBloc();
  TextEditingController controllerConteudo = TextEditingController();

  @override
  void initState() {
    controllerConteudoBloc.add(widget.tarefa.conteudo);
    super.initState();
  }
@override
  void dispose() {
    controllerConteudoBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.tarefa.nome}'),
        actions: [
          iconAddConteudo(
            idTarefa: widget.tarefa.uuid,
            context: context,
            controllerBloc: controllerConteudoBloc,
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return StreamBuilder<List<Conteudo>>(
      stream: controllerConteudoBloc.stream,
      initialData: [],
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('${snapshot.data[index].conteudoName}'),
              leading: Checkbox(
                value: snapshot.data[index].checked,
                onChanged: (e) {
                  controllerConteudoBloc.editConteudo(
                      idConteudo: snapshot.data[index].idConteudo,
                      idTarefa: widget.tarefa.uuid,
                      editDetalhe: snapshot.data[index].conteudoName,
                      checked: e);
                  snapshot.data[index].checked = e;
                },
              ),
              onLongPress: () {
                menuConteudoPage(
                    conteudo: snapshot.data[index],
                    idTarefa: widget.tarefa.uuid,
                    controller: controllerConteudo,
                    context: context,
                    
                    controllerBloc: controllerConteudoBloc);
              },
            );
          },
        );
      },
    );
  }
}
