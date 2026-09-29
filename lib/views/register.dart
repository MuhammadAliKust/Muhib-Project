import 'package:api_project/services/auth.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Column(
        children: [
          Text("Register", style: TextStyle(fontSize: 30)),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(label: Text("Name")),
            controller: nameController,
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(label: Text("Email")),
            controller: emailController,
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(label: Text("Password")),
            controller: pwdController,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isEmpty) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Name cannot be empty.")));
                return;
              }
              if (emailController.text.isEmpty) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Email cannot be empty.")));
                return;
              }
              if (pwdController.text.isEmpty) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Password cannot be empty.")));
                return;
              }

              try {
                AuthServices()
                    .registerUser(
                      name: nameController.text,
                      email: emailController.text,
                      password: pwdController.text,
                    )
                    .then((val) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("User has been regsitered sucessfully"),
                        ),
                      );
                    });
              } catch (e) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(e.toString())));
              }
            },
            child: Text("Register User"),
          ),
        ],
      ),
    );
  }
}
