import 'package:flutter/material.dart';

import 'pages/list tarefas/list_tarefas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarefas',
      debugShowCheckedModeBanner: false,
      home: ListTarefas()
    );
  }
}

