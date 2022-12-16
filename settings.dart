import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_asgt2/components/my_logoutbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  Future<User?> _getFirebaseUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  //Signout method
  void userSignOut() async {
    var user = await _getFirebaseUser();
    FirebaseFirestore.instance.collection('users').doc(user?.uid).delete();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100),
          const Text(
            "Settings Page",
            style: TextStyle(
              color: Color.fromARGB(255, 183, 112, 211),
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 183, 112, 211),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: const Text(
              "Dashboard",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 50),
          MyLogoutbutton(
            onTap: userSignOut,
          ),
        ],
      ),
    );
  }
}
