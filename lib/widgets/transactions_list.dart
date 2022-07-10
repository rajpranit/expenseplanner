import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

   List<Transaction> transactions = [];

   TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Container(
          child: Card(
            elevation: 15,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    ' \u{20B9}${tx.amount}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.alphaBlend(
                        Colors.black45,
                        Colors.black45,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(234, 255, 255, 255),
                    border: Border.all(
                      color: Color(0xFF2F3C7E),
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tx.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xFF2F3C7E),
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(tx.date),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color.fromARGB(239, 90, 87, 87)),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
