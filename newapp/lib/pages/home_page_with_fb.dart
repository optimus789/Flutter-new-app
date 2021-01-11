import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newapp/pages/login_page.dart';
import 'package:newapp/utils/constants.dart';
import 'package:newapp/widgets/drawer.dart';
import 'dart:convert';

//import 'package:newapp/name_card_widget.dart';

class HomePageFB extends StatefulWidget {
  static const String routeName = "/homefb";
  @override
  _HomePageFBState createState() => _HomePageFBState();
}

class _HomePageFBState extends State<HomePageFB> {
  // var myText = "Change My Name";
  // TextEditingController _nameController = TextEditingController();
  var url = "https://jsonplaceholder.typicode.com/photos";
  var data;

  Future fetchdata() async {
    var res = await http.get(url);
    //print(res.body);
    data = jsonDecode(res.body);
    //print(data);
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
      body: FutureBuilder(
        future: fetchdata(),
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
                  return ListTile(
                    title: Text(data[index]["title"]),
                    subtitle: Text("ID: ${data[index]["id"]}"),
                    leading: Image.network(data[index]["url"]),
                  );
                },
                itemCount: data.length,
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
