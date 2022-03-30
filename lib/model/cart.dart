import 'package:flutter/material.dart';
import 'package:pizzaria/model/pizza.dart';

class CartItem{
  final Pizza pizza;
  int quantity;

  CartItem(this.pizza, [this.quantity = 1]);
}

class Cart{
  List<CartItem> _items = [];

  int totalItems() { return _items.length; }
  CartItem getCartItem(int index) {
    return _items[index];
  }

  double totalPanier() {
    double total = 0;

    _items.forEach((item) {
      total += item.pizza.total * item.quantity;
    });

    return total;
  }

  double totalPanierHT() {
    double totalHT = 0;
    double tva = 1.2;

     _items.forEach((item) {
       totalHT += ((item.pizza.total * item.quantity) / tva).round();

     });

     return totalHT;
  }

  void addProduct(Pizza pizza){
    int index = findCartItemIndex(pizza.id);
    if (index == -1) {
      _items.add(CartItem(pizza));
    } else {
      CartItem item= _items[index];
      item.quantity++;
    }
  }

  void removeProduct(Pizza pizza) {
    int index = findCartItemIndex(pizza.id);
    if (index != -1) {
      _items.removeAt(index);
    }
  }

  int findCartItemIndex(int id) {
    return _items.indexWhere((element) => element.pizza.id == id);
  }
}