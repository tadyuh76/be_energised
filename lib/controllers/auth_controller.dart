import 'dart:async';

import 'package:be_energised/helpers/auth_control_helper.dart';
import 'package:be_energised/repositories/auth_repository.dart';
import 'package:be_energised/repositories/fb_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, User?>((ref) => AuthController(ref));

class AuthController extends StateNotifier<User?> {
  final Ref ref;
  StreamSubscription<User?>? _userChangesSubscription;

  AuthController(this.ref) : super(null) {
    _userChangesSubscription?.cancel();
    _userChangesSubscription = ref
        .watch(authRepositoryProvider)
        .userChanges
        .listen((user) => state = user);
  }

  @override
  void dispose() {
    _userChangesSubscription?.cancel();
    super.dispose();
  }

  void signInWithFb(BuildContext context) {
    ref.read(fbAuthRepository).signIn(context);
  }

  Future<void> signOut(BuildContext context) async {
    Navigator.of(context).pushNamedAndRemoveUntil(
      AuthControlHelper.routeName,
      (route) => false,
    );
    await ref.read(authRepositoryProvider).signOut();
  }
}
