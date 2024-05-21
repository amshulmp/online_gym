// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:online_gym/firebasefunctions.dart/functions.dart';
import 'package:online_gym/screens/home.dart';
import 'package:online_gym/screens/selecttrainer.dart';
import 'package:online_gym/widgets/button.dart';
import 'package:online_gym/widgets/neumorphicbox.dart';

class ChooseAplan extends StatelessWidget {
  const ChooseAplan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NeumorphicBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Choose A Plan To Continue",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
          CustomLoginButton(text: "Base Plan(free)", onPress: () async{
           await updateprofile({"plan":"base"});
             Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const HomeScreen()));
          }),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("In base plan you will get a diet and workout plan."),
          ),
          CustomLoginButton(text: "Premium Plan  ₹ 999/year", onPress: () async{
              await updateprofile({"plan":"premium"});
               Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const SelectTrainer()));
          }),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                "In base plan you will get a diet and workout plan,and you can also select a trainer to assist you in your workout."),
          ),
        ],
      )),
    );
  }
}
