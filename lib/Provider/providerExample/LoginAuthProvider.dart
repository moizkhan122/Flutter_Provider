import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class LoginAuthProvider with ChangeNotifier{

  bool _loading =  false;
  bool get loading => _loading;

  void Isloading(bool val){
    _loading = val;
    notifyListeners();
  }

  void Login(String email,String password)async{
    Isloading(true);
    try {
      Response responce = await post(Uri.parse('https://reqres.in/api/login'),
    body: {
      'email' : email,
      'password' : password
    }
    );
    if(responce.statusCode == 200){
      Isloading(false);
      print("Logined");
    }else{
      Isloading(false);
      print("error");
    }
    } catch (e) {
      Isloading(false);
     print(e); 
    }
  }
}