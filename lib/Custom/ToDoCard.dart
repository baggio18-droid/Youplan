import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
   const TodoCard({Key? key, required this.title, required this.iconData, required this.iconColor, required this.time, 
   required this.check, required this.iconBgColor});
   
 
final String title;
final IconData iconData;
final Color iconColor;
final String time;
final bool? check;
final Color  iconBgColor;
  //@override
  //_AddTodoPage createState() => _AddTodoPage();

 //class TodoCard extends State<TodoCard>{
 @override
  Widget build(BuildContext context){
    return Container(
      child:Row(     
        children: [
          Theme(
          child: Transform.scale(scale: 1.5,
          child: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            activeColor: Color(0xffaabbcc),
            checkColor: Color(0xffaabbcc),

            value: check, onChanged: (bool? value) {},
        ),
          ),
        data: ThemeData(
          primarySwatch: Colors.blue,
          unselectedWidgetColor: Color(0xffaabbcc),
        )
          ),
          Container(
            
            child: Container(
              
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), ),
                color: Color(0xffaabbcc),
                child: Row(
                  children: [
                    SizedBox(width: 15,),

                    Container(
                      
                      decoration: BoxDecoration(
                        color: iconBgColor,
                        borderRadius: BorderRadius.circular(8),

                      ),
                      child: Icon(iconData, color: iconColor,),
                      
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Text(title, style: TextStyle(
          fontSize: 18,
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        ),
                    ),
        Text(time, style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        ),
        SizedBox(width: 20,),

                  ],
                ),
              ),
            ),
          )
        ]
        ),
      );
  }
}