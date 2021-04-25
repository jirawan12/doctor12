import 'package:flutter/material.dart';
import 'package:webviewDemo/datadase/Transactions.dart';
import 'package:webviewDemo/providers/transaction_provider.dart';
import 'package:webviewDemo/Screens/app/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:webviewDemo/form.dart';

class FormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final dogController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("แบบฟอร์มบันทึกข้อมูล"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: new InputDecoration(
                      labelText: "ชื่อสัตว์หรือชนิดของสัตว์"),
                  autofocus: false,
                  controller: titleController,
                  validator: (String str) {
                    if (str.isEmpty) {
                      return "กรุณาป้อนชื่อสัตว์หรือชนิดสัตว์ของคุณ";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      new InputDecoration(labelText: "หัวเรื่องที่นัดหมอ"),
                  autofocus: false,
                  controller: dogController,
                  validator: (String str) {
                    if (str.isEmpty) {
                      return "กรุณาป้อนหัวเรื่อง";
                    }

                    return null;
                  },
                ),
                FlatButton(
                  child: Text("เพิ่มข้อมูล"),
                  color: Colors.purple,
                  textColor: Colors.white,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      var title = titleController.text;
                      var dog = dogController.text;

                      Transactions statement = Transactions(
                          title: title, dog: dog, date: DateTime.now());

                      var provider = Provider.of<TransactionProvider>(context,
                          listen: false);
                      provider.addTransaction(statement);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) {
                                return MyHomePage();
                              }));
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
