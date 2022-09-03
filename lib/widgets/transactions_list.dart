import 'package:flutter/material.dart';
import '../Utilities/TransactionItem.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    print('build()transactionlist');
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Color(0xFFFFFFF)),
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Text("There is nothing to show here",
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(height: 20),
                    Container(
                      height: constraints.maxHeight * 0.5,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                );
              },
            )
          : ListView(
              children: transactions
                  .map(
                    (e) => TransactionItem(
                      key: ValueKey(e.id),
                      transaction: e,
                      deleteTx: deleteTransaction,
                    ),
                  )
                  .toList()),
    );
  }
}
