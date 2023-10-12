import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_widget_generator/json_widget_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  json = await rootBundle.loadString("assets/widgets.json");
  runApp(const MyApp());
}

String? json;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: WidgetGenerator.build1(
        json: json ?? "",
        clickListener: _ClickListener(),
        margin: const EdgeInsets.only(bottom: 10),
      ),
    );
  }
}

class _ClickListener implements GeneratorClickListener {
  @override
  void onClick(Map<dynamic, dynamic> data) {}
}
