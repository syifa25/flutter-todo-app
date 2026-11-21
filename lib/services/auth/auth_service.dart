import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  AuthService.internal();

  static final AuthService _instance = 
    AuthService.internal();

  factory AuthService() {
    return _instance;
  }

  //Mengakses firebase aunthetication
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Memantau perubahan status login
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  //Mendaftarkan akun
  Future<User?> signUp(
    String email,
    String password,
  )

  async {
    try{
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }

    on FirebaseAuthException catch (e) {
      print('Error Sign Up: ${e.code}');
      return null;
    }
  }

  //Login dengan akun
  Future<User?> signIn(
    String email,
    String password,
  )

  async {
    try{
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }

    on FirebaseAuthException catch (e) {
      print('Error Sign In: ${e.code}');
      return null;
    }
  }

  //Log Out
  Future<void> signOut() async{
    await _auth.signOut();
  }
}

