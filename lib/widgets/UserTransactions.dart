import 'package:flutter/material.dart';
import './NewTransaction.dart';
import './TransactionList.dart';
import '../models/TransactionModel.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1',
      title: 'New shoes',
      ammount: 200000,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Groceries',
      ammount: 300000,
      date: DateTime.now(),
    ),
    Transaction(
      id: '3',
      title: 'Video Games',
      ammount: 230,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double ammount){
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      ammount: ammount,
      date: DateTime.now()
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(transactions: _userTransactions,)
      ],
    );
  }
}