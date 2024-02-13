import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googleauth/Presentation/Login/Home/home.dart';
import 'package:googleauth/Presentation/Login/login_cubit.dart';
import 'package:googleauth/Presentation/Login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<LoginCubit>().login();
              },
              child: Container(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Sign in with '),
                    Image.network(
                      'https://w7.pngwing.com/pngs/989/129/png-transparent-google-logo-google-search-meng-meng-company-text-logo-thumbnail.png',
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            BlocConsumer<LoginCubit, LoginStates>(
              listener: (BuildContext context,LoginStates state) {
                if (state is LoginLoadedState) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(state.user),
                    ),
                  );
                }
              },
              builder: (BuildContext context, LoginStates state) {
                if (state is LoginLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LoginErrorState) {
                  return Center(
                    child: Text(state.error ?? 'An error occurred'),
                  );
                }
                return SizedBox.shrink(); // Hide if not loading or error state
              },
            ),
          ],
        ),
      ),
    );
  }
}
