import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'dart:async';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'NLIO024azfH9pJrmOu6UblCeAxjqfJEQP6yf8n7o';
  final keyClientKey = 'i3AK1t4plvFcNjabmp080R5Jx4ourbkZyybaMvTw';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

   var firstObject = ParseObject('FirstClass')
    ..set(
        'message', 'Hey ! First message from Flutter. Parse is now connected');
  await firstObject.save();
  
  print('done');
  //runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const Text(
      "Bienvenue",
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
    );
    return MaterialApp(
      // Application name

      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 10), () {
      Navigator.of(context).push(createRoute());
    });
    return Scaffold(
      backgroundColor:
          Color.alphaBlend(const Color(0xffa6ec55), Colors.lightGreenAccent),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/LOGO4.png', height: 150),
            const Text(
              "Bienvenue",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Image.asset('assets/images/scv.png'),
          ],
        ),
      ),
    );
  }
}

Route createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Login(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
