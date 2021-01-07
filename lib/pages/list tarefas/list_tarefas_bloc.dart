import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:list_user_bloc/bloc/generic_bloc.dart';
import 'package:list_user_bloc/data/data.dart';
import 'package:list_user_bloc/utils/prefs.dart';

List<Tarefa> tarefas = [];
class TarefasBloc extends GenericBloc<List<Tarefa>> {
  void getTarefas() async {
    
    String _tarefas = await Prefs.getString('tarefas');
    if (_tarefas.isNotEmpty) {
      List tarefaMap = json.decode(_tarefas);
      tarefas = tarefaMap.map((e) => Tarefa.fromJson(e)).toList();
    }
    controller.add(tarefas);
  }

  void postTarefa(String text) {
    tarefas.add(Tarefa(nome: text));
    salvarTarefas();
    getTarefas();
  }

  void deleteTarefa({@required String idTarefa}) {
    int indexTarefa = _indexTarefa(idTarefa: idTarefa);
    tarefas.removeAt(indexTarefa);
    salvarTarefas();
    controller.add(tarefas);
    getTarefas();
  }

  void editTarefa({@required String idTarefa, @required String name}) {
    int indexTarefa = _indexTarefa(idTarefa: idTarefa);
    tarefas[indexTarefa].nome = name;
    salvarTarefas();
    controller.add(tarefas);
    getTarefas();
  }

  void salvarTarefas() async {
    List listTarefasJson = tarefas.map((e) => e.toJson()).toList();
    await Prefs.setString('tarefas', json.encode(listTarefasJson));
  }

  int _indexTarefa({@required String idTarefa}) {
    return tarefas.indexWhere((element) => element.uuid == idTarefa);
  }

  TarefasBloc() {
    getTarefas();
  }
}
