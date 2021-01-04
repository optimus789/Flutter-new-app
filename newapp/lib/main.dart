import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Awesome App")),
        body: Container(
            width: 500,
            color: Colors.teal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  width: 100,
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      gradient:
                          LinearGradient(colors: [Colors.pink, Colors.yellow]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 21,
                        )
                      ]),
                  child: Text(
                    "I am a box",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  width: 100,
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      gradient:
                          LinearGradient(colors: [Colors.blue, Colors.yellow]),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 21,
                        )
                      ]),
                  child: Text(
                    "I am a box",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )));
  }
}
