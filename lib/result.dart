import 'dart:convert';

import 'package:unilist/constants.dart';
import 'package:unilist/homepage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class result extends StatefulWidget {
  const result({super.key});

  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  var sessions=<dynamic>[];

  var country="";
  var listC=0;
  @override
  void initState() {
    print("result page open");
    country=home.country;
    getData();
    super.initState();
  }

  getData() async {
    var url = Uri.parse('http://universities.hipolabs.com/search?country=$country');
    var response = await http.get(url);

    print(response.body);

    if (response.statusCode == 200) {
      List<dynamic> decodedData = jsonDecode(response.body);

      setState(() {
        sessions = List.from(decodedData); // Assign the list directly
        listC = sessions.length;
      });
      print(sessions);
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent[400],
          title: Text('University List',
            style: TextStyle(fontFamily: 'Borel')),
          shadowColor: Colors.teal,
        ),
        body: Container(
          color: kbkgcolor,
            child: ListView.builder(
              itemCount: listC,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  height: 150,
                  child: Container(

                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                      color: kboxcolor,
                      shadowColor: Colors.white54,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(sessions[index]['name'] ?? 'N/A',
                            // Use null-aware operator to handle null value
                            textAlign: TextAlign.center,
                          style: TextStyle(color:Colors.indigo[800],
                            fontSize: 17,
                              fontWeight: FontWeight.w600,
                            fontFamily: 'Plus_Jakarta_Sans'),
                          ),
                          Text(sessions[index]['state-province'] ?? 'N/A',
                            style: TextStyle(color:Colors.indigo[800],
                              fontFamily: 'Space_Mono'),),
                          Text(sessions[index]['country'] ?? 'N/A',
                            style: TextStyle(color:Colors.indigo[800],
                              fontFamily: 'Space_Mono'),),
                          Text(sessions[index]['domains']?.join(', ') ?? 'N/A',
                            style: TextStyle(color:Colors.indigo[800],
                              fontFamily: 'Space_Mono'),), // Use null-aware operator to handle null value
                        ],
                      ),
                    ),
                  ),

                );
              },
            ),
          ),
        );
  }
}