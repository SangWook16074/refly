import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:crypto/crypto.dart';

abstract class SignInWithAppleWrapper {
  Future<AuthorizationCredentialAppleID> getAppleIDCredential({
    required List<AppleIDAuthorizationScopes> scopes,
    String? nonce,
  });
}

class DefaultSignInWithAppleWrapper implements SignInWithAppleWrapper {
  @override
  Future<AuthorizationCredentialAppleID> getAppleIDCredential({
    required List<AppleIDAuthorizationScopes> scopes,
    String? nonce,
  }) {
    return SignInWithApple.getAppleIDCredential(
      scopes: scopes,
      nonce: nonce,
    );
  }
}

final class AuthServiceImpl implements AuthService {
  final SupabaseClient supabase;
  final DotEnv dotenv;
  final GoogleSignIn googleSignIn;
  final SignInWithAppleWrapper signInWithAppleWrapper;
  const AuthServiceImpl({
    required this.supabase,
    required this.dotenv,
    required this.googleSignIn,
    required this.signInWithAppleWrapper,
  });

  @override
  Future<void> nativeGoogleSignIn() async {
    try {
      /// TODO: update the Web client ID with your own.
      ///
      /// Web Client ID that you registered with Google Cloud.
      final webClientId = dotenv.env["GOOGLE_AUTH_WEB_CLIENT"];

      /// TODO: update the iOS client ID with your own.
      ///
      /// iOS Client ID that you registered with Google Cloud.
      final iosClientId = dotenv.env["GOOGLE_AUTH_IOS_CLIENT"];

      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) throw "No Google User";

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

  @override
  Future<AuthResponse> signInWithApple() async {
    final rawNonce = supabase.auth.generateRawNonce();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

    final credential = await signInWithAppleWrapper.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: hashedNonce,
    );

    final idToken = credential.identityToken;
    if (idToken == null) {
      throw const AuthException(
          'Could not find ID Token from generated credential.');
    }

    return supabase.auth.signInWithIdToken(
      provider: OAuthProvider.apple,
      idToken: idToken,
      nonce: rawNonce,
    );
  }

  @override
  Future<void> signOut() async {
    await supabase.auth.signOut(scope: SignOutScope.global);
  }
}

abstract class AuthService {
  Future<void> nativeGoogleSignIn();
  Future<AuthResponse> signInWithApple();
  Future<void> signOut();
}
