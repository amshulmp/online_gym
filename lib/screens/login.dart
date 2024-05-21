import 'package:flutter/material.dart';
import 'package:online_gym/config/styles.dart';
import 'package:online_gym/firebasefunctions.dart/functions.dart';
import 'package:online_gym/screens/details1.dart';
import 'package:online_gym/screens/forgotpassword.dart';
import 'package:online_gym/screens/home.dart';
import 'package:online_gym/screens/register.dart';
import 'package:online_gym/widgets/button.dart';
import 'package:online_gym/widgets/textbox.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcotroller = TextEditingController();
  TextEditingController passwordcotroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "User Sign in",
                  style: Styles.title(context),
                ),
              ),
              Text(
                "Welcome back.Please sign in to",
                style: Styles.subtitlegrey(context),
              ),
              Text(
                "continue",
                style: Styles.subtitlegrey(context),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Textbox(
                hideText: false,
                tcontroller: emailcotroller,
                type: TextInputType.emailAddress,
                hinttext: 'Email',
                icon: Icon(Icons.email,color:Theme.of(context). colorScheme.onPrimary,),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.013),
              Textbox(
                hideText: true,
                tcontroller: passwordcotroller,
                type: TextInputType.visiblePassword,
                hinttext: 'Password',
                icon:Icon(Icons.lock,color:Theme.of(context). colorScheme.onPrimary,),
              ),
             
               SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
             
              CustomLoginButton(
                  text: "Sign in",
                  onPress: () async{
                    await signin(emailcotroller.text.trim(), passwordcotroller.text.trim());
                  bool isdetails = await checkIfHasDetails();
                    Navigator.pushReplacement(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => isdetails ? const HomeScreen():const Details1Page(),
                      ),
                    );
                  }),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("don't have an account?"),
                      TextButton(onPressed: (){
                         Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const RegisterScreen(),
                      ),
                    );
                      }, child: Text("Sign up", style: TextStyle(color: Theme.of(context).colorScheme.primary),))
                    ],
                  )
            ],
          ),
        ),
      ),
    );
  }
}
