import 'package:flutter/material.dart';
import './transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(
      id: '1',
      title: 'Petrol',
      amount: 233,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Groceries',
      amount: 541,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Container(
              child: Card(
                child: Text(
                  'Chart',
                  textAlign: TextAlign.center,
                ),
                elevation: 10,
              ),
              width: double.infinity,
              height: 50,
            ),
            Card(
              child: Container(
                child: Text(
                  'List of TX',
                  textAlign: TextAlign.center,
                ),
                width: double.infinity,
                height: 50,
              ),
              elevation: 10,
            )
          ],
        ));
  }
}
