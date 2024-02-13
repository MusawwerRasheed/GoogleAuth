import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleauth/Presentation/Login/login_state.dart';

class Home extends StatefulWidget {
  String? displayName;

  Home(this.displayName, {Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
      ),
      body:  Column(children: [Center(child :Text(widget.displayName!), 
      
      
      ), 
      
      ElevatedButton(onPressed: (){
        _signOut();
      }, child: Text('Signout')), 
      ],)
    );
  }

  Future<void> _signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      Navigator.pop(context);
    } catch (error) {
      print('Error signing out: $error');
    }
  }
}
