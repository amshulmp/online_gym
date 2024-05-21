// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:online_gym/firebasefunctions.dart/functions.dart';
import 'package:online_gym/screens/dietPlan.dart';
import 'package:online_gym/widgets/button.dart';
import 'package:online_gym/widgets/neumorphicbox.dart';

class ChooseDiet extends StatelessWidget {
  const ChooseDiet({super.key});

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
              "Choose Diet Type",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          CustomLoginButton(
              text: "Weight Loss",
              onPress: () async {
                await updateprofile({"diet": "Weight Loss"});
                Navigator.pop(context);
                 Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const DietPlans(dietplan: "Weight Loss",)));
              }),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("you will get a diet plan for Weight Loss."),
          ),
          CustomLoginButton(
              text: "Gain Weight",
              onPress: () async {
                await updateprofile({"diet": "Gain Weight"});
               Navigator.pop(context);
                 Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const DietPlans(dietplan:"Gain Weight",)));
              }),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                "you will get a diet plan to Gain Weight."),
          ),
          CustomLoginButton(
              text: "Maintain Weight",
              onPress: () async {
                await updateprofile({"diet": "Maintain Weight"});
                Navigator.pop(context);
                 Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const DietPlans(dietplan:  "Maintain Weight",)));
              }),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                "you will get a diet plan to Maintain Weight."),
          ),
        ],
      )),
    );
  }
}
