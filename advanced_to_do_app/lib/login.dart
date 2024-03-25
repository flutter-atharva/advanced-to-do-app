import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/home_page.dart';
import 'package:to_do_app/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 252, 254, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                " Login",
                style: GoogleFonts.inriaSerif(fontSize: 40, fontWeight: FontWeight.w800, color: const Color.fromRGBO(31, 28, 29, 1)),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                  key: _loginKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: "Enter username",
                          label: const Text("Enter username", style: TextStyle(color: Color.fromRGBO(172, 189, 161, 1))),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Color.fromRGBO(172, 189, 161, 1),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter username";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                            hintText: "Enter password",
                            label: const Text("Enter password", style: TextStyle(color: Color.fromRGBO(172, 189, 161, 1))),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color.fromRGBO(172, 189, 161, 1),
                            ),
                            suffixIcon: const Icon(
                              Icons.remove_red_eye_outlined,
                              color: Color.fromRGBO(172, 189, 161, 1),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Enter password";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            bool loginValidated = _loginKey.currentState!.validate();
                            for (int i = 0; i <= usernameList.length + 1; i++) {
                              if (loginValidated) {
                                if (usernameList[i] == usernameController.text.toString() && passwordList[i] == passwordController.text.toString()) {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Successful")));
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
                                }
                                
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(31, 28, 29, 1)),
                          child: Text(
                            "Login",
                            style: GoogleFonts.inriaSerif(fontSize: 19, fontWeight: FontWeight.w800, color: const Color.fromRGBO(247, 252, 254, 1)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Not a user?",
                            style: GoogleFonts.inriaSerif(fontSize: 15, fontWeight: FontWeight.w800, color: const Color.fromRGBO(31, 28, 29, 1)),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const RegisterPage()));
                              },
                              child: Text(
                                "Register now",
                                style: GoogleFonts.inriaSerif(fontSize: 15, fontWeight: FontWeight.w800, color: Colors.blue),
                              ))
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
