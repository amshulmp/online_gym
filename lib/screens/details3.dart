// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:online_gym/firebasefunctions.dart/functions.dart';
import 'package:online_gym/screens/chooseaplan.dart';
import 'package:online_gym/widgets/button.dart';
import 'package:online_gym/widgets/neumorphicbox.dart';
import 'package:online_gym/widgets/textbox.dart';

class Details3Page extends StatefulWidget {
  const Details3Page({super.key});

  @override
  State<Details3Page> createState() => _Details3PageState();
}

class _Details3PageState extends State<Details3Page> {
  late TextEditingController medicalHistory;
  late TextEditingController dietaryPreferencesController;

  @override
  void initState() {
    super.initState();
    medicalHistory = TextEditingController();
    dietaryPreferencesController = TextEditingController();
  }

  @override
  void dispose() {
    medicalHistory.dispose();
    dietaryPreferencesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: NeumorphicBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Additional Details",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Textbox(
                      hideText: false,
                      tcontroller: medicalHistory,
                      type: TextInputType.text,
                      hinttext: "Medical History",
                      icon: Icon(Icons.history,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Textbox(
                      hideText: false,
                      tcontroller: dietaryPreferencesController,
                      type: TextInputType.text,
                      hinttext: "Dietary Preferences",
                      icon: Icon(Icons.restaurant,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomLoginButton(
                        text: "next",
                        onPress: () async{
                          if (medicalHistory.text.isEmpty ||
                              dietaryPreferencesController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Please fill all fields")),
                            );
                          } else {
                            await updateprofile({
                                "medical history":medicalHistory.text.trim(),
                                "dietprefs":dietaryPreferencesController.text.trim(),
                            });
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const ChooseAplan()));
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
