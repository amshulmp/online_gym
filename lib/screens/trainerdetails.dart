import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_gym/config/styles.dart';
import 'package:online_gym/firebasefunctions.dart/functions.dart';
import 'package:online_gym/screens/payment.dart';
import 'package:online_gym/widgets/button.dart';

class TrainerDetails extends StatelessWidget {
  final String email;
  const TrainerDetails({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Trainers")
            .where("email", isEqualTo: email)
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
              child: Text('No data available.'),
            );
          } else {
            final trainerData =
                snapshot.data!.docs.first.data() as Map<String, dynamic>;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.height * 0.2,
                        child: CircleAvatar(
                          backgroundImage: trainerData["image"].isEmpty
                              ? const AssetImage("lib/assets/user (2).png")
                                  as ImageProvider<Object>
                              : NetworkImage(trainerData["image"]),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Text(
                      "Trainer name",
                      style: Styles.subtitlegrey(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "${trainerData["username"]}",
                        style: Styles.labelText(context),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013),
                    Text(
                      "email",
                      style: Styles.subtitlegrey(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "${trainerData["email"]}",
                        style: Styles.labelText(context),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013),
                    Text(
                      "Phone",
                      style: Styles.subtitlegrey(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "${trainerData["phone"]}",
                        style: Styles.labelText(context),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013),
                    Text(
                      "Location",
                      style: Styles.subtitlegrey(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "${trainerData["location"]}",
                        style: Styles.labelText(context),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013),
                     Text(
                      "Description",
                      style: Styles.subtitlegrey(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "${trainerData["description"]}",
                        style: Styles.labelText(context),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013),
                    Text(
                      "Type",
                      style: Styles.subtitlegrey(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "${trainerData["type"]}",
                        style: Styles.labelText(context),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013),

                        SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013),

                        CustomLoginButton(text: "Select", onPress: ()async{
                          await updateprofile({
                            "trainername":trainerData["username"],
                            "traineremail":trainerData["email"],
                          });
                             Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                         PaymentScreen(traineremail: trainerData["email"],)));
                        }),
                        SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013),SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013),SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013),

                  ],
                ),
              ),
            );
          }
        },
      ),
    );

  }
}