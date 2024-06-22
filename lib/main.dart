import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'machine test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 6, 31, 250)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'machine test'),
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

  List dataList = [];
  TextStyle primaryStyleTxt = const TextStyle(color: Colors.black87, fontWeight: FontWeight.w600);
  TextStyle secondaryStyleTxt = const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500);
  TextStyle tertiaryStyleTxt = const TextStyle(color: Colors.black87, fontWeight: FontWeight.w400);


  @override
  void initState() {
    super.initState();
    iniData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title,style: const TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: ListView.builder(itemCount: dataList.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(padding: EdgeInsets.all(5),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(dataList[index]["name"],style: primaryStyleTxt,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(dataList[index]["username"], style: secondaryStyleTxt,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(dataList[index]["email"], style: tertiaryStyleTxt,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(dataList[index]["phone"], style: tertiaryStyleTxt,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(dataList[index]["company"]["name"], style: tertiaryStyleTxt,),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void iniData() async {
    final list =
        (await Dio().get("https://jsonplaceholder.typicode.com/users")).data;
    log(list.toString());
    dataList = list;
    setState(() {
      
    });
  }
}
