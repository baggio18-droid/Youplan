import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:youplan/Pages/AddTodo.dart';
import 'package:youplan/Pages/HomePage.dart';
import 'package:youplan/Pages/SignInPage.dart';
import 'package:youplan/Pages/SignUpPage.dart';
import 'package:youplan/Service/Auth_Service.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget currentPage = SignUpPage();
  AuthClass authClass = AuthClass();

  @override
  void initState(){
    super.initState();
    checkLogin();
  }

  void checkLogin()async{
    String? token= await authClass.getToken();
    if(token!=null){
      setState(() {
        currentPage = HomePage();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  } 
}
