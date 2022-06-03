
import 'package:flutter/material.dart';
import 'package:flutterproject/pages/logout_page.dart';
import 'package:flutterproject/pages/home_page.dart';
import 'package:flutterproject/pages/news_list.dart';
import 'package:flutterproject/pages/splash_page.dart';
import 'package:flutterproject/theme.dart';


class BottomNavbarItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final int urlsCode;
  final String username;
  final bool isLogin;

  BottomNavbarItem({required this.imageUrl, required this.isActive, required this.urlsCode, required this.username, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        IconButton(onPressed: (){
          if(urlsCode==3){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SplashPage(username: username, isLogin: isLogin),
              ),
            );
          }else if(urlsCode==2){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsListPage(newsName: 'null', newsCategory: 'null', username: username, isLogin: isLogin,),
              ),
            );
          }else if(urlsCode==1){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(username: username, isLogin: isLogin),
              ),
            );
          }else if(urlsCode==4){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LogoutPage(username: username, isLogin: isLogin,),
              ),
            );
          }

        },
            icon: Image.asset(
              imageUrl,
              width: 26,
            ))
        ,
        Spacer(),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(1000),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}