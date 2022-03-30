import 'package:flutter/material.dart';
import 'package:pizzaria/model/cart.dart';

class Panier extends StatefulWidget {
  final Cart _cart;
  const Panier(this._cart, {Key? key}) : super(key: key);

  @override
  _PanierState createState() => _PanierState();
}


class _PanierState extends State<Panier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Panier'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
              itemCount: widget._cart.totalItems(),
                itemBuilder: (context, index) => _buildItem(widget._cart.getCartItem(index)),
              ),
          ),
          Row(
            children: [
              Text('Total'),
              Text('30 €'),
            ],
          ),
          Container(
            child: ElevatedButton(
              child: Text('Valider'),
              onPressed: () {
                print('Valider');
                MaterialPageRoute(
                  builder: (context) => Panier(widget._cart),
                );
              },
            )),
        ],
      ),
    );
  }

  Widget _buildItem(CartItem cartItem) {

    double _subtotal = (cartItem.pizza.total * cartItem.quantity);

    return Row(
      children: [
      Image.asset(
        'asset/images/pizzas/${cartItem.pizza.image}',
        height: 132,
    ),
    Padding(padding: EdgeInsets.all(3.0),),
    Column (
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(cartItem.pizza.title, style: TextStyle(fontWeight: FontWeight.bold,
    height: 1.8),),
      Text('${cartItem.pizza.total} €', style: TextStyle(color: Colors.grey.shade700,height: 1.8),),
      Text('Sous total : ${_subtotal} €', style: TextStyle(color: Colors.blue.shade800,height: 1.8),)
    ],
    ),
    Row(
    children: <Widget> [
      IconButton(
      icon: const Icon(Icons.remove),
    onPressed: () {
      setState(() {
        widget._cart.removeProduct(cartItem.pizza);
      });
    },
    ),
    Container(
      decoration: BoxDecoration(
      border: Border.all(width: 0.8, color: Colors.grey,),
    ),
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text (' ${cartItem.quantity}'),
    )
    )
    ],
    )
      ],
    );
  }
}
