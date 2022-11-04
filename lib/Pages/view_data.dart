import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class viewData extends StatefulWidget {
   const viewData({Key? key,  required this.document, required this.id}): super(key: key);
   final Map<String, dynamic>document;
   final String id;
  @override
  _viewDataPage createState() => _viewDataPage();
}
 class _viewDataPage extends State<viewData>{
   late TextEditingController _titleController ;
  late TextEditingController _descriptionController;
  late String type;
  late String category;
  bool edit=false;

  @override
  void initState(){
    super.initState();
    String title = widget.document["title"]==null ? "No title" : widget.document["title"];
    _titleController = TextEditingController(text: title);
    print(widget.document["title"]);
    String description= widget.document["description"]==null ? "No description" : widget.document["description"];
    _descriptionController = TextEditingController(text: description);
    print(widget.document["description"]);
    type= widget.document["task"];
    category = widget.document["Category"];
    
  }

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
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                children: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, 
                    icon: Icon(
                    CupertinoIcons.arrow_left,
                    color: Colors.white,
                    size: 20,
                  ),
                  ),
                  Row(
                    children: [
                      IconButton(onPressed: () {
                        setState(() {
                          FirebaseFirestore.instance.collection("Todo")
                          .doc(widget.id).delete().then((value){
                            Navigator.pop(context);
                          });
                        });
                      }, 
                        icon: Icon(
                        Icons.delete,
                        color: Colors.red ,
                        size: 20,
                      ),),
                      IconButton(onPressed: () {
                        setState(() {
                          edit = !edit;
                        });
                      }, 
                        icon: Icon(
                        Icons.edit,
                        color: edit?Colors.green:Colors.white,
                        size: 20,
                      ),),                      
                    ],
                  ),
                ],
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 25, vertical:5 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(edit?"Editing ":"View",
                  style: TextStyle(fontSize: 33, color:Colors.white, 
                  fontWeight: FontWeight.bold, 
                  letterSpacing: 4) ,),
                  SizedBox(height: 8,),
                  Text("Your Todos", style: TextStyle(fontSize: 33, color:Colors.white, 
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
                      taskSelect("Important",0xFFBF360C),
                      SizedBox(width: 20),
                      taskSelect("Planned", 0xFF78909C),
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
                      categorySelect("Work",0xff2664fa),
                      SizedBox(width: 20),
                      categorySelect("Study", 0xff123456),
                      SizedBox(width: 20),
                      categorySelect("Wellness", 0xFFB74093),
                      SizedBox(width: 20),
                      categorySelect("Hobbie", 0xffaabbcc),
                      SizedBox(width: 20),
                      categorySelect("Unspecified", 0xFF795548),
                    ],
                  ),
                  SizedBox(height: 35),
                    edit?  button(): Container(),
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
    return InkWell(
      onTap: (){
        FirebaseFirestore.instance.collection("Todo").doc(widget.id).update({
          "title": _titleController.text,
          "task":type,
          "Category": category,
          "description": _descriptionController.text,
          });
          Navigator.pop(context);
      },
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),gradient: LinearGradient(colors: [
          Color.fromARGB(255, 8, 19, 58),
          Color.fromARGB(255, 112, 118, 139),
        ]),
        ),
        child: Center(child: Text("Edit Task", style: TextStyle(
        color: Color.fromARGB(255, 181, 147, 212),
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),),
        ),
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
        enabled: edit,
        controller: _descriptionController,
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
  Widget taskSelect(String label, int color){
    return InkWell(
      onTap: edit 
     ? (){
        setState((){
          type = label;
        });
      }
      :null,
      child: Chip(
        shape: RoundedRectangleBorder(borderRadius: 
        BorderRadius.circular(10),
        ),
        backgroundColor: type == label?Color.fromARGB(255, 4, 112, 45) : Color(color),
        label: Text(label,style: TextStyle(
        color: Color.fromARGB(255, 231, 228, 228),
        fontSize: 15,
        fontWeight: FontWeight.w600,
    
      ),
      ),
      labelPadding: EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 3.8,
      ),
      ),
    );
  }
  Widget categorySelect(String label, int color){
    return InkWell(
      onTap: edit ? (){
        setState((){
          category = label;
        });
      }
      :null,
      child: Chip(
        shape: RoundedRectangleBorder(borderRadius: 
        BorderRadius.circular(10),
        ),
        backgroundColor: category == label?Color.fromARGB(255, 157, 152, 235) : Color(color),
        label: Text(label,style: TextStyle(
        color: Color.fromARGB(255, 218, 216, 216),
        fontSize: 15,
        fontWeight: FontWeight.w600,
    
      ),
      ),
      labelPadding: EdgeInsets.symmetric(
        horizontal: 17,
        vertical: 3.8,
      ),
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
        controller: _titleController,
        enabled: edit,
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
   @override
   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
     super.debugFillProperties(properties);
     properties.add(DiagnosticsProperty<TextEditingController>('_titleController', _titleController));
   }
 }