import 'package:flutter/material.dart';
import 'package:flutterproject/models/katalog.dart';
import 'package:flutterproject/theme.dart';
import 'package:flutterproject/widget/bottom_navbar_item.dart';
import 'package:flutterproject/widget/news_brand.dart';
import 'package:flutterproject/widget/tips_card.dart';

class HomePage extends StatelessWidget {
  final String username;
  final bool isLogin;

  const HomePage({Key? key, required this.username, required this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var spaceProvider = Provider.of<SpaceProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: edge),
          child: ListView(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: edge),
                  child: Text(
                    'Explore Now',
                    style: blackTextStyle.copyWith(
                        fontSize: 28),
                  )),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Search',
                  style: TextStyle(
                      color: mainColor,
                      fontFamily: "LatoRegular",
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'News Brand',
                  style: blackTextStyle.copyWith(
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: SizedBox(
                  height: 150,
                  child: NewsWidget(username: username, isLogin: isLogin,),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Menantu News',
                  style: blackTextStyle.copyWith(
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: edge,
                  right: edge,
                  bottom: 70,

                ),
                child: Column(
                  children: [
                    TipsCard(
                      Tips(
                        id: 99,
                        title: 'Updated News',
                        imageUrl: 'assets/images/newspaper.png',
                        keterangan: 'Update Berita Terbaru',
                        catalog: 'terbaru',
                      ),
                      "null",
                      username,
                      isLogin,
                    ),
                    TipsCard(
                      Tips(
                        id: 99,
                        title: 'API Service ',
                        imageUrl: 'assets/images/booking.png',
                        keterangan: 'Aplikasi menggunakan API',
                        catalog: 'otomotif',
                      ),
                      "null",
                      username,
                      isLogin,
                    ),
                  ],
                ),
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
              username: username,
              isLogin: isLogin,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/heart.png',
              isActive: false,
              urlsCode: 2,
              username: username,
              isLogin: isLogin,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/world.png',
              isActive: true,
              urlsCode: 1,
              username: username,
              isLogin: isLogin,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/user.png',
              isActive: false,
              urlsCode: 4,
              username: username,
              isLogin: isLogin,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}
