import 'package:flutter/material.dart';
import 'package:flutterproject/pages/home_page.dart';
import 'package:flutterproject/pages/login_page.dart';
import 'package:flutterproject/theme.dart';

class SplashPage extends StatelessWidget {
  final String username;
  final bool isLogin;
  const SplashPage({Key? key, required this.username, required this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/mobile-vektor.png'),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 50,
                left: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo-color.png')),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Halaman awal \nMenantu Idaman',
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 24,
                        fontFamily: 'LatoBlack'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Project Flutter Menantu Idaman',
                      style: TextStyle(
                          color: thirdColor,
                          fontSize: 16,
                          fontFamily: 'LatoBold')),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 210,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => isLogin == true
                                    ? HomePage(username: username, isLogin: isLogin)
                                    : LoginPage(status: false)

                            ));
                      },
                      style: ButtonStyle(backgroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return mainColor;
                        return mainColor;
                      })),
                      child: Text(
                        'Explore Now',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
