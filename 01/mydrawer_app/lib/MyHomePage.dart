import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY Drawer App'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Rohtash'),
              accountEmail: Text('Rohtash@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text('RT'),
              ),
            ),
            ListTile(
              title: Text('Home'),
              trailing: Icon(Icons.home),
            ),
            ListTile(
              title: Text('Categories'),
              trailing: Icon(Icons.category),
              onTap: () => Navigator.of(context).pushNamed("/a"),
            ),
            ListTile(
              title: Text('Profile'),
              trailing: Icon(Icons.person),
            ),
            Divider(),
              ListTile(
              title: Text('Mascot'),
              trailing: Icon(Icons.person),
            ),
              ListTile(
              title: Text('Close'),
              trailing: Icon(Icons.close),
              onTap: ()=>Navigator.of(context).pop(),
            ),

          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Page')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cloud_circle),
        onPressed: (){},
      ),
    );
  }
}
