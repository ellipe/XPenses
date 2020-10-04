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
    return LayoutBuilder(
      builder: (ctx, contraints) {
        final maxHeight = contraints.maxHeight - 8;
        return Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 4,),
          child: Column(
            children: [
              Container(
                height: maxHeight * 0.15,
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
                height: maxHeight * 0.05,
              ),
              Container(
                height: maxHeight * 0.6,
                width: 15,
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
              SizedBox(
                height: maxHeight * 0.05,
              ),
              Container(
                height: maxHeight * 0.15,
                child: Text(label,
                    style: TextStyle(
                      color: Colors.grey,
                    )),
              )
            ],
          ),
        );
      },
    );
  }
}
