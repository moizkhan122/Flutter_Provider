import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Provider/providerExample/CounterExampleProvider.dart';
import 'package:provider/provider.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countprovider = Provider.of<CounterExampleProvider>(context,listen: false);
    //continue with seconds time
    Timer.periodic(Duration(seconds:1), 
    (timer) { 
      countprovider.setCount();
    });
  }
  @override
  Widget build(BuildContext context) {
    print("build");                                                 //this listen false will consider t build only consumer widget 
    final countprovider = Provider.of<CounterExampleProvider>(context,listen: false);//instance of counterprovider Class
    return Scaffold(
      body: Center(
              //this consumer widget will build only this widget
        child: Consumer<CounterExampleProvider>(builder: (context, value, child) {
          return Text(value.count.toString(),style: TextStyle(fontSize: 40,color: Colors.black),);
        },)),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countprovider.setCount();
        },
        child: Icon(Icons.add),
        ),
    );
  }
}