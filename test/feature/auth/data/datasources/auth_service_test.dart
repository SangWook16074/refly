import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:solution_diary_app/src/feature/auth/data/datasources/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'auth_service_test.mocks.dart';

@GenerateMocks([
  SupabaseClient,
  GoTrueClient,
  GoogleSignIn,
  GoogleSignInAccount,
  GoogleSignInAuthentication,
  SignInWithAppleWrapper,
  AuthorizationCredentialAppleID,
  AuthResponse,
  DotEnv,
])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('AuthServiceImpl', () {
    late MockSupabaseClient mockSupabase;
    late MockGoTrueClient mockAuth;
    late MockDotEnv mockDotenv;
    late MockGoogleSignIn mockGoogleSignIn;
    late MockGoogleSignInAccount mockGoogleSignInAccount;
    late MockGoogleSignInAuthentication mockGoogleSignInAuth;
    late MockSignInWithAppleWrapper mockAppleWrapper;
    late MockAuthorizationCredentialAppleID mockAppleCredential;
    late AuthServiceImpl service;

    setUp(() {
      mockSupabase = MockSupabaseClient();
      mockAuth = MockGoTrueClient();
      mockDotenv = MockDotEnv();
      mockGoogleSignIn = MockGoogleSignIn();
      mockGoogleSignInAccount = MockGoogleSignInAccount();
      mockGoogleSignInAuth = MockGoogleSignInAuthentication();
      when(mockSupabase.auth).thenReturn(mockAuth);
      when(mockDotenv.env).thenReturn({
        'GOOGLE_AUTH_WEB_CLIENT': 'web-client-id',
        'GOOGLE_AUTH_IOS_CLIENT': 'ios-client-id',
      });
      mockAppleWrapper = MockSignInWithAppleWrapper();
      mockAppleCredential = MockAuthorizationCredentialAppleID();
      service = AuthServiceImpl(
        supabase: mockSupabase,
        dotenv: mockDotenv,
        googleSignIn: mockGoogleSignIn,
        signInWithAppleWrapper: mockAppleWrapper,
      );
    });

    test('nativeGoogleSignIn 정상 동작 테스트', () async {
      // GoogleSignIn, Supabase 등 외부 연동은 mock 처리
      when(mockGoogleSignIn.signIn())
          .thenAnswer((_) async => mockGoogleSignInAccount);
      when(mockGoogleSignInAccount.authentication)
          .thenAnswer((_) async => mockGoogleSignInAuth);
      when(mockGoogleSignInAuth.accessToken).thenReturn('access-token');
      when(mockGoogleSignInAuth.idToken).thenReturn('id-token');
      when(mockAuth.signInWithIdToken(
        provider: anyNamed('provider'),
        idToken: anyNamed('idToken'),
        accessToken: anyNamed('accessToken'),
      )).thenAnswer((_) async => MockAuthResponse());
      await service.nativeGoogleSignIn();
      verify(mockGoogleSignIn.signIn()).called(1);
      verify(mockAuth.signInWithIdToken(
        provider: anyNamed('provider'),
        idToken: anyNamed('idToken'),
        accessToken: anyNamed('accessToken'),
      )).called(1);
    });

    // signInWithApple 정상 동작 테스트는 공식문서 코드이므로 테스트 생략

    test('signOut 정상 동작 테스트', () async {
      when(mockAuth.signOut(scope: anyNamed('scope')))
          .thenAnswer((_) async => {});
      expect(service.signOut(), completes);
      verify(mockAuth.signOut(scope: anyNamed('scope'))).called(1);
    });
  });
}
