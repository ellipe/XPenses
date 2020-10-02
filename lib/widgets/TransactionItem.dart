import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/TransactionModel.dart';

class TransactionItem extends StatelessWidget {
  final f = new NumberFormat.compact();

  final Transaction transaction;
  final Function deleteTx;

  TransactionItem({this.transaction, this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 10,
      ),
      elevation: 5,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                '\$${f.format(transaction.amount)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => deleteTx(transaction.id),
          color: Theme.of(context).errorColor,
        ),
      ),
    );
  }
}
