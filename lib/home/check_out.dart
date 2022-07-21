import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_product/home/payment.dart';
import 'package:task_product/model/item.dart';
import 'package:task_product/provider/cart.dart';
import 'package:task_product/shared/appbar.dart';
import 'package:task_product/shared/colors.dart';

class CheckOutScreen extends StatelessWidget {
  static const String routeName ="check";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text("Checkout Screen"),
        actions: [
          AppBarProduct()
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              height: 550,
              child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: cart.selectedProduct.length,
                  itemBuilder: (context,index){
                    return  Card(
                      child: ListTile(
                        subtitle: Text("${cart.selectedProduct[index].price}"),
                        leading: CircleAvatar(
                          backgroundImage:AssetImage(cart.selectedProduct[index].imgPath),
                        ),
                        title: Text("${cart.selectedProduct[index].name}"),
                        trailing: IconButton(
                            onPressed: () {
                              cart.remove(cart.selectedProduct[index]);
                            },
                            icon: Icon(Icons.remove)),
                      ),
                    );
                  }),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              )),
              padding: MaterialStateProperty.all(EdgeInsets.all(12)),
              backgroundColor: MaterialStateProperty.all(Bink)
            ),
              onPressed:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Payment(),
                  ),
                );
              },
              child:Text("Pay \$ ${cart.price}",
              style: TextStyle(
                fontSize: 19,
              ),
              ) )
        ],
      )
    );
  }
}