import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:reefs_nav/view/widget/auth/customebuttonauth.dart';
import 'package:reefs_nav/view/widget/auth/custometextformauth.dart';

class UpdateForm extends StatefulWidget {
  final String username;
  final String email;
  final String password;
  final String user;

  const UpdateForm(
      {super.key,
      required this.username,
      required this.email,
      required this.password,
      required this.user});

  @override
  State<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // Set the initial values of text controllers
    nameController.text = widget.username;
    emailController.text = widget.email;
    passwordController.text = widget.password;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomeTextFormAuth(
          hinttext: "userName",
          labeltext: "userName",
          iconData: Icons.person_2_outlined,
          mycontroller: nameController,
        ),
        CustomeTextFormAuth(
          hinttext: "email",
          labeltext: "email",
          iconData: Icons.email_outlined,
          mycontroller: emailController,
        ),
        CustomeTextFormAuth(
          hinttext: "password",
          labeltext: "password",
          iconData: Icons.password_outlined,
          mycontroller: passwordController,
        ),
        CustomeButtonAuth(
          //save button
          text: "Save",
          onPressed: () {
            var collection = FirebaseFirestore.instance.collection('users');
            collection.doc(widget.user).update({
              'userName': nameController.text,
              'email': emailController.text,
              'password':
                  passwordController.text, // Fix: Retrieve text from controller
            });

            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
