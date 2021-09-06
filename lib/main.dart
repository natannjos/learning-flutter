import 'package:flutter/material.dart';

class Product {
  const Product({required this.name});
  final String name;
}

typedef CartChangeCalback = Function(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem(
      // Este é apenas um construtor do widget
      {required this.product,
      required this.inCart,
      required this.onCartChanged})
      : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangeCalback onCartChanged;

  Color _getColor(BuildContext context) {
    // O tema depende do BuildContext pois diferentes
    // partes da árvore podem ter temas diferentes.
    // o BuildContext indica onde o build está
    // indicando assim qual tema usar

    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return const TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          onCartChanged(product, inCart);
        },
        leading: CircleAvatar(
            backgroundColor: _getColor(context), child: Text(product.name[0])),
        title: Text(product.name, style: _getTextStyle(context)));
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: ShoppingListItem(
          product: const Product(name: 'Chips'),
          inCart: true,
          onCartChanged: (product, inCart) {},
        ),
      ),
    ),
  ));
}
