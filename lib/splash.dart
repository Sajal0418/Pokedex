import 'package:flutter/material.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: 'Pokedex')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Set the background color using a hex code
        color: Colors.redAccent, // Example hex color code
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('public/images/logo-type.png', width: 300, height: 100),
              const Text(
                'Welcome...',
                style: TextStyle(
                    fontFamily: 'Roboto Mono sample',
                    fontSize: 15,
                    color: Color(0xFF0075BE),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
