import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleauth/Data/Providers/app_providers.dart';
import 'package:googleauth/Presentation/Widgets/Login/login_screen.dart';
import 'package:googleauth/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
 

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
 
   runApp(MultiBlocProvider(providers: appProviders, child:  MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Sign In Demo',
      home: LoginScreen(),
    );
  }
}
