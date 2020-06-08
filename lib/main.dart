import 'package:enablApp/src/bloc/bloc_provider.dart';
import 'package:enablApp/src/localization/app_translation_delegate.dart';
import 'package:enablApp/src/pages/home_page.dart';
import 'package:enablApp/src/routes/routes.dart';
import 'package:enablApp/src/storage/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import 'src/providers/zenotiProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();

  final storage = new FlutterSecureStorage();

  try {
    //clean up and create again,
    //this solves the exception if Android did a backup to Drive and reset
    await storage.delete(key: 'url');
    await storage.write(key: 'url', value: 'https://api.zenoti.com');
  } catch (e) {}
  runApp(MyApp());
}

//final currentStatus = Provider.of<ZenotiProvider>(context);
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final prefs = new UserPreferences();

    return BlocProvider(
      child: ChangeNotifierProvider<ZenotiProvider>(
        create: (context) => ZenotiProvider(),
        child: MaterialApp(
            title: 'Zenoti',
            // theme: myTheme,
            debugShowCheckedModeBanner: false,
            supportedLocales: [
              Locale('en', 'US'),
              // Locale('de', 'DE'),
            ],
            localizationsDelegates: [
              const AppTranslationsDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            // initialRoute: (prefs.token == '' || prefs.accountName == '' ? 'login' : 'home' ),
            initialRoute: 'login',
            routes: getApplicationRoutes(),
            onGenerateRoute: (RouteSettings settings) {
              return MaterialPageRoute(
                  builder: (BuildContext context) => HomePage());
            }
            //home: HomePage()
            ),
      ),
    );
  }
}
