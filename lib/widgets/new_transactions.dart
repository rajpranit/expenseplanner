import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactions extends StatefulWidget {
  final Function newTansactions;

  NewTransactions(this.newTansactions);

  @override
  State<NewTransactions> createState() => _NewTransactionsState();
}

class _NewTransactionsState extends State<NewTransactions> {
  final textInput = TextEditingController();
  final amountInput = TextEditingController();
  DateTime _selectedDate;

  void _onSubmitted() {
    final enteredTitle = textInput.text;
    final enteredAmount = double.parse(amountInput.text);

    if (enteredTitle == null || enteredAmount <= 0) {
      return;
    }
    widget.newTansactions(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
            Container(
              height: 70,
              child: Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? 'no Date Chosen'
                        : DateFormat.yMd().format(_selectedDate).toString(),
                  ),
                  TextButton(
                    child: Text(
                      'choose Date',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _onSubmitted,
              child: Text(
                'Add Transaction',
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
