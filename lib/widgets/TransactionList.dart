import 'package:flutter/material.dart';
import '../models/TransactionModel.dart';

import './TransactionItem.dart';
import './PlaceholderMessage.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList({this.transactions, this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 650,
        child: transactions.isEmpty
            ? PlaceholderMessage()
            : ListView.builder(
                itemBuilder: (ctx, idx) {
                  return TransactionItem(
                    transaction: transactions[idx],
                    deleteTx: deleteTx
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
