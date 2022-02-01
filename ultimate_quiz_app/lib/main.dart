import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ultimate_quiz_app/providers/auth_provider.dart';
import 'package:ultimate_quiz_app/routes/route_generator.dart';
import 'package:ultimate_quiz_app/theme/theme_data.dart';
import 'package:ultimate_quiz_app/view/home/page/home_page.dart';
import 'package:ultimate_quiz_app/view/login/page/login_page.dart';

import 'view/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));

  //await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
        future: _initialization,
        builder: (context, appSnapshot) {
          return ChangeNotifierProvider(
            create: (context) => AuthProvider(),
            child: MaterialApp(
              title: 'Ko ne zna, znat ce poslije',
              debugShowCheckedModeBanner: false,
              theme: CustomTheme.themeData,
              home: appSnapshot.connectionState != ConnectionState.done
                  ? SplashScreen()
                  : StreamBuilder(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (ctx, userSnapshot) {
                        if (userSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SplashScreen();
                        }
                        if (userSnapshot.hasData) {
                          return const HomePage();
                        }
                        return LoginPage();
                      }),
              //initialRoute: SplashScreen.routeName,
              onGenerateRoute: (settings) =>
                  RouteGenerator.generateRoute(settings),
            ),
          );
        });
  }
}
