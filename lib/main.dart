import 'package:flutter/material.dart';

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
