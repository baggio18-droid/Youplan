import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTodoPage extends StatefulWidget {
   const AddTodoPage({super.key});

  @override
  _AddTodoPage createState() => _AddTodoPage();
}
 class _AddTodoPage extends State<AddTodoPage>{
 @override
  Widget build(BuildContext context){
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
                  Text("create", style: TextStyle(fontSize: 33, color:Colors.white, 
                  fontWeight: FontWeight.bold, 
                  letterSpacing: 4) ,),
                  SizedBox(height: 8,),
                  Text("New Todo", style: TextStyle(fontSize: 33, color:Colors.white, 
                  fontWeight: FontWeight.bold, 
                  letterSpacing: 2,) ,
                  ),
                  SizedBox(height: 25,),
                  label("Task Title"),
                  SizedBox(height: 12),
                  title(),
                  SizedBox(height: 25),
                  label("Task Type"),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      chipData("Important",0xff2664fa),
                      SizedBox(width: 20),
                      chipData("Planned", 0xff2bc8d9),
                    ],
                  ),
                  SizedBox(height: 25,),
                  label("Description"),
                  SizedBox(height: 12,),
                  description(),
                  SizedBox(height: 25,),
                  label("Category"),
                  SizedBox(height: 12),
                  Wrap(
                    runSpacing: 10,
                    children: [
                      chipData("food",0xff2664fa),
                      SizedBox(width: 20),
                      chipData("Workout", 0xff123456),
                      SizedBox(width: 20),
                      chipData("Design", 0xFFB74093),
                      SizedBox(width: 20),
                      chipData("Run", 0xffaabbcc),
                    ],
                  ),
                  SizedBox(height: 35),
                      button(),
                  SizedBox(height: 30),
                      
                  
                ],
                ))
            ],

          ),
        ),
      )
    );
  }
  Widget button(){
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),gradient: LinearGradient(colors: [
        Color.fromARGB(255, 8, 19, 58),
        Color.fromARGB(255, 112, 118, 139),
      ]),
      ),
      child: Center(child: Text("Add Task", style: TextStyle(
      color: Color.fromARGB(255, 181, 147, 212),
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),),
      ),
    );
  }
Widget description(){
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Color(0xff2a2e3d),
      borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
          style: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
          maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Task Description",
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
          contentPadding: EdgeInsets.only(
            left:20,
            right: 20,
          )
        )
      )
    );
  }
  Widget chipData(String label, int color){
    return Chip(
      backgroundColor: Color(color),

      shape: RoundedRectangleBorder(borderRadius: 
      BorderRadius.circular(10),
      ),
      label: Text(label,style: TextStyle(
      color: Colors.grey,
      fontSize: 15,
      fontWeight: FontWeight.w600,

    ),
    ),
    labelPadding: EdgeInsets.symmetric(
      horizontal: 17,
      vertical: 3.8,
    ),
    );
  }

  Widget title(){
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Color(0xff2a2e3d),
      borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
          style: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Task Title",
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
          contentPadding: EdgeInsets.only(
            left:20,
            right: 20,
          )
        )
      )
    );
  }
  Widget label(String label){
    return Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600,
                  fontSize: 16.5,
                  letterSpacing: 0.2,));
  }
 }