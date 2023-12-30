import 'package:contact_app/auth/auth_page.dart';
import 'package:contact_app/pages/homepage.dart';
import 'package:contact_app/pages/newpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'auth/auth_class.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'contactapp',
      options: FirebaseOptions(
          apiKey: 'apiKey',
          appId: 'appId',
          messagingSenderId: 'messagingSenderId',
          projectId: 'projectId')
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: !Auth.isLoggedin() ? AuthPage() :  HomePage(),
      routes: {
        HomePage.id:(context) => HomePage(),
        NewPage.id:(context) => NewPage(),
        AuthPage.id:(context) => AuthPage(),
      },
    );
  }
}

