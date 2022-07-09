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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Card(
              color: Color.fromARGB(210, 247, 36, 36),
              child: Text(
                'Chart',
                textAlign: TextAlign.center,
              ),
              elevation: 15,
            ),
            width: double.infinity,
            height: 50,
          ),
          Column(
              children: transactions.map((tx) {
            return Container(
              height: 150,
              child: Card(
                child: Row(
                  children: [
                    Text(
                      tx.amount.toString(),
                    ),
                    Column(
                      children: [
                        Text(tx.title),
                        Text(
                          tx.date.toString(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }).toList())
        ],
      ),
    );
  }
}
