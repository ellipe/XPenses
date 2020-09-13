import 'package:flutter/material.dart';
import '../models/TransactionModel.dart';

import './TransactionItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: ListView.builder(
          itemBuilder: (ctx, idx) {
            return TransactionItem(
              transactions[idx].title,
              transactions[idx].ammount,
              transactions[idx].date,
            );
          },
          itemCount: transactions.length,
        ));
  }
}
