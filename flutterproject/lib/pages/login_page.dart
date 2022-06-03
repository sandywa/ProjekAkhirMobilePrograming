import 'package:flutter/material.dart';
import 'package:flutterproject/models/account.dart';
import 'package:flutterproject/pages/home_page.dart';
import 'package:flutterproject/pages/register_page.dart';
import 'package:flutterproject/pages/splash_page.dart';
import 'package:flutterproject/theme.dart';
import 'package:flutterproject/widget/submit_button.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  final bool status;
  const LoginPage({Key? key, required this.status}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late Box<UserAccountModel> localDB = Hive.box<UserAccountModel>("user");
  final Future<SharedPreferences> _myPref = SharedPreferences.getInstance();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String username = "";
  String password = "";

  late bool isLogin = widget.status;

  void _submit() {
    // validate all the form fields
    if (_formKey.currentState!.validate()) {
      String currentUsername = _usernameController.value.text;
      String currentPassword = _passwordController.value.text;

      _prosesLogin(currentUsername, currentPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(top: 100),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/images/mobilechat.png'),
              ),
              Column(
                children: [
                  Text(
                    'Selamat Datang \n',
                    style: mainTextStyle.copyWith(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: EdgeInsets.only(top:10,bottom: 20),
                      child: _buildFieldUsername()),
                  _buildFieldPassword(),
                  _buildButtonLogin(),
                  _buildButtonRegister(),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
            context,
            MaterialPageRoute(
              builder: (context) => SplashPage(username: "", isLogin: false),
            ),
          );
        },
        backgroundColor: thirdColor,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _buildFieldUsername() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(15, 0, 0, 0),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset.fromDirection(0, 0))
            ]),
        child: TextFormField(
          textAlign: TextAlign.center,

          controller: _usernameController,
          decoration: const InputDecoration(

            hintText: "Username",
          ),
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Username Can\'t be empty';
            } else {
              return null;
            }
          },
          onChanged: (text) => setState(() => username = text),
        ),
      ),
    );
  }

  Widget _buildFieldPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(15, 0, 0, 0),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset.fromDirection(0, 0))
            ]),
        child: TextFormField(
          textAlign: TextAlign.center,
          obscureText: true,
          controller: _passwordController,
          decoration: const InputDecoration(
            hintText: "Password",
          ),
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Password Can\'t be empty';
            } else {
              return null;
            }
          },
          onChanged: (text) => setState(() => password = text),
        ),
      ),
    );
  }

  Widget _buildButtonLogin() {
    return  Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
           primary: mainColor,
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () {
          _submit();
        },
        child: Text(
          'Log in',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildButtonRegister() {
    return  Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: mainColor,
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => RegisterPage()));
        },
        child: Text(
          'Register',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void _prosesLogin(String username, String password) async {
    for (int index = 0; index < localDB.length; index++){
      if (username == localDB.getAt(index)!.username && password == localDB.getAt(index)!.password) {
        isLogin = true;
        SharedPreferences getPref = await _myPref;
        await getPref.setBool("LoginStatus", isLogin);
        await getPref.setString("Username", username);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
          return HomePage(username: username, isLogin: isLogin,);
        }),
                (_)=> false);
        // SharedPreferences getPref = await _myPref;
        // await getPref.setBool("LoginStatus", true);

      }
    }
  }

}