class Tarefa {
  String nome;
  String uuid;
  List<Conteudo> conteudo;

  Tarefa({this.nome, this.conteudo}) {
    this.conteudo = [];
    this.uuid = '${DateTime.now().millisecondsSinceEpoch}';
  }

  Tarefa.fromJson(Map json) {
    this.nome = json['nome'];
    this.uuid = json['uuid'];

    this.conteudo = new List<Conteudo>();
    json['conteudo'].forEach((v) {
      conteudo.add(new Conteudo.fromJson(v));
    });
  }

  toJson() {
    Map<String, dynamic> map = new Map();
    map['nome'] = this.nome;
    map['uuid'] = this.uuid;
    map['conteudo'] = this.conteudo.map((e) => e.toJson()).toList();
    return map;
  }

  @override
  String toString() {
    return {
      'nome': this.nome,
      'uuid': this.uuid,
      'conteudo': this.conteudo,
    }.toString();
  }
}

class Conteudo {
  String conteudoName;
  String idConteudo;
  bool checked;
  Conteudo({this.conteudoName, this.checked = false}) {
    this.idConteudo = '${DateTime.now().millisecondsSinceEpoch}';
  }
  toJson() {
    Map<String, dynamic> map = new Map();
    map['conteudoName'] = this.conteudoName;
    map['idConteudo'] = this.idConteudo;
    map['checked'] = this.checked;
    return map;
  }

  Conteudo.fromJson(Map json) {
    this.conteudoName = json['conteudoName'];
    this.idConteudo = json['idConteudo'];
    this.checked = json['checked'];
  }
  
}
