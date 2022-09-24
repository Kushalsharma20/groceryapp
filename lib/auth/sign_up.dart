import 'package:flutter/material.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => SignUpState();
}

class SignUpState extends State<SignUP> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vegi Groceries"),
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
              'Create Account',
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
                hintText: 'Enter your name',
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 9,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Last Name',
                labelText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 9,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.email, color: Colors.black),
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
            TextField(
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                labelText: 'Confirm Password',
                prefixIcon: Icon(Icons.lock, color: Colors.black),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
      ),
    ) 
    ,);
  }
}
