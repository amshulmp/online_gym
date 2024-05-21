// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:online_gym/firebasefunctions.dart/functions.dart';
import 'package:online_gym/screens/details3.dart';
import 'package:online_gym/widgets/button.dart';
import 'package:online_gym/widgets/neumorphicbox.dart';
import 'package:online_gym/widgets/textbox.dart';

class Details2Page extends StatefulWidget {
  const Details2Page({super.key});

  @override
  State<Details2Page> createState() => _Details2PageState();
}

class _Details2PageState extends State<Details2Page> {
  late TextEditingController fitnessGoalController;
  late TextEditingController exerciseFrequencyController;
  late TextEditingController medicalConditionsController;

  @override
  void initState() {
    super.initState();
    fitnessGoalController = TextEditingController();
    exerciseFrequencyController = TextEditingController();
    medicalConditionsController = TextEditingController();
  }

  @override
  void dispose() {
    fitnessGoalController.dispose();
    exerciseFrequencyController.dispose();
    medicalConditionsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: NeumorphicBox(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Fitness Details",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Textbox(
                              hideText: false,
                              tcontroller: fitnessGoalController,
                              type: TextInputType.text,
                              hinttext: "Fitness Goal",
                              icon: Icon(Icons.fitness_center,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Textbox(
                              hideText: false,
                              tcontroller: exerciseFrequencyController,
                              type: TextInputType.number,
                              hinttext: "Exercise Frequency (per week)",
                              icon: Icon(Icons.access_time,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Textbox(
                              hideText: false,
                              tcontroller: medicalConditionsController,
                              type: TextInputType.text,
                              hinttext: "Medical Conditions (if any)",
                              icon: Icon(Icons.local_hospital,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomLoginButton(
                                text: "next",
                                onPress: () async{
                                  if (fitnessGoalController.text.isEmpty ||
                                      medicalConditionsController
                                          .text.isEmpty ||
                                      exerciseFrequencyController
                                          .text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Please fill all fields")),
                                    );
                                  } else {
                                     await updateprofile({
                                    "goal":fitnessGoalController.text.trim(),
                                    "freequency":int.parse(exerciseFrequencyController.text.trim()),
                                    "medicalcondition":medicalConditionsController.text.trim(),
                                  
                                  });
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const Details3Page()));
                                  }
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
