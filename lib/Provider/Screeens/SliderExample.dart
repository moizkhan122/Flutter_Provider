import 'package:flutter/material.dart';
import 'package:flutter_application_1/Provider/providerExample/SliderExample.dart';
import 'package:provider/provider.dart';

class sliderExample extends StatefulWidget {
  const sliderExample({super.key});

  @override
  State<sliderExample> createState() => _sliderExampleState();
}

class _sliderExampleState extends State<sliderExample> {
  @override
  Widget build(BuildContext context) {
  print("build");
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<SliderExampleProvider>(builder: (context, value, child) {
              return Slider(
              min: 0,
              max: 1,
              value: value.value, 
            onChanged: (val) {

              value.setVal(val);
              
            },); 
            },),
            Consumer<SliderExampleProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 70,
                    color: Colors.red.withOpacity(value.value),
                    child: Center(child: Text("Conatiner 1",style: TextStyle(fontSize: 25,color: Colors.white),)),
                    ),
                ),
                 Expanded(
                  child: Container(
                    height: 70,
                    color: Colors.yellow.withOpacity(value.value),
                    child: Center(child: Text("Conatiner 2",style: TextStyle(fontSize: 25,color: Colors.white),)),
                    ),
                )
              ],);  
            },)
            
          ],)),
    );
  }
}