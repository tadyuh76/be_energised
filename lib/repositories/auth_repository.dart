import 'package:be_energised/repositories/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository(ref));

class AuthRepository {
  final Ref ref;
  const AuthRepository(this.ref);

  Stream<User?> get userChanges => ref.read(authProvider).userChanges();

  Future<void> signOut() async {
    try {
      await ref.read(authProvider).signOut();
    } on FirebaseException catch (e) {
      print("error signing out: $e");
    }
  }
}
