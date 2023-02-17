import 'package:flutter/material.dart';

class ValueListnerStateLess extends StatelessWidget {
   ValueListnerStateLess({super.key});

    ValueNotifier counter = ValueNotifier(0);
    ValueNotifier<bool> toggle = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context){
    print("build");
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ValueListenableBuilder(
              valueListenable: toggle,
             builder: (context, value, child) {
               return TextFormField(
                obscureText: toggle.value,
                decoration: InputDecoration(
                  suffixIcon:IconButton(
                    onPressed: (){
                      toggle.value = !toggle.value;
                    },icon: Icon(toggle.value ?  Icons.visibility_off : Icons.visibility),),
                  hintText: "Enter Password"),
               );
             },),),

          Center(
            child: ValueListenableBuilder(valueListenable: counter,
             builder: (context, value, child) {
               return Text(counter.value.toString(),style:const TextStyle(fontSize: 35,color: Colors.black),);
             },),),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            counter.value++;
          },
          child:const Icon(Icons.add),
          ),
    );
  }
}