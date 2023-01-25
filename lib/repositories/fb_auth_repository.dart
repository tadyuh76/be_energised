import 'package:be_energised/repositories/general_providers.dart';
import 'package:be_energised/utils/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fbAuthRepository =
    Provider<FbAuthRepository>((ref) => FbAuthRepository(ref));

class FbAuthRepository {
  final Ref ref;
  const FbAuthRepository(this.ref);

  Future<void> signIn(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.accessToken == null) return;

      final OAuthCredential fbAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      final cred =
          await ref.read(authProvider).signInWithCredential(fbAuthCredential);
      print("[signed in successfully]: ${cred.additionalUserInfo?.profile}");
    } on FirebaseException catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
