import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'authentication_provider.dart';

final authService = Provider<AuthenticationService>(
  (ref) => AuthenticationService(ref.container),
);

class AuthenticationService {
  final ProviderContainer _ref;

  AuthenticationService(this._ref);

  Future<AuthResultStatus> signUp(String email, String password) async {
    final auth = _ref.read(authProvider);
    return await auth.signUp(email, password);
  }

  Future<AuthResultStatus> signIn(String email, String password) async {
    final auth = _ref.read(authProvider);
    return await auth.signIn(email, password);
  }

  Future<void> signOut() async {
    final auth = _ref.read(authProvider);
    await auth.signOut();
  }

  Stream<User?> get authStateChanges {
    final auth = _ref.read(authProvider);
    return auth.authStateChanges;
  }
}
