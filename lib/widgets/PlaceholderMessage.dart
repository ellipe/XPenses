import 'package:flutter/material.dart';

class PlaceholderMessage extends StatelessWidget {

  PlaceholderMessage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'No transactions available yet!',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 200,
          child: Image.asset(
            'assets/images/waiting.png',
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
