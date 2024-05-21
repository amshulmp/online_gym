import 'package:flutter/material.dart';
import 'package:online_gym/config/styles.dart';

class Progressdetails extends StatelessWidget {
  final dynamic data;
  final dynamic date;

  const Progressdetails({
    super.key,
    required this.data,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(date),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      data["workout1"], // Display your data here
                    ),
                    trailing: Text(
                      "3X5",
                      style: Styles.subtitle(context),
                    ),
                  ),
                ),
              ),
            ),
               Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      data["workout2"], // Display your data here
                    ),
                    trailing: Text(
                      "3X5",
                      style: Styles.subtitle(context),
                    ),
                  ),
                ),
              ),
            ),
               Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      data["workout3"], // Display your data here
                    ),
                    trailing: Text(
                      "3X5",
                      style: Styles.subtitle(context),
                    ),
                  ),
                ),
              ),
            ),
               Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      data["workout4"], // Display your data here
                    ),
                    trailing: Text(
                      "3X5",
                      style: Styles.subtitle(context),
                    ),
                  ),
                ),
              ),
            ),
               Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      data["workout5"], // Display your data here
                    ),
                    trailing: Text(
                      "3X5",
                      style: Styles.subtitle(context),
                    ),
                  ),
                ),
              ),
            ),
               Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      data["workout6"], // Display your data here
                    ),
                    trailing: Text(
                      "3X5",
                      style: Styles.subtitle(context),
                    ),
                  ),
                ),
              ),
            ),
    Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      data["workout7"], // Display your data here
                    ),
                    trailing: Text(
                      "3X5",
                      style: Styles.subtitle(context),
                    ),
                  ),
                ),
              ),
            ),
               Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      data["workout8"], // Display your data here
                    ),
                    trailing: Text(
                      "3X5",
                      style: Styles.subtitle(context),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
