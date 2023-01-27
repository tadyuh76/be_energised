import 'package:be_energised/controllers/auth_controller.dart';
import 'package:be_energised/screens/auth/login_screen.dart';
import 'package:be_energised/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthControlHelper extends ConsumerWidget {
  static const routeName = "/auth";
  const AuthControlHelper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider);

    if (user != null) return const HomeScreen();
    return const LoginScreen();
  }
}
