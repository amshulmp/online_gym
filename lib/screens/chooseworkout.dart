// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:online_gym/firebasefunctions.dart/functions.dart';
import 'package:online_gym/screens/workout.dart';
import 'package:online_gym/widgets/button.dart';
import 'package:online_gym/widgets/neumorphicbox.dart';

class ChooseWorkout extends StatelessWidget {
  const ChooseWorkout({super.key});

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
              "Choose Workout Type",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          CustomLoginButton(
              text: "Beginer",
              onPress: () async {
                await updateprofile({"Workout": "Beginer"});
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const WorkoutPlan(
                              workout: "Beginer",
                            )));
              }),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("you will get a Workout plan for a Beginer level."),
          ),
          CustomLoginButton(
              text: "Intermediate",
              onPress: () async {
                await updateprofile({"Workout": "Intermediate"});
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const WorkoutPlan(
                              workout: "Intermediate",
                            )));
              }),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("you will get a Workout plan for a Intermediate level."),
          ),
          CustomLoginButton(
              text: "Advanced",
              onPress: () async {
                await updateprofile({"Workout": "Advanced"});
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => const WorkoutPlan(
                              workout: "Advanced",
                            )));
              }),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("you will get a Workout plan for a Advanced level."),
          ),
        ],
      )),
    );
  }
}
