import 'package:enablApp/src/bloc/bloc_provider.dart';
import 'package:enablApp/src/bloc/login_bloc.dart';
import 'package:enablApp/src/services/userManagement_service.dart';
import 'package:enablApp/src/widgets/labeltext.dart';
import 'package:enablApp/src/widgets/raisedgradient_button.dart';
import 'package:flutter/material.dart';
import 'package:enablApp/src/theme/constants.dart' as util;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final bloc = BlocProvider.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              height: height * 0.30,
              padding: EdgeInsets.only(top: 20.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [util.gradientColor1, util.gradientColor2]),
              ),
              child: SizedBox(
                height: 30.0,
                child: new Container(
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage(
                              'assets/images/icon-v1.png'), // To do revisit logo for Enabl App
                          fit: BoxFit.contain)),
                ),
              ),
            ),
            _hasError
                ? Container(
                    width: double.infinity,
                    height: height / 15,
                    color: util.errorColor,
                    alignment: Alignment.center,
                    child: _showErrorBanner(),
                  )
                : SizedBox(
                    height: height / 15,
                  ),
            SizedBox(height: 10.0),
            _accountField(bloc),
            _usernameField(bloc),
            _passwordField(bloc),
            SizedBox(height: 60.0),
            _forgotPasswordField(),
            SizedBox(height: 30.0),
            _loginButton(bloc)
          ],
        ),
      ),
    );
  }

  Widget _accountField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.accountStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                icon: Icon(Icons.person_outline, color: Colors.blue),
                labelText: 'Account',
                errorText: snapshot.error),
            onChanged: bloc.changeAccount,
          ),
        );
      },
    );
  }

  Widget _usernameField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.usernameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                icon: Icon(Icons.person_outline, color: Colors.blue),
                labelText: 'Name',
                errorText: snapshot.error),
            onChanged: bloc.changeUserName,
          ),
        );
      },
    );
  }

  Widget _passwordField(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
                icon: Icon(Icons.lock_outline, color: Colors.blue),
                labelText: 'Password',
                errorText: snapshot.error),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _loginButton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedGradientButton(
            width: MediaQuery.of(context).size.width / 2,
            height: 10.0,
            child: LabelText(
              text: 'app_login_signin',
              color: util.themeWhite,
              fontSize: util.kButtonTextFontSize,
              isUpperCase: false,
              maxFontSize: util.kMaxButtonTextFontSize,
            ),
            gradient: LinearGradient(
              colors: [util.gradientColor1, util.gradientColor2],
            ),
            onPressed: snapshot.hasData ? () => _login(bloc, context) : null);
      },
    );
  }

  Widget _showErrorBanner() {
    TextStyle errStyle =
        TextStyle(fontWeight: FontWeight.bold, color: Colors.white);

    return Container(
        height: 15.0,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text('Wrong user name or password', style: errStyle),
        ));
  }

  Widget _forgotPasswordField() {
    return Container();
  }

  void _login(LoginBloc bloc, BuildContext context) async {
    UserManagementService _usermanagement = new UserManagementService();
    Map result =
        await _usermanagement.login(bloc.username, bloc.password, bloc.account);

    if (result['ok']) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      setState(() {
        _hasError = true;
      });
    }
  }
}
