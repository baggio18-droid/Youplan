

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youplan/Custom/ToDoCard.dart';
import 'package:youplan/Pages/AddTodo.dart';
import 'package:youplan/Pages/Profile.dart';
import 'package:youplan/Pages/SignUpPage.dart';
import 'package:youplan/Pages/view_data.dart';
import 'package:youplan/main.dart';
import 'package:youplan/Service/Auth_Service.dart';
import 'package:youplan/Pages/Profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthClass authClass = AuthClass();
  final Stream <QuerySnapshot> _stream = FirebaseFirestore.instance.collection("Todo").snapshots();

  List<Select> selected= [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(221, 7, 7, 7),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(221, 7, 7, 7),
          title: Text(
            "Today's Schedule",
            style: TextStyle(
                fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          actions: [
            CircleAvatar(
          
              backgroundImage: AssetImage("assets/Profile.jpg"),
              
            ),
            SizedBox(
              width: 25,
            ),
          ],
          bottom: PreferredSize(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 22),
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
        bottomNavigationBar:
            BottomNavigationBar(backgroundColor: Colors.black87, items: [
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => Profile()));
              },
              child: Icon(
                Icons.person,
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
                    MaterialPageRoute(builder: (builder) => AddTodoPage()));
              },
              child: Container(
                height: 72,
                width: 52,
                child: Icon(Icons.add),
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
            await authClass.logout();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder) =>SignUpPage()), (route) => false);
     } 
     ),label: 'logout',
          ),
        ]),
        body: StreamBuilder(
          stream: _stream,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount:snapshot.data?.docs.length ,
              itemBuilder: (context, index) {
                IconData iconData;
                Color iconColor;
                Map<String, dynamic>document = 
                snapshot.data!.docs[index].data() as Map<String, dynamic>;
                switch(document["Category"]){
                    case "Work":
                      iconData = Icons.badge_outlined;
                      iconColor = Color.fromARGB(255, 116, 108, 108);
                      break;
                      case "Study":
                      iconData = Icons.book_outlined;
                      iconColor = Color.fromARGB(255, 116, 108, 108);;
                      break;
                      case "Wellness":
                      iconData = Icons.beach_access_rounded;
                      iconColor = Color.fromARGB(255, 116, 108, 108);
                      break;
                      case "Hobbie":
                      iconData = Icons.sports_basketball;
                      iconColor = Color.fromARGB(255, 116, 108, 108);
                      break;
                      case "Unspecified":
                      iconData = Icons.question_mark;
                      iconColor = Color.fromARGB(255, 116, 108, 108);
                      break;
                      default:
                      iconData = Icons.run_circle_outlined;
                      iconColor = Colors.white;                      
                      }
                     
                selected.add(Select(
                  id: snapshot.data!.docs[index].id, checkValue: true));   
                   
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>viewData(document:document,
                    id:snapshot.data!.docs[index].id)));
                  },
                  child: TodoCard(
                        title: document["title"]==null?"No title" : document["title"],
                        check: selected[index].checkValue,
                        iconBgColor: Colors.white,
                        iconColor: iconColor,
                        iconData: iconData,
                        time: " 02:00 pm",
                        index: index,
                        onChange: onChange,
                      ),
                );
              });
          }
        ),);
  }
   onChange(int index){
    print(index);
    setState(){
      selected[index].checkValue = !selected[index].checkValue;
      
    }
  }
}

class Select{
  String id;
  bool checkValue = false;
  Select({required this.id, required this.checkValue});
}


//IconButton(icon: Icon(Icons.logout), onPressed: () async{
//        await authClass.logout();
//        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder) =>SignUpPage()), (route) => false);
//      } 
 //     ),