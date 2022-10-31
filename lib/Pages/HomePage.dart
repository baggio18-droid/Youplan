import 'package:flutter/material.dart';
import 'package:youplan/Custom/ToDoCard.dart';
import 'package:youplan/Pages/AddTodo.dart';
import 'package:youplan/Pages/SignUpPage.dart';
import 'package:youplan/main.dart';
import 'package:youplan/Service/Auth_Service.dart';


class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  AuthClass authClass = AuthClass();
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Today's Schedule", style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold,color: Colors.white),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/Profile.jpg"),
          ),
          SizedBox(width: 25,),
      
    ],
    bottom: PreferredSize(child: Align(
      alignment: Alignment.centerLeft,
      child: Padding(padding: const EdgeInsets.only(left: 22),
      child: Text(
        "Monday 21",
        style: TextStyle(
          fontSize: 33,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      ),
    ),
     preferredSize: Size.fromHeight(35),
    ),
    ),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.black87,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.home, size: 32, color:Colors.white, 
      ),label: 'home',),
      
    BottomNavigationBarItem(icon: 
    InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (builder)=>AddTodoPage()));
      },
      child: Container(
        height: 52, width: 52, decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Colors.indigoAccent,
              Colors.purple,
            ]
          )
        ), 
        ),
    ),
    label: '+',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings, size: 32, color:Colors.white, 
      ),label: 'settings',
      ),
    ]),
    body: SingleChildScrollView(
      child: Container(
       
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
          TodoCard(
            title: "Wake me up",
            check: true,
            iconBgColor: Colors.white,
            iconColor: Colors.red,
            iconData: Icons.alarm,
            time: "10 Am",
          ),
          SizedBox(
            height: 10,
          ),
          TodoCard(
            title: "Go to the Gym",
            check: false,
            iconBgColor: Colors.white,
            iconColor: Colors.red,
            iconData: Icons.alarm,
            time: "10:30 Am",
          ),
          SizedBox(
            height: 10,
          ),
          TodoCard(
            title: "Lunch",
            check: false,
            iconBgColor: Colors.white,
            iconColor: Colors.red,
            iconData: Icons.alarm,
            time: "12 Pm",
          ),
          SizedBox(
            height: 10,
          ),
        ],)
      )
    )
    );
  }
}


//IconButton(icon: Icon(Icons.logout), onPressed: () async{
//        await authClass.logout();
//        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder) =>SignUpPage()), (route) => false);
//      } 
 //     ),