import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Presentation/Widgets/Login/LoginCubit/login_cubit.dart';
    
    
List<BlocProvider> appProviders = [
BlocProvider<LoginCubit>(create: (context) => LoginCubit()),

];