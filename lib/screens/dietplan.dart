import 'package:flutter/material.dart';
import 'package:online_gym/models.dart/data.dart';
import 'package:online_gym/models.dart/diet.dart';
import 'package:online_gym/widgets/tile.dart';

class DietPlans extends StatelessWidget {
  final String dietplan;
  const DietPlans({super.key, required this.dietplan});

  @override
  Widget build(BuildContext context) {
   DietPlan diet= finddietplan(dietplan);
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
                  "Your DietPlan",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
               SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Text(
                "Breakfast",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              NeumorphicListTile(
              text: diet.breakfast,
              imagePath: diet.breakfastImage,
              ontap: () {
              },
            ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Text(
                "11:30 AM",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              NeumorphicListTile(
              text: diet.betweenLB,
              imagePath: diet.betweenLBImage,
              ontap: () {
              },
            ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Text(
                "Lunch",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              NeumorphicListTile(
              text: diet.lunch,
              imagePath: diet.lunchImage,
              ontap: () {
              },
            ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Text(
                "Evening",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              NeumorphicListTile(
              text: diet.evening,
              imagePath: diet.eveningImage,
              ontap: () {
              },
            ),
             SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Text(
                "Supper",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              NeumorphicListTile(
              text: diet.supper,
              imagePath: diet.betweenLBImage,
              ontap: () {
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

DietPlan finddietplan(String diet) {
  if (diet == "Gain Weight") {
    return weightGainPlan;
  } else if (diet == "Maintain Weight") {
    return weightMaintenancePlan;
  } else {
    return weightLossPlan;
  }
}
