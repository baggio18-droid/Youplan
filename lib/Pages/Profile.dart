import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

import 'package:youplan/Pages/AddTodo.dart';
import 'package:youplan/Pages/HomePage.dart';
import 'package:youplan/Pages/LocationPage.dart';



class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker _picker = ImagePicker();
    XFile? image ;
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(radius: 60,
              backgroundImage:  getImage(),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  button(),
                  IconButton(onPressed: () async{
                    image=(await _picker.pickImage(source: ImageSource.gallery))!;
                    setState(() {
                      image = image;
                    });
                  }, 
                  icon: Icon(Icons.add_a_photo,color: Colors.teal,size: 30,)),
                ]
                
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:
            BottomNavigationBar(backgroundColor: Colors.black87, items: [
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => HomePage()));
              },
              child: Icon(
                Icons.home,
                size: 32,
                color: Colors.white,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => Location()));
              },
              child: Container(
                height: 72,
                width: 52,
                child: Icon(Icons.map_sharp),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Colors.indigoAccent,
                      Colors.purple,
                    ])),
              ),
            ),
            label: 'plus',
          ),
          BottomNavigationBarItem(
            icon: IconButton(icon: Icon(Icons.logout), color: Colors.white, iconSize: 32, onPressed: () async{
            
     } 
     ),label: 'logout',
          ),
        ]),
    );
  }

  ImageProvider getImage(){
   if(image !=null){
    return FileImage(File(image!.path));
   }
   return AssetImage("assets/Profile.jpg");

  }
  Widget button(){
    return InkWell(
      onTap: (){
        
      },
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width/2,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),gradient: LinearGradient(colors: [
          Color.fromARGB(255, 8, 19, 58),
          Color.fromARGB(255, 112, 118, 139),
        ]),
        ),
        child: Center(child: Text("Upload", style: TextStyle(
        color: Color.fromARGB(255, 181, 147, 212),
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),),
        ),
      ),
    );
  }
}