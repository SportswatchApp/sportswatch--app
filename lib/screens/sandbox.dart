import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //enable this line if you want test Dark Mode
      //theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<String>>();
  String _itemChosen = "hello";
  ModelUserTest first = new ModelUserTest("one", 1);
  ModelUserTest secound = new ModelUserTest("two", 2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DropdownSearch Demo")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(4),
            children: <Widget>[
              Text(_itemChosen),

              ///Menu Mode with no searchBox
              DropdownSearch<ModelUserTest>(
                hint: "Select a country",
                mode: Mode.MENU,
                items: [first, secound],
                itemAsString: (ModelUserTest? u) => u!.name,
                label: "Menu mode",
                showClearButton: true,
                showSearchBox: true,
                onChanged: (ModelUserTest? chosen) => setState(() {
                  _itemChosen = chosen!.value.toString();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModelUserTest {
  String name = "";
  int value = 0;

  ModelUserTest(this.name, this.value);
}
