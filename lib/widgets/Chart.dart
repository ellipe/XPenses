import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/TransactionModel.dart';
import './CharBar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransactions;

  Chart(this._recentTransactions);

  List<Map<String, Object>> get _groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double _dailyAmount = 0.0;

      for (var i = 0; i < _recentTransactions.length; i++) {
        if (_recentTransactions[i].date.day == weekDay.day &&
            _recentTransactions[i].date.month == weekDay.month &&
            _recentTransactions[i].date.year == weekDay.year) {
          _dailyAmount += _recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay),
        'amount': _dailyAmount,
      };
    });
  }

  double get totalSpending {
    return _groupedTransactionsValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _groupedTransactionsValues.map((tx){
          return Flexible(fit: FlexFit.tight,
          child: CharBart(tx['day'], tx['amount'], totalSpending == 0.0 ? 0 : ( tx['amount'] as double) / totalSpending),);
        }).toList(),
      ),
    );
  }
}
