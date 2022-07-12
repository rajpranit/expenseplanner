import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/new_transactions.dart';
import './models/transaction.dart';
import './widgets/transactions_list.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _addNewTransaction(String txtitle, double txamount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txtitle,
      amount: txamount,
      date: DateTime.now(),
    );

    setState(() {
      transactions.add(newTx);
    });
  }

  void _showNewTransactionWidget(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(
            child: NewTransactions(_addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8AAAE5),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {_showNewTransactionWidget(context)},
            icon: Icon(
              Icons.add,
              color: Colors.amber.shade400,
            ),
          )
        ],
        backgroundColor: Color(0xFFFE5F55),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Expenser'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 15),
              child: Card(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Chart',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
                elevation: 15,
              ),
              width: double.infinity,
              height: 50,
            ),
            TransactionList(transactions),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFE5F55),
        child: Icon(
          Icons.add,
        ),
        onPressed: () => {_showNewTransactionWidget(context)},
      ),
    );
  }
}
