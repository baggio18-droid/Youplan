import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:youplan/Pages/HomePage.dart';
import 'package:youplan/Pages/SignInPage.dart';
import 'package:youplan/Pages/PhoneAuthPage.dart';
import 'package:youplan/Service/Auth_Service.dart';
class SignUpPage extends StatefulWidget {
   const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  bool circular = false;
  AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Column(
           mainAxisAlignment:MainAxisAlignment.center,
           children: [
             Text("Sign up", style: TextStyle(
              fontSize: 35, 
              color: Colors.white, 
              fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              buttonItem("assets/google.svg", "Continue with Google",25, ()async{
                 await authClass.googleSignIn(context);
              } ),
              SizedBox(height: 15),
              buttonItem("assets/phone.svg", "Continue with mobile", 30, (){
                 Navigator.push(context, MaterialPageRoute(builder: (builder) =>PhoneAuthPage()));
              }),
             

              SizedBox(height: 15,),

              Text("Or", style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(height: 15,),
              textItem("Email ...", _emailController, false),
              SizedBox(height: 15,),
              textItem("Password", _pwdController, true),
              SizedBox(height: 30,),
              colorButton(),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("You already have an account?", 
              style: TextStyle(color: Colors.white,
              fontSize: 16),),

              InkWell(
                onTap: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>SignInPage()), (route) => false);
                },
                child: Text(" Login", 
                style: TextStyle(color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold, ),),
              ),
              ],)


          ]
        )
      )     
      )
    );
  }

  Widget colorButton(){
    return InkWell(
      onTap: () async {
        setState(() {
          circular=true;
        });
        try{
          firebase_auth.UserCredential  userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _pwdController.text);
          print(userCredential.user!.email);
          setState(() {
            circular = false;
          });
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder) =>HomePage()), (route) => false);
        }
      catch(e){
        final snackBar= SnackBar(content: Text(e.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setState(() {
          circular = false;
        });
      }
      },
      child: Container(
      width: MediaQuery.of(context).size.width-90,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors:[ Color.fromARGB(255, 148, 43, 95),Color.fromARGB(255, 245, 157, 223),Color.fromARGB(255, 100, 56, 78)])
      ),
      child: Center(
      child: circular?CircularProgressIndicator(): Text("Sign up", style: 
      TextStyle(color: Colors.white, 
      fontSize: 20,)),
      )
    )
    );
  }
  Widget buttonItem(String imagepath, String buttonName, double size, Function() onTap){
    return InkWell(
   onTap: onTap,
      child: Container(
                  width: MediaQuery.of(context).size.width-60,
                  height: 50,
                  child: Card(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                    side: BorderSide(width: 1, color:Colors.grey, ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(imagepath,
                        height: size,
                        width: size,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          buttonName, style: TextStyle(color: Colors.white, fontSize: 17)),
                      ]
                    )
                  )
                ),
    );
  }
  Widget textItem (String labeltext, TextEditingController controller, bool obscureText){
    return Container( width: MediaQuery.of(context).size.width-70,
                height: 55,
                child: TextFormField(
                  controller: controller,
                  obscureText: obscureText,
                  style: TextStyle(fontSize: 17, color:Colors.white),
                  decoration: InputDecoration(
                    labelText: labeltext, labelStyle: TextStyle(fontSize: 17, color:Colors.white, ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Colors.purple,)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(width: 1, color:Colors.grey,),
                  ),
                ),
                )
    );
  }
}