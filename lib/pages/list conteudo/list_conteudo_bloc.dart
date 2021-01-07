import 'package:flutter/material.dart';
import 'package:list_user_bloc/bloc/generic_bloc.dart';
import 'package:list_user_bloc/data/data.dart';
import 'package:list_user_bloc/pages/list%20tarefas/list_tarefas_bloc.dart';

class ConteudoBloc extends GenericBloc<List<Conteudo>> {
  void addConteudo({@required String conteudo, @required String idTarefa}) {
    int indexUser = _indexTarefa(idTarefa: idTarefa);
    tarefas[indexUser].conteudo.add(Conteudo(conteudoName: conteudo));
    add(tarefas[indexUser].conteudo);
    TarefasBloc().salvarTarefas();
    TarefasBloc().getTarefas();
  }

  void deleteConteudo({@required String idConteudo, String idTarefa}) {
    int indexUser = _indexTarefa(idTarefa: idTarefa);
    int indexDetalhe =
        _indexConteudo(idTarefa: idTarefa, idConteudo: idConteudo);
    tarefas[indexUser].conteudo.removeAt(indexDetalhe);
    add(tarefas[indexUser].conteudo);
    TarefasBloc().salvarTarefas();
    TarefasBloc().getTarefas();
  }

  void editConteudo(
      {@required String idConteudo,
      @required String idTarefa,
      @required String editDetalhe,
      @required bool checked}) {
    int indexDetalhe =
        _indexConteudo(idTarefa: idTarefa, idConteudo: idConteudo);
    int indexUser = _indexTarefa(idTarefa: idTarefa);

    tarefas[indexUser].conteudo[indexDetalhe].conteudoName = editDetalhe;
    tarefas[indexUser].conteudo[indexDetalhe].checked = checked;
    add(tarefas[indexUser].conteudo);
    TarefasBloc().salvarTarefas();
    TarefasBloc().getTarefas();
  }

  int _indexTarefa({@required String idTarefa}) {
    return tarefas.indexWhere((element) => element.uuid == idTarefa);
  }

  _indexConteudo({@required String idTarefa, @required String idConteudo}) {
    int indexUser = _indexTarefa(idTarefa: idTarefa);
    var a = tarefas[indexUser]
        .conteudo
        .indexWhere((element) => element.idConteudo == idConteudo);
    return a;
  }
}
