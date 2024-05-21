// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:online_gym/firebasefunctions.dart/functions.dart';
import 'package:online_gym/screens/details2.dart';
import 'package:online_gym/widgets/button.dart';
import 'package:online_gym/widgets/textbox.dart';
import '../widgets/neumorphicbox.dart';

class Details1Page extends StatefulWidget {
  const Details1Page({super.key});

  @override
  State<Details1Page> createState() => _Details1PageState();
}

class _Details1PageState extends State<Details1Page> {
  late TextEditingController weightController = TextEditingController();
  late TextEditingController heightController = TextEditingController();
  late TextEditingController ageController = TextEditingController();
  String gender = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeumorphicBox(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Enter Details",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Textbox(
                              hideText: false,
                              tcontroller: weightController,
                              type: TextInputType.number,
                              hinttext: "Weight in Kg",
                              icon: Icon(Icons.monitor_weight,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Textbox(
                              hideText: false,
                              tcontroller: heightController,
                              type: TextInputType.number,
                              hinttext: "Height in Cm",
                              icon: Icon(Icons.height_rounded,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Textbox(
                              hideText: false,
                              tcontroller: ageController,
                              type: TextInputType.number,
                              hinttext: "Age",
                              icon: Icon(Icons.view_agenda,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                          ),
                          Text(
                            "Gender",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Row(
                            children: [
                              Radio<String>(
                                value: "Male",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value!;
                                  });
                                },
                              ),
                              Text("Male",
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              Radio<String>(
                                value: "Female",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value!;
                                  });
                                },
                              ),
                              Text("Female",
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomLoginButton(
                                text: "next",
                                onPress: () async{
                                 
                                  if (weightController.text.isEmpty ||
                                      heightController.text.isEmpty ||
                                      ageController.text.isEmpty ||
                                      gender.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Please fill all fields")),
                                    );
                                  } else {
                                     await updateprofile({
                                    "weight":int.parse(weightController.text.trim()),
                                    "height":int.parse(heightController.text.trim()),
                                    "age":int.parse(ageController.text.trim()),
                                    "gender":gender
                                  });
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const Details2Page()));
                                  }
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
