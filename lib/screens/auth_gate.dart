import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pertemuan6/screens/profile_screen.dart';
import 'package:pertemuan6/screens/sign_in_screen.dart';
import 'package:pertemuan6/screens/todo_screen.dart';
import 'package:pertemuan6/services/auth/auth_service.dart';


class AuthGate extends StatelessWidget{
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    
    return StreamBuilder<User?>(
      stream: auth.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError){
          return const Scaffold(
            body: Center(
              child: Text('Gagal memuat status login'),
            ),
          );
        } 

        if(snapshot.hasData){
          return TodoScreen();
        }

        return const SignInScreen();
      },
    );
  }
}