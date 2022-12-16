import 'package:flutter/material.dart';
import 'settings.dart';
//import 'package:flutter_asgt2/components/my_settingsbutton.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  /* void settings() async {
    Settings();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100),
          const Text(
            "LOGGED IN!",
            style: TextStyle(
                color: Color.fromARGB(255, 183, 112, 211),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(height: 50),
          const Text(
            "Welcome to Dashboard",
            style: TextStyle(
              color: Color.fromARGB(255, 183, 112, 211),
              fontWeight: FontWeight.bold,
              fontSize: 33,
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings()),
              );
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
              "Settings",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
