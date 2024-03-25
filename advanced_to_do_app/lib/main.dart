import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/login.dart';
import 'package:to_do_app/register.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: ToDoApp());
  }
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 252, 254, 1),
      body: Column(children: [
        const SizedBox(
          height: 210,
        ),
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    " Let's\n get\n started!",
                    style: GoogleFonts.inriaSerif(fontSize: 60, fontWeight: FontWeight.w800, color: const Color.fromRGBO(31, 28, 29, 1)),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Now track all your daily work right on your mobile.",
                    style: GoogleFonts.inriaSerif(fontSize: 20, fontWeight: FontWeight.w800, color: const Color.fromRGBO(31, 28, 29, 1)),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 90,
        ),
        SizedBox(
          width: 250,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(31, 28, 29, 1)),
            child: Text(
              "Login",
              style: GoogleFonts.inriaSerif(fontSize: 19, fontWeight: FontWeight.w800, color: const Color.fromRGBO(247, 252, 254, 1)),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 50,
          width: 250,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(31, 28, 29, 1)),
            child: Text("Register", style: GoogleFonts.inriaSerif(fontSize: 19, fontWeight: FontWeight.w800, color: const Color.fromRGBO(247, 252, 254, 1))),
          ),
        ),
      ]),
    );
  }
}
