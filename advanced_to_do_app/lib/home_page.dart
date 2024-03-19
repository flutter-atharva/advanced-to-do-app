import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/task_class.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool toEdit = false;

  TextEditingController taskController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  List taskList = [
    Task(title: "Work on frontend", date: "Mar 18, 2024"),
  ];

  List colors = [
    const Color.fromRGBO(172, 189, 161, 1),
    const Color.fromARGB(84, 172, 189, 161),
  ];

  void submit(bool toEdit, [index]) {
    if (toEdit == true) {
      taskList[index].title = taskController.text;

      taskList[index].date = dateController.text;
    } else {
      if (taskController.text.trim().isNotEmpty && dateController.text.trim().isNotEmpty) {
        taskList.add(Task(title: taskController.text, date: dateController.text));
      }
    }
    clearController();
    setState(() {});
  }

  void delete(index) {
    setState(() {
      taskList.removeAt(index);
    });
  }

  void clearController() {
    taskController.clear();

    dateController.clear();
  }

  void edit(index) {}

  void bottomSheet(bool toEdit, [index]) {
    if (toEdit == true) {
      taskController.text = taskList[index].title;

      dateController.text = taskList[index].date;
    }
    showModalBottomSheet(
        backgroundColor: const Color.fromRGBO(247, 252, 254, 1),
        isDismissible: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Create Task",
                  style: GoogleFonts.inriaSerif(fontSize: 20, fontWeight: FontWeight.w800, color: const Color.fromRGBO(31, 28, 29, 1)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Task",
                      style: GoogleFonts.inriaSerif(fontSize: 17, fontWeight: FontWeight.w800, color: const Color.fromRGBO(31, 28, 29, 1)),
                    )),
                TextField(
                  controller: taskController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color:  Color.fromRGBO(172, 189, 161, 1),
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(172, 189, 161, 1),
                        ),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Date",
                      style: GoogleFonts.inriaSerif(fontSize: 17, fontWeight: FontWeight.w800, color: const Color.fromRGBO(31, 28, 29, 1)),
                    )),
                TextField(
                  controller: dateController,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2024), lastDate: DateTime(2025));
                    String formatedDate = DateFormat.yMMMd().format(pickedDate!);
                    setState(() {
                      dateController.text = formatedDate;
                    });
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.date_range_outlined,
                      color: Color.fromRGBO(172, 189, 161, 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(172, 189, 161, 1),
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color.fromRGBO(172, 189, 161, 1),
                        ),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // ignore: sized_box_for_whitespace
                Container(
                    height: 50,
                    width: 260,
                    child: ElevatedButton(
                      onPressed: () {
                        if (toEdit == true) {
                          submit(true, index);
                        } else {
                          submit(false);
                        }
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: const Color.fromRGBO(31, 28, 29, 1), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                      child: const Text("Submit"),
                    )),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          );
        });
  }

  String date = DateFormat.yMMMd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 252, 254, 1),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle_outlined,
              size: 30,
            ),
            color: Colors.black,
            splashRadius: 18,
          )
        ],
        elevation: 0,
        backgroundColor: const Color.fromRGBO(247, 252, 254, 1),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 25),
            alignment: Alignment.centerLeft,
            child: Text(date, style: GoogleFonts.inriaSerif(fontSize: 18, fontWeight: FontWeight.w800, color: const Color.fromRGBO(172, 189, 161, 1))),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 25),
            alignment: Alignment.centerLeft,
            child: Text("Hello", style: GoogleFonts.inriaSerif(fontSize: 30, fontWeight: FontWeight.w400, color: const Color.fromRGBO(31, 28, 29, 1))),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25),
            alignment: Alignment.centerLeft,
            child: Text("Atharva", style: GoogleFonts.inriaSerif(fontSize: 40, fontWeight: FontWeight.w800, color: const Color.fromRGBO(31, 28, 29, 1))),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (context, index) => Slidable(
                    endActionPane: ActionPane(
                      extentRatio: 0.13,
                      key: ValueKey(index),
                      motion: const BehindMotion(),
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 25,
                            ),
                            IconButton(
                                onPressed: () {
                                  toEdit = true;
                                  bottomSheet(true, index);
                                },
                                icon: const Icon(
                                  Icons.mode_edit_outline_outlined,
                                  color: Colors.black,
                                )),
                            IconButton(
                                onPressed: () {
                                  delete(index);
                                },
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ))
                          ],
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), offset: Offset(0, 5), blurRadius: 10, spreadRadius: 1)
                          ],
                          borderRadius: BorderRadius.circular(5),
                          color: colors[index % colors.length],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                              child: Row(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), offset: Offset(0, 0), blurRadius: 20, spreadRadius: 0)
                                      ],
                                      color: Colors.white,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(80),
                                      child: Image.network(
                                        "https://www.taogent.com/noimg/noimg.jpg",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          taskList[index].title,
                                          style: GoogleFonts.quicksand(fontSize: 17, fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15, left: 120, bottom: 5),
                              child: Row(
                                children: [
                                  Text(
                                    "Deadline: ${taskList[index].date}",
                                    style: GoogleFonts.quicksand(fontSize: 15, fontWeight: FontWeight.w500, color: const Color.fromRGBO(132, 132, 132, 1)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          clearController();
          bottomSheet(false);
        },
        backgroundColor: const Color.fromRGBO(31, 28, 29, 1),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
