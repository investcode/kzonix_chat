import 'package:flutter/material.dart';

class AppInitializer extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting
        // the app, try changing the primarySwatch below to Colors.green
        // and then invoke "hot reload" (press "r" in the console where
        // you ran "flutter run", or press Run > Hot Reload App in IntelliJ).
        // Notice that the counter didn't reset back to zero -- the application
        // is not restarted.
        accentColor: Colors.deepOrangeAccent,
        accentColorBrightness: ThemeData.estimateBrightnessForColor(
            Colors.deepOrange),
        accentTextTheme: Theme
            .of(context)
            .accentTextTheme,
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        secondaryHeaderColor: Colors.deepOrange,
        primaryColor: Colors.deepOrange,
        primaryColorBrightness: Brightness.dark,
      ),
      home: new InputPoint(title: 'Hello Flutter'),
    );
  }
}

class InputPoint extends StatefulWidget {
  InputPoint({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful,
  // meaning that it has a State object (defined below) that contains
  // fields that affect how it looks.

  // This class is the configuration for the state. It holds the
  // values (in this case the title) provided by the parent (in this
  // case the App widget) and used by the build method of the State.
  // Fields in a Widget subclass are always marked "final".

  final String title;

  @override
  _InputPoint createState() => new _InputPoint();
}

class _InputPoint extends State<InputPoint>
    with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )
      ..forward();

    _animation = new CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.9, curve: Curves.fastOutSlowIn),
        reverseCurve: Curves.fastOutSlowIn
    )
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.dismissed)
          _controller.forward();
        else if (status == AnimationStatus.completed)
          _controller.reverse();
      });
  }

  @override
  void dispose() {
    _controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance
    // as done by the _incrementCounter method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather th n having to individually change
    // instances of widgets.
    Widget _buildIndicators(BuildContext context, Widget child) {
      final List<Widget> list = [
        new Container(
            width: 110.0,
            height: 110.0,
            child: const CircularProgressIndicator(
                backgroundColor: Colors.amber)
        ),
        new Text(
          "Kzonix Chat",
          style: new TextStyle(
              color: Colors.deepOrange.shade300,
              fontFamily: "Roboto",
              fontSize: 24.0
          ),
        )
      ];
      return new Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: list
            .map((Widget c) =>
        new Container(
          child: c,
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        ),)
            .toList(),

      );
    }

    return new Scaffold(
      body: new Container(
        padding: const EdgeInsets.all(32.00),
        child: new Center(
          widthFactor: double.MIN_POSITIVE,
          heightFactor: double.MIN_POSITIVE,
          child: new Container(
            constraints: new BoxConstraints(
              maxHeight: double.INFINITY,
              maxWidth: double.INFINITY,
            ),

            child: new AnimatedBuilder(
                animation: _animation,
                builder: _buildIndicators
            ),
            decoration: new BoxDecoration(
              color: Colors.deepOrange.shade800,

              borderRadius: new BorderRadius.all(
                  new Radius.circular(double.INFINITY)),
            ),
          ),
        ),
        decoration: new BoxDecoration(
            color: Colors.deepOrange.shade800

        ),
        width: double.INFINITY,
        height: double.INFINITY,
      ),
      primary: true,
    );
  }
}