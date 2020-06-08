import 'package:enablApp/src/bloc/login_bloc.dart';
import 'package:flutter/material.dart';


class BlocProvider extends InheritedWidget {

  static BlocProvider _instance;

  factory BlocProvider({ Key key, Widget child }) {

    if ( _instance == null ) {
      _instance = new BlocProvider._internal(key: key, child: child );
    }

    return _instance;

  }

  BlocProvider._internal({ Key key, Widget child })
    : super(key: key, child: child );


  final loginBloc = LoginBloc();

  // Provider({ Key key, Widget child })
  //   : super(key: key, child: child );

 
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of ( BuildContext context ) {
    return context.dependOnInheritedWidgetOfExactType<BlocProvider>().loginBloc;
  }

}