import 'dart:async';
import 'package:enablApp/src/bloc/login_validator.dart';
import 'package:rxdart/rxdart.dart';


class LoginBloc with LoginValidator {


  final _userNameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _accountController  = BehaviorSubject<String>();

  
  Stream<String> get usernameStream    => _userNameController.stream.transform( validateUserName );
  Stream<String> get passwordStream => _passwordController.stream.transform( validatePassword );
  Stream<String> get accountStream => _accountController.stream.transform( validateAccount );

  Stream<bool> get formValidStream => 
      Rx.combineLatest3(usernameStream, passwordStream, accountStream, (x, y, z) => true );



  
  Function(String) get changeUserName    => _userNameController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeAccount => _accountController.sink.add;


  String get username    => _userNameController.value;
  String get password => _passwordController.value;
  String get account => _accountController.value;

  dispose() {
    _userNameController?.close();
    _passwordController?.close();
    _accountController?.close();
  }

}

