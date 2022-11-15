import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
   const About({super.key});

  @override
  _About createState() => _About();
}
 class _About extends State<About>{
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

         decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 98, 3, 107),
            Color.fromARGB(255, 212, 136, 196),
          ])
        ),
        child: SingleChildScrollView(
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              IconButton(onPressed: () {
                  Navigator.pop(context);
              }, icon: Icon(
                CupertinoIcons.arrow_left,
                color: Colors.white,
                size: 20,
              ),
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 25, vertical:5 ),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text("About", style: TextStyle(fontSize: 33, color:Colors.white, 
                  fontWeight: FontWeight.bold, 
                  letterSpacing: 4) ,),
                  SizedBox(height: 60,),
                  Text("YouPlan is to create a mobile application that helps users to be more productive by introducing features such as calendaring, task creation, list creation and status. . With a straightforward functionality and a minimalistic style. The main focus of the program is that it lets users organize tasks into hierarchies by allowing them to create subtasks.", 
                  style: TextStyle(fontSize: 18, color:Colors.white, 
                  fontWeight: FontWeight.normal, 
                  letterSpacing: 4) ,),
                ]
              )
              
              
              )
            ]
          )
        )

      ),
    );
  }
 }