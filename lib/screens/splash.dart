// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:avatar_glow/avatar_glow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_gym/config/styles.dart';
import 'package:online_gym/screens/details1.dart';
import 'package:online_gym/screens/home.dart';
import 'package:online_gym/screens/login.dart';
import 'package:online_gym/screens/register.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),() async{
   
       bool isdetails = await checkIfHasDetails();
          print(isdetails);
     Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (BuildContext context) => 
      (FirebaseAuth.instance.currentUser != null) 
        ? isdetails ? const HomeScreen():const Details1Page() 
        : const LoginScreen(),
  ),
);

    } );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
   
      body:Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: AvatarGlow(
                startDelay: const Duration(seconds: 1),
                glowColor: Colors.orange,
                glowShape: BoxShape.circle,
                animate: true,
                curve: Curves.easeIn,
                child: Material(
                    elevation: 4.0,
                    shape: const CircleBorder(),
                    color: Colors.orange,
                    child: Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: AvatarGlow(
                startDelay: const Duration(seconds: 1),
                glowColor: Colors.orange,
                glowShape: BoxShape.circle,
                animate: true,
                curve: Curves.easeIn,
                child: Material(
                    elevation: 4.0,
                    shape: const CircleBorder(),
                    color: Colors.orange,
                    child: Container(
                      height: MediaQuery.of(context).size.height*0.4,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset("lib/assets/barbell.png"),
                    )),
              ),
                    )),
              ),
           ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text("Fitness App",
               
                           style: Styles.title(context),),
             )
          ],
        ),
      )
    );
  }
}