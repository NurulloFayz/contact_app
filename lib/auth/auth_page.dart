import 'package:contact_app/auth/auth_class.dart';
import 'package:contact_app/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPage extends StatefulWidget {
  static const String id = 'auth';
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  var email = TextEditingController();
  var password = TextEditingController();

  signUp(){
    String email_controller = email.text.toString().trim();
    String password_controller = password.text.toString().trim();
    if(email_controller.isEmpty || password_controller.isEmpty){
      return;
    }else{
      Auth.SignUpUser(password: password_controller, email: email_controller).then((value) => {
        Navigator.pushReplacementNamed(context, HomePage.id)
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/20,
              left: MediaQuery.of(context).size.width/20
              ),
              child: TextField(
                controller: email,
                style: GoogleFonts.capriola(
                  fontSize: MediaQuery.of(context).size.height/35,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.drive_file_rename_outline,color: Colors.blueAccent,),
                    hintText: 'email',
                    hintStyle: GoogleFonts.capriola(
                      fontSize: MediaQuery.of(context).size.height/40,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/30,),
            Container(
              margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/20,
              left: MediaQuery.of(context).size.width/20
              ),
              child: TextField(
                controller: password,
                style: GoogleFonts.capriola(
                  fontSize: MediaQuery.of(context).size.height/35,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.drive_file_rename_outline,color: Colors.blueAccent,),
                    hintText: 'password',
                    hintStyle: GoogleFonts.capriola(
                      fontSize: MediaQuery.of(context).size.height/40,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/30,),
            GestureDetector(
              onTap: (){
                signUp();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/12,
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/30,
                  left: MediaQuery.of(context).size.width/30,

                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueAccent
                ),
                child: Center(
                  child: Text('Sign up',style: GoogleFonts.capriola(
                      fontSize: MediaQuery.of(context).size.height/40,
                      color: Colors.white
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
