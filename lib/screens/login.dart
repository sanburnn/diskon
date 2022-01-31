import 'package:diskon/provider/provider.dart';
import 'package:diskon/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final con = PostDataProvider();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  
  void loginApp() async{
    String email = emailController.text;
    String pass = passController.text;
    SharedPreferences shared = await SharedPreferences.getInstance();
    if (emailController.text != '' || passController.text != '') {
      con.loginApp(context, email, pass);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: InputDecoration(hintText: 'username'),
                        controller: emailController,
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: 'Password'),
                        controller: passController,
                      ),
                      ElevatedButton(onPressed: (){}, child: Text('LOGIN'))
                    ],
                  ),
                ),
              )
          ],
          ),
          )
          )
      
    );
  }
}