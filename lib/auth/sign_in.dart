import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => SignInState();
}

class SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Groceries app"),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/authimages/sign.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: const [
            Text(
              'Welcome to Vegi groceries',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Log into Account',
              style: TextStyle(
                fontSize: 45,
                color: Colors.orange,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 9,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock, color: Colors.black),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 9,
            ),
          ],
        ),
      ),
    );
  }
}
