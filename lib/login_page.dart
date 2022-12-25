import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: <Widget>[
                Text('Welcome to VShop!',
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.pink),
                ),
                Text('Please Login to see our products.',
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.pinkAccent),
                ),
              ]
              ),
              SizedBox(
                height: 24,
              ),
              _usernameField(),
              _passwordField(),
              _loginButton(context),
            ],
          ),
        )
    );
  }

  Widget _usernameField(){
    return Container(
        padding: EdgeInsets.symmetric(horizontal : 20, vertical : 10),
        child : TextFormField(
          onChanged: (value){
            username = value;
          },
          enabled: true,
          decoration: InputDecoration(
            hintText: "Username",
            label: Text("Username"),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        )
    );
  }
  Widget _passwordField(){
    return Container(
        padding: EdgeInsets.symmetric(horizontal : 20, vertical : 10),
        child : TextFormField(
          onChanged: (value){
            password = value;
          },
          obscureText: true,
          obscuringCharacter: "-",
          enabled: true,
          decoration: InputDecoration(
            hintText: "Password",
            label: Text("Password"),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
        )
    );
  }
  Widget _loginButton(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal : 20, vertical : 10),
      child: ElevatedButton(

        onPressed: (){
          String text = "";
          if(username == "via" && password == "123"){
            Navigator.of(context).pushNamed(MyHomePage.tag);
            text = "login sukses";
          }else {
            text = "login gagal";
          }
          SnackBar snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );
  }

}