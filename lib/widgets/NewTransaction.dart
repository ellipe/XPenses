import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;
  bool _enableSubmit = false;

  void _validateData() {
    final title = _titleController.text;
    final amount = _amountController.text.isNotEmpty
        ? double.parse(_amountController.text)
        : 0;

    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      setState(() {
        _enableSubmit = false;
      });
      return;
    } else {
      setState(() {
        _enableSubmit = true;
      });
    }
  }

  void _submitData() {
    final title = _titleController.text;
    final amount = _amountController.text.isNotEmpty
        ? double.parse(_amountController.text)
        : 0;

    widget.addTransaction(title, amount, _selectedDate);

    Navigator.of(context).pop();
  }

  _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        _validateData();
        FocusScope.of(context).requestFocus(_dateFocus);
      }
      setState(() {
        _selectedDate = pickedDate;
      });

      _validateData();
      FocusScope.of(context).requestFocus(_dateFocus);
    });
  }

  // focusNodes
  final _buttonFocus = new FocusNode();
  final _amountFocus = new FocusNode();
  final _dateFocus = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
            ),
            controller: _titleController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) {
              FocusScope.of(context).requestFocus(_amountFocus);
              _validateData();
            },
          ),
          TextField(
              focusNode: _amountFocus,
              decoration: InputDecoration(labelText: 'amount'),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(_dateFocus);
                _validateData();
              }),
          Container(
            height: 60,
            child: Row(children: [
              Expanded(
                  child: Text(_selectedDate == null
                      ? 'No Date Chosen!'
                      : 'Chosen Date: ${DateFormat.yMMMd().format(_selectedDate)}')),
              FlatButton(
                focusNode: _dateFocus,
                textColor: Theme.of(context).primaryColor,
                child: Text(
                  'Choose Date',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: _presentDatePicker,
              )
            ]),
          ),
          SizedBox(
            width: double.infinity,
            child: FlatButton(
              focusNode: _buttonFocus,
              child: Text('Add Transaction'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: _enableSubmit ? _submitData : null,
            ),
          ),
        ],
      ),
    );
  }
}
