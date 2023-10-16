import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_widget_generator/json_widget_generator.dart';
import 'package:nymble_test/common/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Utils.jsonData = await rootBundle.loadString("assets/widgets.json");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nymble Test',
      theme: Utils.getThemeValue(),
      home: const MyHomePage(title: 'Nymble Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: WidgetGenerator.generate(
          json: Utils.jsonData ?? "",
          clickListener: _ClickListener(),
          margin: const EdgeInsets.only(bottom: 10),
        ),
      ),
    );
  }
}

class _ClickListener implements GeneratorClickListener {
  @override
  void onClick(Map<dynamic, dynamic> data) {
    print(data);
  }
}
