import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, Key? key}) : super(key: key);

  // Campos em uma subclase Widget são sempre marcados como "final".

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56.0, // pixels independente do dispositivo
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(color: Colors.blue[500]),
        // Row é um layout linear horizontal
        child: Row(
          // <Widget> é o tipo de item na lista
          children: [
            const IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: null, // null desabilita o botão
            ),
            // Expanded expande seus filhos
            // para preencher o espaço disponível
            Expanded(child: Center(child: title)),

            const IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
            )
          ],
        ));
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material é um pedaço de papel
    // conceitual no qual a UI aparece
    return Material(
        // Column é um layout vertical linear
        child: Column(children: [
      MyAppBar(title: Text('Meu Olá Mundo Modificado', style: Theme.of(context).primaryTextTheme.headline6)),
      const Expanded(child: Center(child: Text('Olá Mundo!!!')))
    ]));
  }
}

void main() {
  // Os widgets do material design precisam ficar dentro de um MaterialApp para
  // aparecerem do jeito correto
  runApp(const MaterialApp(title: 'My App', home: SafeArea(child: MyScaffold())));
}
