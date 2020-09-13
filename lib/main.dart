import 'package:flutter/material.dart';
import 'widgets/UserTransactions.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XPenses',
      theme: ThemeData(
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(title: 'XPenses'),
    );
  }
}

class Home extends StatelessWidget {
  final String title;

  Home({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: SingleChildScrollView(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart!'),
                color: Colors.amber,
                elevation: 10,
              ),
            ),
            UserTransactions(),
          ],
        ),
      ),
    );
  }
}
