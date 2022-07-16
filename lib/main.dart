import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> wordList = [];
  List<String> filteredWordList = [];

  void _loadWords() async {
    String tempData =
        await DefaultAssetBundle.of(context).loadString('assets/words.txt');
    setState(() {

      wordList = tempData.split(',');
      filteredWordList = wordList ;

    });
  }

  void _onSearch(value){
    setState(() {
      filteredWordList = wordList.where((item) => item.contains("$value")).toList();
      
    });
    

  }

  @override
  void initState(){
    super.initState();
    _loadWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Searches In Flutter")),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(decoration: new InputDecoration(
            hintText: "Search Here .."
          ),
          onChanged: _onSearch,),
          Expanded(child: ListView.builder(itemCount: filteredWordList.length,
          itemBuilder:(context , index ){
            return Card(child: ListTile(title: Text("${filteredWordList[index]}"),),);
          },)),
        ],
      ),
    ),);
    
  }
}