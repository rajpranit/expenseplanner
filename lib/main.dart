import 'package:flutter/material.dart';
import './widgets/user_transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBEAEB),
      appBar: AppBar(
        backgroundColor: Color(0xFF2F3C7E),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Expenser'),
          ],
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Card(
              color: Color(0xFF2F3C7E),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Chart',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              elevation: 15,
            ),
            width: double.infinity,
            height: 50,
          ),
          UserTransactions()

        ],
      ),
    );
  }
}
