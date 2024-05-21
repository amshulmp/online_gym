import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_gym/firebasefunctions.dart/functions.dart';
import 'package:online_gym/screens/Profile.dart';
import 'package:online_gym/screens/chats.dart';
import 'package:online_gym/screens/choosedietype.dart';
import 'package:online_gym/screens/chooseworkout.dart';
import 'package:online_gym/screens/dietplan.dart';
import 'package:online_gym/screens/login.dart';
import 'package:online_gym/screens/progress.dart';
import 'package:online_gym/screens/workout.dart';
import 'package:online_gym/widgets/tile.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  const Text("H O M E"),
      actions: [
        IconButton(onPressed: ()async{
          Navigator.popUntil(context, (route) => route.isFirst);
         Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const LoginScreen(),
                      ),
                    );
          await signout();
        }, icon:  const Icon(Icons.logout))
      ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .where("email", isEqualTo: FirebaseAuth.instance.currentUser?.email)
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
            final userdata =
                snapshot.data!.docs.first.data() as Map<String, dynamic>;

            return Padding(
        padding: const EdgeInsets.symmetric(horizontal:  8.0),
        child: Column(
          children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          NeumorphicListTile(
              text: "Chats with trainer",
              imagePath: "lib/assets/chat.png",
              ontap: () {
                 if (userdata["plan"]==
"base") {
                 scaffoldMessengerKey.currentState!.showSnackBar(
      const SnackBar(
        content: Text("Upgrade to premium"),
        duration: Duration(seconds: 3),
      ),
    );   
                 } else {
                   
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>  ChatPage(trainername: userdata["trainername"], email: userdata["traineremail"],),
                      ),
                    );
                 }
              },
            ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.02),
             NeumorphicListTile(
              text: "diet plan",
              imagePath: "lib/assets/diet.png",
              ontap: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => userdata["diet"]==null ? const ChooseDiet():DietPlans(dietplan:userdata["diet"] ),
                      ),
                    );
              },
            ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.02),
             NeumorphicListTile(
              text: "workout plan",
              imagePath: "lib/assets/report.png",
              ontap: () {
                 Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => userdata["Workout"]==null ? const ChooseWorkout():WorkoutPlan(workout:userdata["Workout"] ),
                      ),
                    );
              },
            ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.02),
             NeumorphicListTile(
              text: "Progress",
              imagePath: "lib/assets/clipboard.png",
              ontap: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const ProgressTracking(),
                      ),
                    );
              },
            ),
             
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
             NeumorphicListTile(
              text: "profile",
              imagePath: "lib/assets/fitness (1).png",
              ontap: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const ProfileScreen(),
                      ),
                    );
              },
            ),
          ],
        ),
      );
          }
        },
      ),
    );
  }
}