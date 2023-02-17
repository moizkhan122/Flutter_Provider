import 'package:flutter/material.dart';
import 'package:flutter_application_1/Provider/providerExample/LoginAuthProvider.dart';
import 'package:provider/provider.dart';


class AuthLoginAPi extends StatefulWidget {
  const AuthLoginAPi({super.key});

  @override
  State<AuthLoginAPi> createState() => _AuthLoginAPiState();
}

class _AuthLoginAPiState extends State<AuthLoginAPi> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  ValueNotifier toggle = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    final authProvider  = Provider.of<LoginAuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login Page")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: email,
                decoration: InputDecoration(hintText: "Email"),
              ),
              SizedBox(height: 20,),

              ValueListenableBuilder(
              valueListenable: toggle,
             builder: (context, value, child) {
               return TextFormField(
                controller: password,
                obscureText: toggle.value,
                decoration: InputDecoration(
                  suffixIcon:IconButton(
                    onPressed: (){
                      toggle.value = !toggle.value;
                    },icon: Icon(toggle.value ?  Icons.visibility_off : Icons.visibility),),
                  hintText: "Enter Password"),
               );
             },),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: (){
                  authProvider.Login(
                    email.text.toString(), 
                    password.text.toString());
                }, 
                child: Center(child:authProvider.loading ? CircularProgressIndicator() :Text("Login"),))
            ]),
        ),
    );
  }
}