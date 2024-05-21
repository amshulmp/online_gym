import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_gym/firebasefunctions.dart/functions.dart';
import 'package:intl/intl.dart';
import 'package:online_gym/screens/progressview.dart';
class ProgressTracking extends StatelessWidget {
  const ProgressTracking({super. key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress"),
      ),
      body: StreamBuilder(
        stream: firestore
            .collection("progress")
            .where("email", isEqualTo: auth.currentUser?.email)
            
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
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
            return ListView.builder(
              
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                
                final userData = snapshot.data!.docs[index].data();
 final timestamp = (userData["timestamp"] as Timestamp).toDate();

                final formattedDate = DateFormat('dd MMM').format(timestamp);
                return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>  Progressdetails(data: userData, date:formattedDate ,),
                                ),
                              );
                        },
                      title: Text(formattedDate),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
