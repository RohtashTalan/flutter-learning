// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List usersData = [];
  bool isLoading = true;
  final String url = 'https://randomuser.me/api/?results=50';

  Future getData() async {
   var response = await http.get(Uri.parse(url),
          headers: {"Accept": "application/json"});

    List data = jsonDecode(response.body)['results'];
    setState(() {
      usersData = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Users'),
      ),
      body: Container(
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: usersData.length == 0 ? 0 : usersData.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(20.0),
                            child: Image(
                              height:70.0,
                              width: 70.0,
                              fit: BoxFit.contain,
                              image:NetworkImage (usersData[index]['picture']['thumbnail'])),
                          ),
                           Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(usersData[index]['name']['first']+ 
                                usersData[index]['name']['last'],
                                style: const TextStyle(fontSize: 20.0),
                                ),
                                Text(usersData[index]['phone']),
                                Text(usersData[index]['gender']),
                              ],
                            )
                            )
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
