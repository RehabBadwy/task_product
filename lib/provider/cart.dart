import 'package:flutter/material.dart';
import 'package:task_product/model/item.dart';

class Cart with ChangeNotifier{
  int price = 0 ;
  List selectedProduct = [

  ];
  add(Item product){
    selectedProduct.add(product);
    price += product.price.round();
    notifyListeners();
  }
  remove(Item product){
    selectedProduct.remove(product);
    price -= product.price.round();
    notifyListeners();
  }
}