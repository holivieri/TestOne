import 'package:flutter/material.dart';
import 'package:noticiero/src/pages/tab1_page.dart';
import 'package:noticiero/src/pages/tab2_page.dart';
import 'package:noticiero/src/widgets/drawer.dart';
import 'package:provider/provider.dart';

GlobalKey<ScaffoldState> _drawerKey = GlobalKey();


class TabsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _NavigationModel(),
          child: Scaffold(
                    key: _drawerKey,
                    body: _Pages(),
                    bottomNavigationBar: _Navegacion(),
                    drawer: getDrawer(context),
                  ),
    );
  }
}

class _Navegacion extends StatelessWidget {

 

  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
                            currentIndex: navegacionModel.paginaActual,
                            onTap: (i) => navegacionModel.paginaActual = i,
                            items: [
                                  BottomNavigationBarItem(icon: Icon(Icons.pie_chart), title: Text('Dashboard')),
                                  BottomNavigationBarItem(icon: Icon(Icons.message), title: Text('Collaborate')),
                                  BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text('Menu'))
                                  ]
                            );
  }
}

class _Pages extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavigationModel>(context);

    return PageView(
            controller: navegacionModel.pagecontroller,
            //physics: BouncingScrollPhysics(), // para poder mover las pantallas
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
                Tab1Page(),
                Tabs2Page(),
            ],
            );
  }
}

class _NavigationModel with ChangeNotifier {

  PageController _pageController = new PageController( initialPage: 1);


  int _paginaActual = 0;

  int get paginaActual => _paginaActual;

  set paginaActual( int valor ) {
    if(valor == 2){
      _drawerKey.currentState.openDrawer();
    } else{
      _paginaActual = valor;
      _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
      notifyListeners();
    }
  }

  PageController get pagecontroller => this._pageController;


}