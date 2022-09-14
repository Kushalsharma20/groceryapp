import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage("assets/background.png")),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 400,
              width: double.infinity,
              child: Column(
                children: [
                  Text("Sign In to continue"),
                  Text(
                    "Vegi",
                    style:
                        TextStyle(fontSize: 50, color: Colors.white, shadows: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.green.shade900,
                        offset: Offset(3, 3),
                      )
                    ]),
                  ),
                  SignInButton(buttonType: ButtonType.apple, onPressed: () {}),
                  SignInButton(buttonType: ButtonType.google, onPressed: () {}),
                ],
              )),
        ],
      ),
    ));
  }
}
