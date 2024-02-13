import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googleauth/Data/Repository/auth_repo.dart';
import 'package:googleauth/Presentation/Login/login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  Future<void> login() async {
    emit(LoginLoadingState());

    try {
 
      User? user = await AuthRepository().getUser();
      String? displayName = user?.displayName;
      print('>>>>>>>> $displayName');
      emit(LoginLoadedState(user: displayName));
    
      
    } catch (e) {
      emit(LoginErrorState(e.toString()));
      rethrow;
    }
  }
}
