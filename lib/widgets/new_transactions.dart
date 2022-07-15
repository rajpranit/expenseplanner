import 'package:flutter/material.dart';

class NewTransactions extends StatefulWidget {
  final Function newTansactions;

  NewTransactions(this.newTansactions);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final textInput = TextEditingController();

  final amountInput = TextEditingController();

  void _onSubmitted() {
    final enteredTitle = textInput.text;
    final enteredAmount = double.parse(amountInput.text);

    if (enteredTitle == null || enteredAmount <= 0) {
      return;
    }
    widget.newTansactions(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: textInput,
              cursorColor: Color(0xFF2F3C7E),
              textAlign: TextAlign.center,
              autofocus: false,
              onSubmitted: (_) => _onSubmitted(),
              decoration: InputDecoration(
                  labelText: 'Item', hoverColor: Color(0xFF2F3C7E)),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: amountInput,
              textAlign: TextAlign.center,
              autofocus: false,
              onSubmitted: (_) => _onSubmitted(),
              decoration: InputDecoration(labelText: 'Price'),
            ),
            TextButton(
              onPressed: _onSubmitted,
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(
                primary: Color(0xFF317773),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
