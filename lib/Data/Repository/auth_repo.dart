import 'package:firebase_auth/firebase_auth.dart';
import 'package:googleauth/Application/Services/auth_services.dart';

class AuthRepository {
  Future<User?> getUser() async {
    try {
      return await AuthServices.handleSignIn().then(
        (value) {
          return value;
        },
      ).catchError((e) {
        throw e;
      });
    } catch (e) {
      print('Error in auth repository $e');
      rethrow;
    }
  }
}
