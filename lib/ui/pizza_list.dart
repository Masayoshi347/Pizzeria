import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzaria/model/pizza.dart';
import 'package:pizzaria/model/pizza_data.dart';
import 'package:pizzaria/ui/pizza_details.dart';
import 'package:pizzaria/ui/share/buy_button_widget.dart';
import 'package:pizzaria/ui/share/appbar_widget.dart';
import 'package:pizzaria/model/cart.dart';

class PizzaList extends StatefulWidget {
  final Cart _cart;
  const PizzaList(this._cart,{Key? key}) : super(key: key);

  @override
  _PizzaListState createState() => _PizzaListState();
}

class _PizzaListState extends State<PizzaList> {

  List<Pizza> _pizza = [];

  @override
  void initState() {
    _pizza = PizzaData.buildList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget('Nos Pizzas', widget._cart),
        body: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: _pizza.length,
            itemBuilder: (context, index) {
              return _buildRow(_pizza[index]);
            }));
  }

  _buildRow(Pizza pizza) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10.0), top: Radius.circular(2.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PizzaDetails(pizza, widget._cart),
                ),
              );
            },
            child: _buildPizzaDetails(pizza),
          ),
          BuyButtonWidget(pizza, widget._cart),
        ],
      ),
    );
  }

  _buildPizzaDetails(Pizza pizza) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(pizza.title),
          subtitle: Text(pizza.garniture),
          leading: Icon(Icons.local_pizza),
        ),
        Image.asset(
          'asset/images/pizzas/${pizza.image}',
          height: 120,
          width: MediaQuery
              .of(context)
              .size
              .width,
          fit: BoxFit.fitWidth,
        ),
        Container(
          padding: const EdgeInsets.all(4.0),
          child: Text(pizza.garniture),
        ),
      ],
    );
  }
}


