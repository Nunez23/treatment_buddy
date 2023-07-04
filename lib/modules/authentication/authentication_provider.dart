import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = Provider<Authentication>((ref) => Authentication());

enum AuthResultStatus {
  success,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  unknownError,
}

class Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<AuthResultStatus> signUp(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthResultStatus.success;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return AuthResultStatus.emailAlreadyExists;
      } else if (e.code == 'invalid-email') {
        return AuthResultStatus.invalidEmail;
      } else {
        return AuthResultStatus.unknownError;
      }
    } catch (e) {
      return AuthResultStatus.unknownError;
    }
  }

  Future<AuthResultStatus> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthResultStatus.success;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return AuthResultStatus.userNotFound;
      } else if (e.code == 'wrong-password') {
        return AuthResultStatus.wrongPassword;
      } else if (e.code == 'user-disabled') {
        return AuthResultStatus.userDisabled;
      } else if (e.code == 'too-many-requests') {
        return AuthResultStatus.tooManyRequests;
      } else if (e.code == 'operation-not-allowed') {
        return AuthResultStatus.operationNotAllowed;
      } else if (e.code == 'invalid-email') {
        return AuthResultStatus.invalidEmail;
      } else {
        return AuthResultStatus.unknownError;
      }
    } catch (e) {
      return AuthResultStatus.unknownError;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
