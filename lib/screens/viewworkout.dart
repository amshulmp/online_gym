import 'package:flutter/material.dart';
import 'package:online_gym/models.dart/workout.dart';
import 'package:online_gym/screens/workoutdetialsscreen.dart';
import 'package:online_gym/widgets/tile.dart';

class ViewWorkout extends StatelessWidget {
  final ExerciseModel workout;
  const ViewWorkout({super.key, required this.workout});
 
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.017),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${workout.day} Workout",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
               SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              NeumorphicListTile(
              text:workout.workout1,
              imagePath:workout.workout1Image,
              ontap: () {print(workout.workout1Instructions);
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => WorkoutDetailsScreen(image: workout.workout1Image, instruction: workout.workout1Instructions, sets: workout.sets, reps: workout.reps),
                                ),
                              );
              },
            ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.015),
             
              NeumorphicListTile(
              text: workout.workout2,
              imagePath: workout.workout2Image,
              ontap: () {
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => WorkoutDetailsScreen(image: workout.workout2Image, instruction: workout.workout2Instructions, sets: workout.sets, reps: workout.reps),
                                ),
                              );
              },
            ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.0150),
              NeumorphicListTile(
              text: workout.workout3,
              imagePath: workout.workout3Image,
              ontap: () {
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => WorkoutDetailsScreen(image: workout.workout3Image, instruction: workout.workout3Instructions, sets: workout.sets, reps: workout.reps),
                                ),
                              );
              },
            ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              NeumorphicListTile(
              text: workout.workout4,
              imagePath:workout.workout4Image,
              ontap: () {
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => WorkoutDetailsScreen(image: workout.workout4Image, instruction: workout.workout4Instructions, sets: workout.sets, reps: workout.reps),
                                ),
                              );
              },
            ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              NeumorphicListTile(
              text: workout.workout5,
              imagePath:workout.workout5Image,
              ontap: () {
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => WorkoutDetailsScreen(image: workout.workout5Image, instruction: workout.workout5Instructions, sets: workout.sets, reps: workout.reps),
                                ),
                              );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
             NeumorphicListTile(
              text: workout.workout6,
              imagePath:workout.workout6Image,
              ontap: () {
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => WorkoutDetailsScreen(image: workout.workout6Image, instruction: workout.workout6Instructions, sets: workout.sets, reps: workout.reps),
                                ),
                              );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
             NeumorphicListTile(
              text: workout.workout7,
              imagePath:workout.workout7Image,
              ontap: () {
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => WorkoutDetailsScreen(image: workout.workout7Image, instruction: workout.workout7Instructions, sets: workout.sets, reps: workout.reps),
                                ),
                              );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
             NeumorphicListTile(
              text: workout.workout8,
              imagePath:workout.workout8Image,
              ontap: () {
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => WorkoutDetailsScreen(image: workout.workout8Image, instruction: workout.workout8Instructions, sets: workout.sets, reps: workout.reps),
                                ),
                              );

              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015),
            
            ],
          ),
        ),
      ),
    );
  }
}