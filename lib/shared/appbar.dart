import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_product/home/check_out.dart';
import 'package:task_product/provider/cart.dart';

class AppBarProduct extends StatelessWidget {
  const AppBarProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Consumer<Cart>(
        builder: ((context, classInstancee, child) {
          return Row(
            children: [
              Stack(
                children: [

                  Positioned(
                    bottom: 24,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(211, 164, 255, 193),
                          shape: BoxShape.circle
                      ),
                      child: Text(
                        "${classInstancee.selectedProduct.length}",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(225, 0, 0, 0)
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CheckOutScreen(),
                          ),
                        );
                      },
                      icon: Icon(Icons.add_shopping_cart)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 12
                ),
                child: Text("\$ ${classInstancee.price}",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
