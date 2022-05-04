import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../components/coustom_bottom_nav_bar.dart';
import '../../enums.dart';
import '../login_success/login_success_screen.dart';
import '../sign_in/sign_in_screen.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData){
          return LoginSuccessScreen();
        } else if(snapshot.hasError){
          return Center(child: Text('Something went wrong!'));
        } else {
          return SignInScreen();
        }
      },
  ),
  );
}