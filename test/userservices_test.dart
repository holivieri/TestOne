import 'dart:convert';
import 'package:enablapp/src/services/userManagement_service.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Login service returns a valid user', () async {
    final authservice = new UserManagementService();
    final user = {'id': 1223};

    authservice.client = MockClient((request) async {
      return Response(json.encode(user), 200);
    });

    final result =
        await authservice.login('vancouver.zenoti.com', 'SimpsonHomer', 'Ouch');
    expect(result['ok'], false);
  });
}
