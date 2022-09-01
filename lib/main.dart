import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets/chart.dart';
import './widgets/new_transactions.dart';
import './models/transaction.dart';
import './widgets/transactions_list.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitDown,
//     DeviceOrientation.portraitUp,
//   ]);
//   runApp(MyApp());
// }
void main() => {runApp(MyApp())};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color.fromARGB(255, 7, 7, 7),
          ),
          bodyText1: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Color.fromARGB(222, 65, 63, 63),
          ),
          button: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamily: 'QuickSand',
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Color(0xFF8AAAE5),
      ),
      title: 'Expenser',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _usertransactions = [
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
    ),
    Transaction(
      id: '3',
      title: 'Groceries',
      amount: 541,
      date: DateTime.now(),
    ),
    Transaction(
      id: '4',
      title: 'Groceries',
      amount: 541,
      date: DateTime.now(),
    )
  ];

  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _usertransactions.where(
      (tx) {
        return tx.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  void _addNewTransaction(
    String txtitle,
    double txamount,
    DateTime enteredDate,
  ) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txtitle,
      amount: txamount,
      date: enteredDate,
    );

    setState(() {
      _usertransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      print(_showChart);
      _usertransactions.removeWhere((transaction) => transaction.id == id);
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

  List<Widget> _showLandscapeContent(Widget txListWidget, AppBar appBar) {
    return [
      Container(
        child: Row(
          children: [
            Text("Show Chart"),
            Switch(
              value: _showChart,
              onChanged: (val) {
                setState(() {
                  _showChart = val;
                });
              },
            )
          ],
        ),
      ),
      _showChart
          ? Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.6,
              child: Chart(_recentTransactions),
            )
          : txListWidget
    ];
  }

  List<Widget> _showPortraitContent(Widget txListWidget, AppBar appBar) {
    return [
      Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.2,
        child: Chart(_recentTransactions),
      ),
      txListWidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    print('build()Homepage');
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      actions: [
        IconButton(
          onPressed: () => {_showNewTransactionWidget(context)},
          icon: Icon(
            Icons.add,
            color: Colors.amber.shade400,
          ),
        )
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Expenser'),
        ],
      ),
    );

    final txListWidget = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.8,
      child: TransactionList(_usertransactions, _deleteTransaction),
    );

    return Scaffold(
      backgroundColor: Color(0xFF8AAAE5),
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (isLandscape) ..._showLandscapeContent(txListWidget, appBar),
              if (!isLandscape) ..._showPortraitContent(txListWidget, appBar),
            ]),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () => {_showNewTransactionWidget(context)},
      ),
    );
  }
}
