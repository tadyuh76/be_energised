import 'dart:async';

import 'package:be_energised/repositories/auth_repository.dart';
import 'package:be_energised/repositories/fb_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, User?>((ref) => AuthController(ref));

class AuthController extends StateNotifier<User?> {
  final Ref ref;
  StreamSubscription<User?>? _authStateChangesSubscription;

  AuthController(this.ref) : super(null) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription = ref
        .read(authRepositoryProvider)
        .authStateChanges
        .listen((user) => state = user);
  }

  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }

  void signInWithFb(BuildContext context) {
    ref.read(fbAuthRepository).signIn(context);
  }

  void signOut(BuildContext context) {
    ref.read(authRepositoryProvider).signOut();
    Navigator.of(context).pop();
  }
}
