import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:webviewDemo/datadase/Transactions.dart';
import 'package:webviewDemo/drawer_menu.dart';
import 'package:webviewDemo/providers/transaction_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TransactionProvider>(context, listen: false).initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("รายการ"),
          actions: [],
        ),
        drawer: DrawerMenu(),
        body: Consumer(
          builder: (context, TransactionProvider provider, Widget child) {
            var count = provider.transactions.length; //นับจำนวนข้อมูล
            if (count <= 0) {
              return Center(
                child: Text(
                  "ไม่พบข้อมูล",
                  style: TextStyle(fontSize: 35),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: count,
                  itemBuilder: (context, int index) {
                    Transactions data = provider.transactions[index];
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: FittedBox(
                            child: Text(data.title.toString()),
                          ),
                        ),
                        title: Text(data.dog),
                        subtitle: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () async {
                            final ConfirmAction action =
                                await _asyncConfirmDialog(context);
                            print("Confirm Action $action");
                          },
                        ),
                      ),
                    );
                  });
            }
          },
        ));
  }
}

enum ConfirmAction { Cancel, Accept }
Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('ลบรายการ'),
        content: const Text('คุณต้องการลบจริงหรือไม่'),
        actions: <Widget>[
          FlatButton(
            child: const Text('ยกเลิก'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          FlatButton(
            child: const Text('ตกลง'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Accept);
            },
          )
        ],
      );
    },
  );
}
