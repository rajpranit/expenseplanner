import 'package:flutter/material.dart';

class NewTransactions extends StatelessWidget {
  final Function newTansactions;
  final textInput = TextEditingController();
  final amountInput = TextEditingController();

  NewTransactions(this.newTansactions);

  void onSubmitted()  {

    final enteredTitle = textInput.text;
    final enteredAmount = double.parse(amountInput.text);

    if(enteredTitle == null || enteredAmount <=0 ){
      return;
    }
        newTansactions(
          enteredTitle,
          enteredAmount
        );
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
              onSubmitted: (_) => onSubmitted(),
              decoration: InputDecoration(
                  labelText: 'Item', hoverColor: Color(0xFF2F3C7E)),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: amountInput,
              textAlign: TextAlign.center,
              autofocus: false,
              onSubmitted: (_) => onSubmitted(),
              decoration: InputDecoration(labelText: 'Price'),
            ),
            TextButton(
              onPressed: onSubmitted,
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(
                primary: Color(0xFF2F3C7E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
