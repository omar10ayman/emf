import 'package:emf/models/models.dart';

import 'package:emf/resuit.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Emf extends StatefulWidget {
  const Emf({Key? key}) : super(key: key);

  @override
  State<Emf> createState() => _EmfState();
}

class _EmfState extends State<Emf> {
  var _keyForm = GlobalKey<FormState>();
  var typeWord = const TextStyle(
      fontSize: 37,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 6, 106, 188),
      fontFamily: "gill");
  dynamic time = 0;
  dynamic amber = 0;
  dynamic coils = 0;
  dynamic dis = 0;
  late DatabaseReference dbrf;
  final currentControl = TextEditingController();
  final timeControl = TextEditingController();
  final numtControl = TextEditingController();
  final disControl = TextEditingController();
  @override
  // ignore: must_call_super
  void initState() {
    dbrf = FirebaseDatabase.instance.ref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 235, 234, 234),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _keyForm,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SizedBox(
                      width: 400,
                      height: 150,
                      child: Image.asset("images/4.png"),
                    ),
                  ),
                  Text("Distance", style: typeWord),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 50, end: 50),
                    child: defualtTextform(
                        vaild: (v) {
                          if (v.isEmpty) {
                            return "Must Put Value";
                          } else
                            return null;
                        },
                        labal: "Enter Distance",
                        suffix: const Icon(
                          Icons.line_axis,
                          color: Color.fromARGB(255, 4, 102, 183),
                        ),
                        controller: disControl,
                        onchange: (value) {
                          value = disControl.text;
                          dis = double.parse(disControl.text);
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Number of Coils", style: typeWord),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 50, end: 50),
                    child: defualtTextform(
                        vaild: (v) {
                          if (v.isEmpty) {
                            return "Must Put Value";
                          } else
                            return null;
                        },
                        suffix: const Icon(Icons.add,
                            color: Color.fromARGB(255, 4, 102, 183)),
                        labal: "Enter N Of Coils",
                        controller: numtControl,
                        onchange: (value) {
                          value = numtControl.text;
                          coils = double.parse(numtControl.text);
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Current", style: typeWord),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 50, end: 50),
                    child: defualtTextform(
                        vaild: (v) {
                          if (v.isEmpty) {
                            return "Must Put Value";
                          } else
                            return null;
                        },
                        suffix: const Icon(Icons.electrical_services,
                            color: Color.fromARGB(255, 4, 102, 183)),
                        labal: "Enter Current",
                        controller: currentControl,
                        onchange: (value) {
                          value = currentControl.text;
                          amber = double.parse(currentControl.text);
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Time", style: typeWord),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.only(start: 50, end: 50),
                    child: defualtTextform(
                        vaild: (v) {
                          if (v.isEmpty) {
                            return "Must Put Value";
                          } else
                            return null;
                        },
                        suffix: const Icon(Icons.add_alert,
                            color: Color.fromARGB(255, 4, 102, 183)),
                        labal: "Enter Time",
                        controller: timeControl,
                        onchange: (value) {
                          value = timeControl.text;
                          time = double.parse(timeControl.text);
                        }),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (_keyForm.currentState!.validate()) {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Result(
                                    amper1: amber,
                                    coil1: coils,
                                    dis1: dis,
                                    time1: time,
                                  );
                                }));
                                CreateData();
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 30),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              primary: const Color.fromARGB(255, 219, 23, 9)),
                          child: const Text(
                            "Set Values",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            amber = 0;
                            coils = 0;
                            dis = 0;
                            time = 0;
                            setState(() {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return Result(
                                    amper1: amber,
                                    coil1: coils,
                                    dis1: dis,
                                    time1: time);
                              }));
                              CreateData();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 30),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              primary: const Color.fromARGB(255, 219, 23, 9)),
                          child: const Text("Reset",
                              style: TextStyle(fontWeight: FontWeight.bold)))
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
        // Center(
        //   child: SingleChildScrollView(
        //     child: Column(mainAxisSize: MainAxisSize.min, children: [
        //       const Text("Distance"),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       defualtTextform(
        //           controller: disControl,
        //           onchange: (value) {
        //             value = disControl.text;
        //             dis = double.parse(disControl.text);
        //           }),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       const Text("Number of Coils"),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       defualtTextform(
        //           controller: numtControl,
        //           onchange: (value) {
        //             value = numtControl.text;
        //             coils = double.parse(numtControl.text);
        //           }),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       const Text("Current"),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       defualtTextform(
        //           controller: currentControl,
        //           onchange: (value) {
        //             value = currentControl.text;
        //             amber = double.parse(currentControl.text);
        //           }),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       const Text("Time"),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       defualtTextform(
        //           controller: timeControl,
        //           onchange: (value) {
        //             value = timeControl.text;
        //             time = double.parse(timeControl.text);
        //           }),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       TextButton(
        //           onPressed: () {
        //             setState(() {
        //               Navigator.pushReplacement(context,
        //                   MaterialPageRoute(builder: (context) {
        //                 return Result(
        //                   amper1: amber,
        //                   coil1: coils,
        //                   dis1: dis,
        //                   time1: double.parse(timeControl.text),
        //                 );
        //               }));
        //               CreateData();
        //             });
        //           },
        //           child: const Text("OK")),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       TextButton(
        //           onPressed: () {
        //             amber = 0;
        //             coils = 0;
        //             dis = 0;
        //             time = 0;
        //             setState(() {
        //               Navigator.pushReplacement(context,
        //                   MaterialPageRoute(builder: (context) {
        //                 return Result(
        //                     amper1: amber, coil1: coils, dis1: dis, time1: time);
        //               }));
        //               CreateData();
        //             });
        //           },
        //           child: const Text("Reset"))
        //     ]),
        //   ),
        // ),

        );
  }

  // ignore: non_constant_identifier_names
  CreateData() {
    dbrf
        .child("Values")
        .set({"distance": dis, "coils": coils, "amber": amber, "time": time});
  }
}
