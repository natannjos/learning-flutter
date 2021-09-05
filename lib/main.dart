import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, Key? key}) : super(key: key);

  // Campos em uma subclase Widget são sempre marcados como "final".

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56.0, // em pixels
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
            Expanded(
              child: title,
            ),

            const IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
            )
          ],
        ));
  }
}

void main() {
  // A função runApp torna o Widget a raiz da árvore.
  // No caso abaixo existem dois Widgets: Center e seu filho Text.
  // O framework força o widget raiz a cobrir a tela
  runApp(const Center(
    child: Text(
      'Hello World!',
      textDirection: TextDirection.ltr,
    ),
  ));
}
