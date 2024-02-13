import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googleauth/Presentation/Login/login_cubit.dart';
 
 

List<BlocProvider> appProviders = [
BlocProvider<LoginCubit>(create: (context) => LoginCubit()),

];