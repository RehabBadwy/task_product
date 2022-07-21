import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_product/home/check_out.dart';
import 'package:task_product/home/details.dart';
import 'package:task_product/model/item.dart';
import 'package:task_product/provider/cart.dart';
import 'package:task_product/shared/appbar.dart';
import 'package:task_product/shared/colors.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName ="home";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/test.jpg"),
                      fit: BoxFit.cover
                    )
                  ),
                  currentAccountPicture: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("assets/images/avatar.png"),
                  ),
                    accountName: Text("Rehab Badawy",
                style: TextStyle(
                  fontSize: 18,
                    color: Color.fromARGB(255, 255, 255, 255)
                ),
        ),
                    accountEmail: Text("rehabbadwy0@gmail.com",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)
                    ),
                    )),
                ListTile(
                  title: Text("Home"),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  leading: Icon(Icons.home),
                ),
                ListTile(
                  title: Text("My Product"),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckOutScreen(),
                      ),
                    );
                  },
                  leading: Icon(Icons.add_shopping_cart),
                ),
                ListTile(
                  title: Text("about"),
                  leading: Icon(Icons.help_center),
                ),
                ListTile(
                  title: Text("Log Out"),
                  leading: Icon(Icons.exit_to_app),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.only(bottom: 12),
                child: Text("Rehab Flutter Developer"))
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          AppBarProduct()
        ],
        backgroundColor: appbarGreen,
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3/2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 33
            ),
            itemCount: items.length,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(product: items[index]),
                    ),
                  );
                },
                child: GridTile(
                    child: Stack(
                      children: [
                        Positioned(
                        right: 0,
                        left: 0,
                        top: -3,
                        bottom: -9,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(55),
                            child: Image.asset(items[index].imgPath,
                            )
                        ),
                      ),
                      ],
                    ),
                  footer: GridTileBar(
                    trailing: Consumer<Cart>(
                        builder: ((context, Cart, child) {
                          return IconButton(
                            color: Color.fromARGB(255, 62, 94, 70),
                            icon: Icon(Icons.add),
                            onPressed: (){
                              Cart.add(items[index]);
                            },
                          );
                        })),

                    title: Text(""),
                    leading: Text("${items[index].price}"),
                  ),
                ),
              );
            }),
      ),
    );
  }
}