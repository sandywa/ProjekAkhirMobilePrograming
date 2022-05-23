import 'package:flutter/material.dart';

import 'listHeroes.dart';

class loginPage extends StatelessWidget {
  String username = "";
  String password = "";

  loginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Column(
          children: [
            _logoImage(),
            _username(),
            _password(),
            _loginButton(context),
            _guestButton(context),
          ],
        ),
      ),
    );
  }

  Widget _username() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: const InputDecoration(
            hintText: 'Username',
            contentPadding: const EdgeInsets.all(8),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }

  Widget _password() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          password = value;
        },
        obscureText: true,
        decoration: const InputDecoration(
            hintText: 'Password',
            contentPadding: const EdgeInsets.all(8),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          //tempat buat menjalankan logic dari button
          String text = "";
          if (username == "Flutter" && password == "123") {
            text = 'Login Berhasil';
          } else {
            text = 'login gagal';
          }
          SnackBar snackBar = SnackBar(
            content: Text(text),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login Button'),
      ),
    );
  }

  Widget _guestButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: ElevatedButton(
        onPressed: () {
          //tempat buat menjalankan logic dari button
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return listHeroes();
          }));

        },
        child: const Text('as Guest'),
      ),
    );
  }

  Widget _logoImage() {
    return Container();
  }
}
