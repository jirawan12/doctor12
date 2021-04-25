import 'package:flutter/material.dart';
import 'package:webviewDemo/drawer_menu.dart';
import 'package:webviewDemo/pages/multi_example.dart';
import 'package:webviewDemo/providers/transaction_provider.dart';
import 'package:webviewDemo/Screens/app/form_screen.dart';
import 'package:webviewDemo/Screens/app/home_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:webviewDemo/datadase/Transactions.dart';

class Forms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'รายการ'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: TabBarView(
          children: [HomeScreen(), FormScreen()],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => StartPage())),
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
