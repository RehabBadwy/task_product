import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:task_product/shared/appbar.dart';
import 'package:task_product/shared/colors.dart';
import 'package:http/http.dart' as http;

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  Map<String, dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text("Payment Screen"),
        actions: [
          AppBarProduct()
        ],
      ),
      body: Column(
        children: [
          InkWell(
            onTap: ()async{
               await makePayment(amount: '5', currency: 'USD');
            },
            child: Container(
              height: 50,
              width: 200,
              color: Colors.green,
              child: Center(
                child: Text('Pay' , style: TextStyle(color: Colors.white , fontSize: 20),),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> makePayment(
      {required String amount, required String currency}) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              applePay: true,
              googlePay: true,
              testEnv: true,
              merchantCountryCode: 'US',
              merchantDisplayName: 'Prospects',
              customerId: paymentIntentData!['customer'],
              paymentIntentClientSecret: paymentIntentData!['client_secret'],
              customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
            ));
        displayPaymentSheet();
      }
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      Get.snackbar('Payment', 'Payment Successful',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 2));
    } on Exception catch (e) {
      if (e is StripeException) {
        print("Error from Stripe: ${e.error.localizedMessage}");
      } else {
        print("Unforeseen error: ${e}");
      }
    } catch (e) {
      print("exception:$e");
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'Bearer Your Stripe Secret Key',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }

  // Future<void> makePayment()async{
  //   try{
  //     paymentIntentData =
  //     await createPaymentIntent('20', 'USD'); //json.decode(response.body);
  //     // print('Response body==>${response.body.toString()}');
  //     await Stripe.instance.initPaymentSheet(
  //         paymentSheetParameters: SetupPaymentSheetParameters(
  //             paymentIntentClientSecret: paymentIntentData!['client_secret'],
  //             applePay: true,
  //             googlePay: true,
  //             testEnv: true,
  //             style: ThemeMode.dark,
  //             merchantCountryCode: 'US',
  //             merchantDisplayName: 'ANNIE')).then((value){
  //     });
  //     displayPaymentSheet();
  //   }catch (e, s) {
  //     print('exception:$e$s');
  //   }
  // }
  //
  // displayPaymentSheet() async {
  //
  //   try {
  //     await Stripe.instance.presentPaymentSheet(
  //         parameters: PresentPaymentSheetParameters(
  //           clientSecret: paymentIntentData!['client_secret'],
  //           confirmPayment: true,
  //         )).then((newValue){
  //
  //
  //       print('payment intent'+paymentIntentData!['id'].toString());
  //       print('payment intent'+paymentIntentData!['client_secret'].toString());
  //       print('payment intent'+paymentIntentData!['amount'].toString());
  //       print('payment intent'+paymentIntentData.toString());
  //       //orderPlaceApi(paymentIntentData!['id'].toString());
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("paid successfully")));
  //
  //       paymentIntentData = null;
  //
  //     }).onError((error, stackTrace){
  //       print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
  //     });
  //
  //
  //   } on StripeException catch (e) {
  //     print('Exception/DISPLAYPAYMENTSHEET==> $e');
  //     showDialog(
  //         context: context,
  //         builder: (_) => AlertDialog(
  //           content: Text("Cancelled "),
  //         ));
  //   } catch (e) {
  //     print('$e');
  //   }
  // }
  //
  // createPaymentIntent(String amount, String currency) async {
  //   try {
  //     Map<String, dynamic> body = {
  //       'amount': calculateAmount('20'),
  //       'currency': currency,
  //       'payment_method_types[]': 'card'
  //     };
  //     print(body);
  //     var response = await http.post(
  //         Uri.parse('https://api.stripe.com/v1/payment_intents'),
  //         body: body,
  //         headers: {
  //           'Authorization': 'Bearer sk_test_51LNvc7G2dRfxLDYmENrFSQWqS0Sqihp1v6c8a2jLEvDPHn1gacnpkAmgEyc2Vz7pejdurTdG5vqJMMYpWigW9cJm00tEH1Gy7M',
  //           'Content-Type': 'application/x-www-form-urlencoded'
  //         });
  //     print('Create Intent reponse ===> ${response.body.toString()}');
  //     return jsonDecode(response.body);
  //   } catch (err) {
  //     print('err charging user: ${err.toString()}');
  //   }
  // }
  // calculateAmount(String amount) {
  //   final a = (int.parse(amount)) * 100 ;
  //   return a.toString();
  // }
}





