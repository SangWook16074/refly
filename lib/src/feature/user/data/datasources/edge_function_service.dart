import 'dart:convert';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;

final class EdgeFunctionServiceImpl implements EdgeFunctionService {
  final http.Client client;

  const EdgeFunctionServiceImpl({required this.client});
  @override
  Future<void> deleteUserViaEdgeFunction(String uid) async {
    final supabase = Supabase.instance.client;
    final session = supabase.auth.currentSession;

    if (session == null) {
      throw 'User not logged in';
    }

    final accessToken = session.accessToken;
    final url = Uri.parse(
        'https://cdnrthbqnfhutxtaubtp.supabase.co/functions/v1/delete_user');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'user_id': uid}),
    );

    if (response.statusCode == 200) {
      print('삭제 성공!');
      await Supabase.instance.client.auth.signOut();
    } else {
      print('삭제 실패: ${response.body}');
    }
  }
}

abstract class EdgeFunctionService {
  Future<void> deleteUserViaEdgeFunction(String uid);
}
