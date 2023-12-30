import 'package:contact_app/auth/auth_class.dart';
import 'package:contact_app/auth/auth_page.dart';
import 'package:contact_app/models/model.dart';
import 'package:contact_app/pages/newpage.dart';
import 'package:contact_app/realtime_db/realtime_db.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  static const String id = 'homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  showSheet(){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Set to true to cover the full screen
      builder: (BuildContext context) {
        // Your bottom sheet content
        return Container(
          // Adjust other properties as needed
          height: MediaQuery.of(context).size.height/1.1,
          color: Colors.white,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              Container(
                // margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/10,
                // left: MediaQuery.of(context).size.width/20
                // ),
                child: TextField(
                  controller: name,
                  style: GoogleFonts.capriola(
                    fontSize: MediaQuery.of(context).size.height/35,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.drive_file_rename_outline,color: Colors.blueAccent,),
                    hintText: 'name',
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
                // margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/10,
                //     left: MediaQuery.of(context).size.width/20
                // ),
                child: TextField(
                  controller: number,
                  style: GoogleFonts.capriola(
                    fontSize: MediaQuery.of(context).size.height/35,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone,color: Colors.blueAccent,),
                      hintText: 'phone number',
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
                  addContact();
                  name.clear();
                  number.clear();
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
                    child: Text('add contact',style: GoogleFonts.capriola(
                      fontSize: MediaQuery.of(context).size.height/40,
                      color: Colors.white
                    ),),
                  ),
                ),
              )
            ]
          ),
        );
      },
    );
  }

  //to fetch
  Query fetch =  FirebaseDatabase.instance.ref().child(Auth.currentUserId()).child('contacts');
  //to delete
  DatabaseReference reference = FirebaseDatabase.instance.ref().child(Auth.currentUserId()).child('contacts');

  var name = TextEditingController();
  var number = TextEditingController();

  addContact(){
    String name_controller = name.text.toString().trim();
    String number_controller = number.text.toString().trim();
    if(name_controller.isEmpty || number_controller.isEmpty){
      return;
    }else{
      var post = Contact(name: name_controller, number: number_controller);
      RealtimeDatabase.addPost(post).then((value) => {
        Navigator.pop(context),
      });
    }
  }

  updateContact(String key, String updateName, String updateNumber) {
    TextEditingController updateNameController =
    TextEditingController(text: updateName);
    TextEditingController updateNumberController =
    TextEditingController(text: updateNumber);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Set to true to cover the full screen
      builder: (BuildContext context) {
        // Your bottom sheet content
        return Container(
          // Adjust other properties as needed
          height: MediaQuery.of(context).size.height/1.1,
          color: Colors.white,
          padding: EdgeInsets.all(16.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/30,),
                Container(
                  // margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/10,
                  // left: MediaQuery.of(context).size.width/20
                  // ),
                  child: TextField(
                    controller: updateNameController,
                    style: GoogleFonts.capriola(
                      fontSize: MediaQuery.of(context).size.height/35,
                    ),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.drive_file_rename_outline,color: Colors.blueAccent,),
                        hintText: 'name',
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
                  // margin: EdgeInsets.only(right: MediaQuery.of(context).size.width/10,
                  //     left: MediaQuery.of(context).size.width/20
                  // ),
                  child: TextField(
                    controller: updateNumberController,
                    style: GoogleFonts.capriola(
                      fontSize: MediaQuery.of(context).size.height/35,
                    ),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone,color: Colors.blueAccent,),
                        hintText: 'phone number',
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
                    String updatedName = updateNameController.text.trim();
                    String updatedNumber = updateNumberController.text.trim();

                    setState(() {
                      if (updatedName.isNotEmpty && updatedNumber.isNotEmpty) {
                        reference.child(key).update({
                          'name': updatedName,
                          'number': updatedNumber,
                        });

                        Navigator.pop(context);
                      }
                    });
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
                      child: Text('update contact',style: GoogleFonts.capriola(
                          fontSize: MediaQuery.of(context).size.height/40,
                          color: Colors.white
                      ),),
                    ),
                  ),
                )
              ]
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mail,color: Colors.blueAccent,),
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            Text('${Auth.currentUserEmail()}',style: GoogleFonts.capriola(
              fontSize: MediaQuery.of(context).size.height/43,
            ),),
            SizedBox(height: MediaQuery.of(context).size.height/30,),
            GestureDetector(
              onTap: (){
                setState(() {
                  Auth.SignOutUser(context);
                  Navigator.pushReplacementNamed(context, AuthPage.id);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.logout,color: Colors.red,),
                  SizedBox(width: MediaQuery.of(context).size.width/30,),
                  Text('Logout',style: GoogleFonts.capriola(
                    fontSize: MediaQuery.of(context).size.height/40,
                  ),),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Row(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, NewPage.id);
              },
              child: Text('Contacts',style: GoogleFonts.capriola(
                fontSize: MediaQuery.of(context).size.height/30
              ),),
            ),
            Spacer(),
            IconButton(
              onPressed: (){
                showSheet();
              },
              icon: Icon(Icons.add),
            )
          ],
        ),
      ),
      body: Container(
        height: 400,
        child:FirebaseAnimatedList(
          query: fetch,
          itemBuilder: (BuildContext context, DataSnapshot snap, Animation<double>anim,int index){
              Map contacts = snap.value as Map;
              contacts['key']  = snap.key;
              return contactlist(contacts: contacts);

          },
        )
      ),
    );
  }

  Widget contactlist({required Map contacts}){
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height/40,),
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width/30,),
            CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.3),
                radius: MediaQuery.of(context).size.height/20,
                child: Icon(Icons.person,size: MediaQuery.of(context).size.height/15,
                  color: Colors.blueAccent,
                )
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width/20,),
                    Text(contacts['name'],style: GoogleFonts.capriola(
                        fontSize: MediaQuery.of(context).size.height/35
                    ),),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width/20,),
                    Text(contacts['number'],style: GoogleFonts.chewy(
                        fontSize: MediaQuery.of(context).size.height/35,
                        color: Colors.blueAccent
                    ),),
                  ],
                ),
              ],
            ),
            Spacer(),
           Column(
             children: [
               IconButton(
                 onPressed: (){
                   reference.child(contacts['key']).remove();
                 },
                 icon: Icon(Icons.delete_rounded,color: Colors.black,),
               ),
               IconButton(
                 onPressed: (){
                   updateContact(
                     contacts['key'],
                     contacts['name'],
                     contacts['number'],
                   );
                 },
                 icon: Icon(Icons.create_sharp,color: Colors.grey,),
               ),
             ],
           ),
            SizedBox(width: MediaQuery.of(context).size.width/30,),

          ],
        ),
        Divider(
          indent: MediaQuery.of(context).size.width/4,
          thickness: 1,
          color: Colors.grey.withOpacity(0.6),
        ),
        SizedBox(height: MediaQuery.of(context).size.height/30,),
      ],
    );
  }
}
