import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newapp/pages/login_page.dart';
import 'package:newapp/utils/constants.dart';
import 'package:newapp/widgets/drawer.dart';
import 'dart:convert';

//import 'package:newapp/name_card_widget.dart';

class HomePageSB extends StatefulWidget {
  static const String routeName = "/homefb";
  @override
  _HomePageSBState createState() => _HomePageSBState();
}

class _HomePageSBState extends State<HomePageSB> {
  // var myText = "Change My Name";
  // TextEditingController _nameController = TextEditingController();
  var url = "https://jsonplaceholder.typicode.com/photos";

  Future fetchdata() async {
    var res = await http.get(url);
    //print(res.body);
    var data = jsonDecode(res.body);
    //print(data);
    return data;
  }

  Stream<List<String>> getStream() {
    var data = Stream<List<String>>.fromIterable(
        [List<String>.generate(20, (index) => "Item $index")]);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome App"),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Constants.prefs.setBool("loggedIn", false);
                Navigator.pushReplacementNamed(context, LoginPage.routeName);
              })
        ],
      ),
      body: StreamBuilder(
        stream: getStream(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text("Fetch Something"),
              );
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Some Error occured"),
                );
              }

              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(title: Text(snapshot.data[index]));
                },
                itemCount: snapshot.data.length,
              );
          }
        },
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //myText = _nameController.text;
          setState(() {});
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
