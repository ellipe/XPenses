import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets/TransactionList.dart';
import './widgets/NewTransaction.dart';
import './models/TransactionModel.dart';
import './customs/bottom_sheet_custom.dart';
import './widgets/Chart.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XPenses',
      theme: ThemeData(
        fontFamily: 'Quicksand',
        primarySwatch: Colors.blue,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(title: 'XPenses'),
    );
  }
}

class Home extends StatefulWidget {
  final String title;

  Home({this.title});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime selectedDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: selectedDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  void _showNewTransactionForm(BuildContext ctx) {
    showModalCustomBottomSheet(
      context: ctx,
      builder: (_) {
        return FractionallySizedBox(
          heightFactor: 0.55,
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(this.widget.title),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _showNewTransactionForm(context),
        )
      ],
    );
    final mediaQuery = MediaQuery.of(context),
        deductedHeight = appBar.preferredSize.height + mediaQuery.padding.top,
        availableHeight = mediaQuery.size.height - deductedHeight;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                height: availableHeight * 0.2,
                child: Chart(
                  _recentTransactions,
                )),
            Container(
              height: availableHeight * 0.8,
              child: TransactionList(
                  transactions: _userTransactions,
                  deleteTx: _deleteTransaction),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showNewTransactionForm(context),
      ),
    );
  }
}
