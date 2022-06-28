import 'dart:js';

import 'package:flutter/material.dart';
import 'package:queue/views/aux/aux_home.dart';
import 'package:queue/views/error.dart';
import 'package:queue/views/tabbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import './views/home.dart';
import './views/search.dart';
import 'views/aux/login.dart';
import 'views/aux/signup.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {
  setUrlStrategy(PathUrlStrategy());
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // print('T4EWT');
    // print(ModalRoute.of(context)?.settings.name);
    return MaterialApp(
      initialRoute: '/',
      // routes: {
      //   '/login_screen': (context) => LoginScreen(),
      //   '/registration_screen': (context) => RegistrationScreen(),
      //   '/home_screen': (context) => SearchPage(title: "Search"),
      //   '/aux_home_screen': (context) => AuxHomeScreen()
      // },
      onGenerateRoute: _getRoute,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}

Route<dynamic>? _getRoute(RouteSettings settings) {
  String route = "";
  if (settings.name != null) route = settings.name!;
  // print(route + "++=");

  if (settings.arguments != null) print(settings.arguments!);

  // switch (route) {
  //   case '/':
  //     return MaterialPageRoute(
  //         builder: (context) => SearchPage(title: "Search"));
  //   case route.contains('/queue'):
  //     print("here");
  // }

  if (route.contains("/queue/")) {
    route = route.substring(7);
    print(route);
    return MaterialPageRoute(builder: (context) => QTabBar(id: route));
  } else if (route == '/') {
    return MaterialPageRoute(
        builder: (context) => const SearchPage(id: "Search"));
  } else if (route.contains("/user")) {
    return MaterialPageRoute(builder: (context) => AuxHomeScreen());
  } else if (route.contains("/login")) {
    return MaterialPageRoute(builder: (context) => LoginScreen());
  } else if (route.contains("/register")) {
    return MaterialPageRoute(builder: (context) => RegistrationScreen());
  } else {
    return MaterialPageRoute(builder: (context) => ErrorScreen());
  }
}
