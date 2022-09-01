import 'package:flutter/material.dart';

class NoList extends StatelessWidget {
  const NoList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
    );
  }
}
