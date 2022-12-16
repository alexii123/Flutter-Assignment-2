import 'package:flutter/material.dart';
import 'package:flutter_asgt2/components/my_textfield.dart';
import 'package:flutter_asgt2/components/my_registerbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //text editing controllers
  final firstnameController = TextEditingController();

  final lastnameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmpasswordController = TextEditingController();

  void userRegister() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'weak-password') {
        weakPasswordMessage();
      } else if (e.code == 'email-already-in-use') {
        existingEmailMessage();
      }
    } catch (e) {
      print(e);
    }
  }

  void weakPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("The password provided is too weak."),
        );
      },
    );
  }

  void existingEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text("The account already exists for that email."),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(height: 40),
        //firstname textfield
        MyTextField(
          controller: firstnameController,
          hintText: 'First Name',
          obscureText: false,
        ),

        const SizedBox(height: 15),

        //lastname textfield
        MyTextField(
            controller: lastnameController,
            hintText: 'Last Name',
            obscureText: false),
        const SizedBox(height: 15),
        //address textfield
        MyTextField(
          controller: emailController,
          hintText: 'Email Address',
          obscureText: false,
        ),
        const SizedBox(height: 15),
        //password textfield
        MyTextField(
          controller: passwordController,
          hintText: 'Password',
          obscureText: true,
        ),
        const SizedBox(height: 15),
        //confirm password textfield
        MyTextField(
          controller: confirmpasswordController,
          hintText: 'Confirm Password',
          obscureText: true,
        ),
        const SizedBox(height: 40),
        //signup button
        MyRegisterbutton(
          onTap: userRegister,
        ),
      ],
    ));
  }
}
