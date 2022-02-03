import 'package:flutter/material.dart';
import 'package:latis_tutor/components/global/input.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            InputText(
              label: 'Username/Email',
              onChange: () {},
            ),
            InputText(
              label: 'Password',
              obsecureText: true,
              onChange: () {},
            ),
            MaterialButton(
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
