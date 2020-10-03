import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CharBart extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentageOfTotal;
  final f = new NumberFormat.compact();

  CharBart(this.label, this.spendingAmount, this.spendingPercentageOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 16,
          margin: EdgeInsets.only(top: 4),
          child: FittedBox(
            child: Text(
              '\$${f.format(spendingAmount)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Expanded(
          child: Container(
            width: 10,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPercentageOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 4),
          child: Text(label,
              style: TextStyle(
                color: Colors.grey,
              )),
        )
      ],
    );
  }
}
