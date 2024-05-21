import 'package:flutter/material.dart';
import 'package:online_gym/config/styles.dart';

class WorkoutDetailsScreen extends StatelessWidget {
  final String image;
  final String instruction;
  final int sets;
  final int reps;
  const WorkoutDetailsScreen(
      {super.key,
      required this.image,
      required this.instruction,
      required this.sets,
      required this.reps});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(image)),
                  ),
                  Text("Sets: $sets"),
                  Text("Reps: $reps"),
                  Text(
                    "Instruction",
                    style: Styles.subtitle(context),
                  ),
                  Text(instruction),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
