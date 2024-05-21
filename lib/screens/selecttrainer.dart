
// ignore_for_file: unnecessary_null_comparison

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_gym/firebasefunctions.dart/functions.dart';
import 'package:online_gym/screens/trainerdetails.dart';
import 'package:online_gym/widgets/tile.dart';

class SelectTrainer extends StatelessWidget {
  const SelectTrainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: firestore
            .collection("Trainers")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('You Have No Trainees To Chat'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final userData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
              String imagePath = userData["image"] ?? "";
if (imagePath.isEmpty || imagePath == null) {
  imagePath = "lib/assets/user (2).png";
}
                return NeumorphicListTile(
                  text: userData["username"] ?? "", 
                  imagePath: imagePath, 
                  ontap: () {    Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                         TrainerDetails(email:  userData["email"],))); },
                );
              },
            );
          }
        },
      ),
    );
  }
}
