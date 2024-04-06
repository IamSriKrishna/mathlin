import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math/Maps/Widget/MapAppBar.dart';
import 'package:math/Payment/Widget/CustomPayment.dart';
import 'package:u_credit_card/u_credit_card.dart';
import 'package:flutter_upi_pay/flutter_upi_pay.dart';
class PaymentScreen extends StatefulWidget {
  
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  FlutterPayment flutterPayment = FlutterPayment();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromRGBO(254, 250, 224, 1),
      body: CustomScrollView(
        slivers: [
          const MapCustomAppBar(
            text: 'Payment',
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding:  EdgeInsets.all(8.0),
              child: CreditCardUi(
                cardHolderFullName: 'Karthar Sanjeev',
                cardNumber: '1234567812345678',
                validThru: '10/24',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(onPressed: (){
              flutterPayment.launchUpi(
              upiId: "nalinidina@okhdfcbank",
              name: "Get_In",
              amount: "100",
              message: "PickUp/Drop Fee",
              currency: "INR");
            }, child: Text('Payment Option')),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(onPressed: (){}, child: Text('Top Up Money')),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(onPressed: (){
              Get.to(()=>MySample());
            }, child: Text('EXISTING CARD DETAILS')),
          ),
        ],
      ),
    );
  }
}
