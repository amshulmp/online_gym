import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_gym/firebasefunctions.dart/functions.dart';

import 'package:online_gym/models.dart/data.dart';

import 'package:online_gym/models.dart/workout.dart';
import 'package:online_gym/screens/viewworkout.dart';
import 'package:online_gym/widgets/tile.dart';

class WorkoutPlan extends StatelessWidget {
 final String workout;
  const WorkoutPlan({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    List<ExerciseModel> data=workoutlist(workout);
    return Scaffold(
      body:Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:  13.0),
          child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Your Workout",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   ...List.generate(data.length, (index) => NeumorphicListTile2(text:data[index].day, imagePath: "lib/assets/report.png", ontap: (){
                     Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => ViewWorkout(workout: data[index]),
                                ),
                              );
                      
                   },
          count: IconButton(onPressed: ()async{
         await updateprogress({
          "email":auth.currentUser?.email,
          "timestamp":Timestamp.now(),
            "workout1":data[index].workout1,
            "workout2":data[index].workout2,
            "workout3":data[index].workout3,
            "workout4":data[index].workout4,
            "workout5":data[index].workout5,
            "workout6":data[index].workout6,
            "workout7":data[index].workout7,
            "workout8":data[index].workout8,
            
          });
           scaffoldMessengerKey.currentState!.showSnackBar(
      const SnackBar(
        content: Text("workout completed"),
        duration: Duration(seconds: 3),
      ),
    );
          }, icon: const Icon(Icons.done,color: Colors.black,))
                  ))
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

List<ExerciseModel> workoutlist(String diet) {
  if (diet == "Beginer") {
    return beginnerWorkouts;
  } else if (diet == "Intermediate") {
    return intermediateWorkouts;
  } else {
    return advancedWorkouts;
  }
}