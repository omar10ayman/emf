import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final time1;
  // ignore: prefer_typing_uninitialized_variables
  final coil1;
  // ignore: prefer_typing_uninitialized_variables
  final amper1;
  // ignore: prefer_typing_uninitialized_variables
  final dis1;
  const Result({Key? key, this.time1, this.coil1, this.amper1, this.dis1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 234, 234),
      appBar: AppBar(
        //backgroundColor: const Color.fromARGB(255, 165, 164, 164),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.done_outline_rounded,
              size: 30,
            ),
            SizedBox(
              width: 40,
            ),
            Text(
              "Results",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Distance: ",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text("$dis1 CM",
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold))
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Coils Number: ",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Text("$coil1 N",
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold))
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Current: ",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Text("$amper1 A",
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold))
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Time: ",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                Text("$time1 Min",
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold))
              ],
            ),
            // const SizedBox(
            //   height: 30,
            // ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      primary: const Color.fromARGB(255, 219, 23, 9)),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("back");
                  },
                  child: const Text(
                    "Back",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
