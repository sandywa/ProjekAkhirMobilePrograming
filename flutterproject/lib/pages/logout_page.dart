import 'package:flutter/material.dart';
import 'package:flutterproject/pages/login_page.dart';
import 'package:flutterproject/theme.dart';
import 'package:flutterproject/widget/bottom_navbar_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutPage extends StatefulWidget {
  final String username;
  final bool isLogin;
  const LogoutPage(
      {Key? key, required this.username, required this.isLogin})
      : super(key: key);

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  final Future<SharedPreferences> _myPref = SharedPreferences.getInstance();
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/mobile-vektor.png',
                width: 300,
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'Hallo ~${widget.username}~ ',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Apakah anda ingin keluar ?',
                style: thirdTextStyle.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  bool status = false;
                  _prosesLogout(status, widget.username);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return LoginPage(status: false);
                  }));
                },
                style: ButtonStyle(backgroundColor:
                MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed))
                        return mainColor;
                      return mainColor;
                    })),
                child: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/images/home.png',
              isActive: false,
              urlsCode: 3,
              username: widget.username,
              isLogin: widget.isLogin,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/heart.png',
              isActive: false,
              urlsCode: 2,
              username: widget.username,
              isLogin: widget.isLogin,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/world.png',
              isActive: false,
              urlsCode: 1,
              username: widget.username,
              isLogin: widget.isLogin,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/user.png',
              isActive: true,
              urlsCode: 4,
              username: widget.username,
              isLogin: widget.isLogin,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
  void _prosesLogout(bool status, String username) async {
    SharedPreferences getPref = await _myPref;
    await getPref.setBool("LoginStatus", status);
    await getPref.setString("Username", username);
  }
}
