import 'package:flutter/material.dart';
import 'package:flutterproject/models/account.dart';
import 'package:flutterproject/theme.dart';
import 'package:flutterproject/widget/submit_button.dart';
import 'package:hive/hive.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Box<UserAccountModel> localDB = Hive.box<UserAccountModel>("user");

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String username = "";
  String password = "";

  void _submit() {
    // validate all the form fields
    if (_formKey.currentState!.validate()) {
      Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => LoginPage(status: false,)),
            (_) => false,
      );
      localDB.add(UserAccountModel(username: _usernameController.text, password: _passwordController.text));
      _usernameController.clear();
      _passwordController.clear();
      setState(() {

      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Text(
                'Buat Akun Baru \n',
                style: mainTextStyle.copyWith(
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'assets/gif/login.gif',
                width: 100,
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: _buildFieldUsername()),
              _buildFieldPassword(),
              _buildButtonRegister(),

            ],
          ),
        ),

      ),
    );
  }

  Widget _buildFieldUsername(){
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
          decoration:  const InputDecoration(
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

  Widget _buildFieldPassword(){
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
          decoration:  const InputDecoration(
            hintText: "Password",
          ),
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Password Can\'t be empty';
            }
            if (text.length<8) {
              return 'Your Password is Weak (<8)';
            }
            else {
              return null;
            }
          },
          onChanged: (text) => setState(() => password = text),
        ),
      ),
    );
  }

  Widget _buildButtonRegister(){
    return Padding(
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
          'Register',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}