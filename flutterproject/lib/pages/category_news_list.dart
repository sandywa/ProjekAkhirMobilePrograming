import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/models/katalog.dart';
import 'package:flutterproject/models/news.dart';
import 'package:flutterproject/services/data_source.dart';
import 'package:flutterproject/theme.dart';
import 'package:flutterproject/widget/bottom_navbar_item.dart';
import 'package:flutterproject/widget/tips_card.dart';

class CategoryNewsList extends StatelessWidget {
  final String newsName;
  final int indexEndpoint;
  final String username;
  final bool isLogin;

  const CategoryNewsList(
      {Key? key, required this.newsName, required this.indexEndpoint, required this.username, required this.isLogin})
      : super(key: key);

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
                    'Explore ${newsName}',
                    style: blackTextStyle.copyWith(fontSize: 28),
                  )),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Search ',
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
                  'Category List',
                  style: TextStyle(
                      color: thirdColor, fontSize: 18, fontFamily: 'LatoBold'),
                ),
              ),
              SizedBox(
                height: 16,
              ),

              SizedBox(
                height: 16,
              ),
              Expanded(
                child: SizedBox(
                  height: 540,
                  child: _buildBodyNews(),
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

  Widget _buildBodyNews() {
    return Container(
      child: FutureBuilder(
        future: NewsDataSource.instance.loadNews(),
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            NewsModel newsModel = NewsModel.fromJson(snapshot.data);
            return _buildSuccessSection(newsModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildEmptySection() {
    return Text("Empty");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(NewsModel data) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: data.endpoints![indexEndpoint].paths?.length,
      itemBuilder: (BuildContext context, int index) {
        //debugPrint("${data.endpoints?[index].runtimeType}");
        return TipsCard(
          Tips(
            id: 1,
            title: '${data.endpoints![indexEndpoint].paths![index].name}',
            imageUrl: 'assets/gif/icon${index + 1}.gif',
            keterangan: 'Berita Terbaru',
            catalog: '${data.endpoints![indexEndpoint].paths![index].name}',
          ),
          newsName,
          username,
          isLogin,
        );
        // SizedBox(
        // height: 20,
        // )
        // return Container(
        //   child: CardWidget(data.endpoints![index]),
        // );
      },
    );
  }
}
