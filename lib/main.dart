import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:task_product/home/check_out.dart';
import 'package:task_product/home/details.dart';
import 'package:task_product/home/home.dart';
import 'package:task_product/provider/cart.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51LNvc7G2dRfxLDYmYogoCxtJyROZGfH4pk9T7QdqqpHcvczaUB4bMelLMLGHxP4JJ7gPT9Rvc1ugEhhm8IQQu0Gz00LD3ZTWFo';

  await Stripe.instance.applySettings();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){
        return Cart();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Product',
        routes: {
          HomeScreen.routeName:(context) => HomeScreen(),
          CheckOutScreen.routeName:(context) =>CheckOutScreen(),
        },
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
