import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final String txTitle;
  final double txAmount;
  final DateTime txDate;

  TransactionItem(this.txTitle, this.txAmount, this.txDate);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            '\$$txAmount',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            txTitle,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            DateFormat.yMMMd().format(txDate),
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ])
      ]),
    );
  }
}
