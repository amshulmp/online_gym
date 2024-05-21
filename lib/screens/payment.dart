// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_gym/config/styles.dart';
import 'package:online_gym/firebasefunctions.dart/functions.dart';
import 'package:online_gym/screens/home.dart';
import 'package:online_gym/widgets/button.dart';
import 'package:online_gym/widgets/neumorphicbox.dart';

class PaymentScreen extends StatelessWidget {
  final String traineremail;
  const PaymentScreen({super.key, required this.traineremail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  16.0),
        child: NeumorphicBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("₹${999}/-",style: Styles.title(context),),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: CustomLoginButton(text: "Pay", onPress: ()async{
                 Timestamp premiumExpire = Timestamp.fromDate(DateTime.now().add(const Duration(days: 365)));
                  await updateprofile({
                    "premiumpaid":true,
                    "premiumexpire":premiumExpire
                  });
                  await addpayment({"id": traineremail,
                  "amount": 999});
                  Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const HomeScreen()));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}