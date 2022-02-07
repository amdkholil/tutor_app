import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:latis_tutor/components/global/input.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
          color: Colors.deepOrange.shade50,
          height: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //
                const SizedBox(height: 20),
                //
                const Text(
                  "Login Tutor",
                  style: TextStyle(
                      fontSize: 28,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                //
                const SizedBox(height: 20),
                //
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(label: Text("Username")),
                ),
                //
                const SizedBox(height: 15),
                //
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(label: Text("Password")),
                ),
                //
                const SizedBox(height: 20),
                //
                GFButton(
                  onPressed: () {},
                  text: "Login",
                  textStyle: const TextStyle(fontSize: 16),
                  size: GFSize.LARGE,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: GFButtonShape.pills,
                  blockButton: true,
                ),
                //
                const SizedBox(height: 20),
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //
                    TextButton(
                      onPressed: () async{
                        if(!await launch("https://login.latiseducation.com/")) throw "Could not launch url";
                      },
                      child: const Text("Lupa Password"),
                    ),
                    //
                    TextButton(
                      onPressed: () async {
                        if(!await launch("https://login.latiseducation.com/")) throw "Could not launch url";
                      },
                      child: const Text("Register"),
                    ),
                    //
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
