import 'dart:async';

class LoginValidator {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);

    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('E-mail is not valid');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 0) {
      sink.add(password);
    } else {
      sink.addError('You must type your pasword');
    }
  });

  final validateUserName = StreamTransformer<String, String>.fromHandlers(
      handleData: (userName, sink) {
    if (userName.length >= 1) {
      sink.add(userName);
    } else {
      sink.addError('User name is invalid');
    }
  });

  final validateAccount = StreamTransformer<String, String>.fromHandlers(
      handleData: (account, sink) {
    if (account.length >= 1) {
      sink.add(account);
    } else {
      sink.addError('Account is invalid');
    }
  });
}
