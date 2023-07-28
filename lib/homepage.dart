
import 'package:unilist/constants.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  static String country="";

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent[200],
        title: Text('University Search',
            style: TextStyle(fontFamily: 'Borel'),
        textDirection: TextDirection.rtl,),
        shadowColor: Colors.teal[500],
      ),
      body: Container(
        color: kBackgroudColor,
        child: SingleChildScrollView(
        child: Container(

          margin: EdgeInsets.only(left: 40, right: 40,
              top: 30, bottom: 30),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 50,),
              Image.asset("assets/scholar_earth.png",width: 250, height: 250),
              SizedBox(
                height: 20,
              ),
              Text("WELCOME",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 50,
                    color: Colors.white,
                    fontFamily: 'Rubik_Moonrocks'
                ),),
              SizedBox(
                height: 20,
              ),

                TextField(
                onChanged: (data){
                  home.country=data;
                },
                style: TextStyle(
                  fontFamily: 'Space_Mono'
                ),
                decoration: InputDecoration(
                  hintText: 'Country Name',
                    fillColor: Colors.white54,
                    filled: true,
                    focusColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.indigoAccent[200],
                shadowColor: Colors.teal[500],
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pushNamed(context, 'result');
                  },
                  child: Text('Search',
                  style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      fontFamily: 'Plus_Jakarta_Sans'),
                    ),
                ),
              )
            ],
          ),
        ),

      ),)
    );
  }
}
