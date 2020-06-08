import 'dart:convert';
import 'dart:io';
import 'package:enablApp/src/storage/user_preferences.dart';
import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserManagementService {

  final _prefs = new UserPreferences();
  final storage = new FlutterSecureStorage();
  Client client = new Client();

  Future<Map<String, dynamic>> login( String userName, String password, String account) async {

    String platform = "";

    if (Platform.isAndroid) {
      platform = "ANDROID";
    } else if (Platform.isIOS) {
      platform = "IOS";
    }

    Map<String, String> authData = {
      'grant_type' : 'password',
      'clientid'   : account,
      'username'   : userName,
      'password'   : password,
      //'Platform'   : platform,
      //'DeviceId'   : _prefs.deviceId
    };
    final _url = await storage.read(key: 'url');
    final url  = '$_url/token';

    final resp = await client.post(
      url,
      headers: {'Content-Type' : 'application/x-www-form-urlencoded'},
      body: authData,
    );

    

    if(resp.statusCode == 401 )  return { 'ok': false, 'message': 'Invalid user name or password' };
    
    Map<String, dynamic> decodedResp = json.decode( resp.body );

    if ( decodedResp.containsKey('AccountName') ) {
      _prefs.accountName = decodedResp['AccountName'];
    }

    if ( decodedResp.containsKey('access_token') ) {
      
      _prefs.token = decodedResp['access_token'];

      return { 'ok': true, 'token': decodedResp['access_token'] };
    } else {
      return { 'ok': false, 'mensaje': 'Wrong user name or password' };
    }

  } 

 
}