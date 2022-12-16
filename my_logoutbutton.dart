import 'package:flutter/material.dart';

class MyLogoutbutton extends StatelessWidget {
  final Function()? onTap;

  const MyLogoutbutton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 183, 112, 211),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Center(
          child: Text(
            "Logout",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
