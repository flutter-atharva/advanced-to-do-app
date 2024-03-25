import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

List usernameList = [
];

List passwordList = [
];

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();

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
                " Register",
                style: GoogleFonts.inriaSerif(fontSize: 40, fontWeight: FontWeight.w800, color: const Color.fromRGBO(31, 28, 29, 1)),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                  key: _registerKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: "Enter username",
                          label: const Text("Enter Username", style: TextStyle(color: Color.fromRGBO(172, 189, 161, 1))),
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
                            hintText: "Enter Password",
                            label: const Text("Enter Password", style: TextStyle(color: Color.fromRGBO(172, 189, 161, 1))),
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
                        height: 10,
                      ),
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        obscuringCharacter: "*",
                        decoration: InputDecoration(
                            hintText: "Re-Enter Password",
                            label: const Text("Re-Enter password", style: TextStyle(color: Color.fromRGBO(172, 189, 161, 1))),
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
                          if (value == null || value.isEmpty || confirmPasswordController.text.toString() != passwordController.text.toString()) {
                            return "Please Enter correct password";
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
                            bool loginValidated = _registerKey.currentState!.validate();

                            if (loginValidated) {
                              usernameList.add(usernameController.text.toString());
                              passwordList.add(passwordController.text.toString());
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: (Text("Registered Successfully"))));
                            } 
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(31, 28, 29, 1)),
                          child: Text(
                            "Register",
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
                            "Already an user?",
                            style: GoogleFonts.inriaSerif(fontSize: 15, fontWeight: FontWeight.w800, color: const Color.fromRGBO(31, 28, 29, 1)),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginPage()));
                              },
                              child: Text(
                                "Login",
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
