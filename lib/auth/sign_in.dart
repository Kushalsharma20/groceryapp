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
        title: const Text("Vegi Groceries"),
        backgroundColor: Colors.green,
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
        child: Center(
          child: ListView(
            children: [
              Text(
                'Welcome to Vegi groceries',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 100,
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
                height: 30,
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
                height: 20,
              ),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 22),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Log In'),
                ),
              ),
              SizedBox(
                height: 9,
              ),
              Container(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 22),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  onPressed: () {},
                  child: Text("Don't have an account?"),
                ),
              ),
              SizedBox(
                height: 9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
