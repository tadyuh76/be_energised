import 'package:be_energised/controllers/auth_controller.dart';
import 'package:be_energised/repositories/battery_repository.dart';
import 'package:be_energised/repositories/firestore_repository.dart';
import 'package:be_energised/repositories/general_providers.dart';
import 'package:be_energised/utils/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fbAuthRepository =
    Provider<FbAuthRepository>((ref) => FbAuthRepository(ref));

class FbAuthRepository {
  final Ref ref;
  const FbAuthRepository(this.ref);

  Future<void> updateUserPhotoURL(UserCredential cred) async {
    try {
      final String fbPhotoURL =
          cred.additionalUserInfo!.profile!["picture"]["data"]["url"];
      await cred.user!.updatePhotoURL(fbPhotoURL);
      await cred.user!.reload();
    } on FirebaseException catch (e) {
      print("[updateUserPhotoURL]: $e");
    }
  }

  Future<void> signIn(BuildContext context) async {
    try {
      final fbAuthProvider = FacebookAuthProvider();
      fbAuthProvider.addScope('email');
      fbAuthProvider.setCustomParameters({'display': 'popup'});

      UserCredential cred;
      if (kIsWeb) {
        cred = await ref.read(authProvider).signInWithPopup(fbAuthProvider);
      } else {
        final LoginResult loginResult = await FacebookAuth.instance.login();
        if (loginResult.accessToken == null) return;

        final OAuthCredential fbAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);
        cred =
            await ref.read(authProvider).signInWithCredential(fbAuthCredential);
      }

      print(cred);
      if (cred.user == null) return;

      if (cred.additionalUserInfo!.isNewUser) {
        if (cred.user!.email == null) {
          print("null email");
          await cred.user!.updateEmail("unknown@gmail.com");
          await cred.user!.reload();
          print(cred.user);
        }

        await updateUserPhotoURL(cred);
        final updatedUser = ref.read(authControllerProvider)!;
        await ref.read(firestoreRepositoryProvider).addUserToDB(updatedUser);
        await ref.read(batteryRepositoryProvider).createBattery(updatedUser);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
      print("[signInWithFacebook]: $e");
    }
  }
}
