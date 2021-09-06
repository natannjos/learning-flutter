import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: 'Tutorial de Flutter', home: TutorialHome()));
}

class TutorialHome extends StatelessWidget {
  const TutorialHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold é um layout para
    // a maioria dos Componentes Material
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          onPressed: null,
          icon: Icon(Icons.menu),
          tooltip: 'Menu de Navegação',
        ),
        title: const Text('Título de Exemplo'),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: 'Search',
          )
        ],
      ),
      body: const Center(
        child: Text('Texto do Contador'),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
        tooltip: 'Add',
      ),
    );
  }
}
