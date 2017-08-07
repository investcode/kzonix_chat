import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      theme: new ThemeData.dark(),
      home: new MainScreen()
  ));
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: new Text('Test'),
      ),
      body: new NewTest(),
    );
  }
}

/// Widget
class NewTest extends StatefulWidget {
  @override
  _NewTestInputState createState() => new _NewTestInputState();
}
/// State
class _NewTestInputState extends State<NewTest> {
  TextField _currentInput;

  void _handleInputChange(TextField input) {
    if (input != _currentInput){
      setState(() {
        _currentInput = input;
      });
    }
  }

  void _handleInputSubmitted(TextField input) {
    setState(() {
      _currentInput = const TextField();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextField _widget = new TextField(

      keyboardType: TextInputType.text,
      autofocus: true,
      style: new TextStyle(fontSize: 20.0),
    );
    Container _container = new Container(
      child: _widget,
      decoration: new BoxDecoration(
        border: new Border.all(
          color: Colors.green[300],
          width: 2.0,
        ),
      ),
      padding: new EdgeInsets.all(16.0),
    );
    return _container;
  }
}