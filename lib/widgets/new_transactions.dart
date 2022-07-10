import 'package:flutter/material.dart';


class NewTransactions extends StatelessWidget {


  final textInput = TextEditingController();
  final amountInput = TextEditingController();

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
                    decoration: InputDecoration(
                        labelText: 'Item', hoverColor: Color(0xFF2F3C7E)),
                  ),
                  TextField(
                    controller: amountInput,
                    textAlign: TextAlign.center,
                    autofocus: false,
                    decoration: InputDecoration(labelText: 'Price'),
                  ),
                  TextButton(
                    onPressed: () => {
                      print(textInput.text),
                      print(amountInput.text),
                    },
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