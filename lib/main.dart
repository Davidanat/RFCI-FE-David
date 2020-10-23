import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController titleController = TextEditingController();

  var displayResult = '';
  var undoResult = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Refactory",
            style: TextStyle(color: Colors.amber),
          ),
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: [
            SizedBox(height: 100),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black)),
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Type your input"),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Output: ${this.displayResult}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          this.displayResult = _reverseReturns();
                        });
                      },
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.amber,
                      child: Text(
                        'Reverse',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    SizedBox(width: 30),
                    RaisedButton(
                      onPressed: () {
                        setState(() {
                          if (displayResult != "" ||
                              titleController.text != "") {
                            _reset();
                          } else {
                            titleController.text = undoResult;
                          }
                        });
                      },
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Colors.amber,
                      child: Text(
                        'Undo / Redo',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _reverseReturns() {
    String input = titleController.text;
    String result = '$input';
    return result;
  }

  void _reset() {
    titleController.text = '';
    undoResult = displayResult;
    displayResult = '';
  }
}
