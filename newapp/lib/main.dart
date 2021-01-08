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
      body: Center(
        child: Card(
          child: Column(children: [Image.asset("assets/bgjpeg.jpg")]),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Vinay Sudrik"),
              accountEmail: Text("vinaysudrik@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.static-contents.youth4work.com/y4w/Images/Users/3279383.png?v=20180202084143"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Rushikesh Kardile"),
              subtitle: Text("Director"),
              trailing: Icon(Icons.edit),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Aniket Tandale"),
              subtitle: Text("Director"),
              trailing: Icon(Icons.edit),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Vinay Sudrik"),
              subtitle: Text("Python Developer"),
              trailing: Icon(Icons.edit),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
    );
  }
}
