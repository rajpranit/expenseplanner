import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

   final List<Transaction> transactions;

   TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Color(0xFFFFFFF)),
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {

          return Container(
            child: Card(
              elevation: 5,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      ' \u{20B9}${transactions[index].amount.toStringAsFixed(2)}',
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
                        color: Color(0xFF4F6367),
                        width: 1,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactions[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF317773),
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd().format(transactions[index].date),
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
        },
        itemCount: transactions.length,
      ),

    );
  }
}
