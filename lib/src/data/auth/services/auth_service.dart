import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;
  Future<void> nativeGoogleSignIn() async {
    try {
      /// TODO: update the Web client ID with your own.
      ///
      /// Web Client ID that you registered with Google Cloud.
      final webClientId = dotenv.env["SUPABASE_URL"];

      /// TODO: update the iOS client ID with your own.
      ///
      /// iOS Client ID that you registered with Google Cloud.
      final iosClientId = dotenv.env["SUPABASE_URL"];

      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: iosClientId,
        serverClientId: webClientId,
      );
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }

      await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
    } on Exception catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> signOut() async {
    final supabase = Supabase.instance.client;
    await supabase.auth.signOut();
  }
}
