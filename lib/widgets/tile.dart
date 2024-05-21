import 'package:flutter/material.dart';
import 'package:online_gym/config/styles.dart';
import 'package:online_gym/widgets/neumorphicbox.dart';



class NeumorphicListTile extends StatelessWidget {
  final String text;
  final String count;
  final String imagePath;
  final VoidCallback ontap;
  final bool isnetwork;

  const NeumorphicListTile({
    super.key,
    required this.text,
     this.count="",
    required this.imagePath,
     required this.ontap,  this.isnetwork=false,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicBox(
      child: ListTile(
        onTap: ontap,
        leading:isnetwork ? CircleAvatar(backgroundImage: NetworkImage(imagePath)): ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(imagePath)),
        title: Text(
          text,
          style: Styles.labelText(context),
        ),
        trailing: Text(
          count,
          style: Styles.labelText(context),
        ),
      ),
    );
  }
}



class NeumorphicListTile2 extends StatelessWidget {
  final String text;
  final Widget count;
  final String imagePath;
  final VoidCallback ontap;
  final bool isnetwork;

  const NeumorphicListTile2({
    super.key,
    required this.text,
    required this.count,
    required this.imagePath,
     required this.ontap,  this.isnetwork=false,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicBox(
      child: ListTile(
        onTap: ontap,
        leading:isnetwork ? CircleAvatar(backgroundImage: NetworkImage(imagePath)): ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(imagePath)),
        title: Text(
          text,
          style: Styles.labelText(context),
        ),
        trailing:count
      ),
    );
  }
}


