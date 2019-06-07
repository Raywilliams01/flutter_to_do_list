import 'package:flutter_web/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _task = [];

  final _formKey = GlobalKey<FormState>();
  TextEditingController myController = TextEditingController();
  String _displayText = "";

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void addItemToList() {
    this.setState(() {
      _task.add(myController.text);
      myController.text = "";
      // myController.clear();
    });
  }

  void addString(text) {
    this.setState(() {
      _displayText += text;
    });
  }

  void removeItemAtIndex(index) {
    this.setState(() {
      _task.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(myController.text);
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: TextField(
              controller: myController,
              onChanged: (text) => addString(text),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () => addItemToList(),
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _task.length,
              padding: EdgeInsets.all(4.0),
              itemBuilder: (BuildContext context, int i) {
                String item = _task[i];
                return GestureDetector(
                  onTap: () => removeItemAtIndex(i),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text("To Do $item"),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
