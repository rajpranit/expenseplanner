import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

Card TransactionItem(
    Transaction transaction, Function deleteTransaction, BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    color: Colors.white,
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
    elevation: 10,
    child: ListTile(
      leading: Container(
        child: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(child: Text('\$${transaction.amount.toString()}')),
          ),
        ),
      ),
      title: Text(
        '${transaction.title}',
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text(
        DateFormat.yMMMd().format(transaction.date).toString(),
        style: Theme.of(context).textTheme.bodyText1,
      ),
      trailing: MediaQuery.of(context).size.width > 400
          ? TextButton.icon(
              onPressed: () => deleteTransaction(transaction.id.toString()),
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              label: Text("Delete"),
            )
          : IconButton(
              onPressed: () => deleteTransaction(transaction.id.toString()),
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              )),
    ),
  );
}
