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
    const double fontSize = 20.0;
    if (!inCart) return const TextStyle(fontSize: fontSize);
    return const TextStyle(
        color: Colors.black54,
        fontSize: fontSize,
        decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      onChanged: (bool) {
        onCartChanged(product, inCart);
      },
      value: inCart,
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({required this.products, Key? key}) : super(key: key);

  final List<Product> products;

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // Quando um usuario muda o que está no carrinho, é preciso
      // mudar o _shoppingCart dentro de uma chamada setState()
      // para rodar o rebuild.
      // O framework chama o build abaixo
      // que atualiza a aparência do app.

      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Compras')),
      body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: widget.products.map((Product product) {
            return ShoppingListItem(
                product: product,
                inCart: _shoppingCart.contains(product),
                onCartChanged: _handleCartChanged);
          }).toList()),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'App de Compras',
    home: ShoppingList(products: [
      Product(name: 'Ovos'),
      Product(name: 'Leite'),
      Product(name: 'Chocolate')
    ]),
  ));
}
