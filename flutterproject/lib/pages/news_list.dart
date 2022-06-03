import 'package:flutter/material.dart';
import 'package:flutterproject/models/detail_news.dart';
import 'package:flutterproject/services/data_source.dart';
import 'package:flutterproject/theme.dart';
import 'package:flutterproject/widget/bottom_navbar_item.dart';
import 'package:flutterproject/widget/news_item_card.dart';

class NewsListPage extends StatefulWidget {
  final String newsName;
  final String newsCategory;
  final String username;
  final bool isLogin;


  const NewsListPage(
      {Key? key, required this.newsName, required this.newsCategory, required this.username, required this.isLogin})
      : super(key: key);


  @override

  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {


  bool _hasBeenPressed = false;
  @override


  Widget build(BuildContext context) {

    if(widget.newsName == 'null'){
      return  Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 200
              ),
              child: Column(
                children: [
                  Text(
                    "Selamat Datang",
                    style: blackTextStyle.copyWith(fontSize: 28),
                  ),
                  Text(
                    'Anda belum memilih Brand Berita',
                    style: TextStyle(
                        color: mainColor,
                        fontFamily: "LatoRegular",
                        fontSize: 18),
                  ),
                ],
              ),
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
                isActive: true,
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
                isActive: false,
                urlsCode: 4,
                username: widget.username,
                isLogin: widget.isLogin,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    }else{

      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: edge),
            child: ListView(
              children: [
                Padding(
                    padding: EdgeInsets.only(left: edge),
                    child: Text(
                      "Daftar ${widget.newsName}",
                      style: blackTextStyle.copyWith(fontSize: 28),
                    )),

                SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(left: edge),
                  child: Text(
                    'Category ${widget.newsCategory}',
                    style: TextStyle(
                        color: mainColor,
                        fontFamily: "LatoRegular",
                        fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: _buildDetailCountriesBody(2),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: edge),
                      child: Text(
                        'News List',
                        style: blackTextStyle.copyWith(fontSize: 20),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite),
                            color: _hasBeenPressed ? Colors.red : Colors.grey,
                            onPressed: () => {
                              setState(() {
                                _hasBeenPressed = !_hasBeenPressed;
                                if(_hasBeenPressed){

                                }else{

                                };
                              })
                            },
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  child: Expanded(
                    child: SizedBox(
                      height: 420,
                      child: _buildDetailCountriesBody(1),
                    ),
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
                username: widget.username,
                isLogin: widget.isLogin,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/heart.png',
                isActive: true,
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
                isActive: false,
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

  }

  Widget _buildDetailCountriesBody(int code) {
    return Container(
      child: FutureBuilder(
        future: NewsDataSource.instance
            .loadUrls(widget.newsName, widget.newsCategory),
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            DetailNews detailNews = DetailNews.fromJson(snapshot.data);
            if (code == 1) {
              return _buildSuccessSection(detailNews);
            } else {
              return _buildSuccessImage(detailNews);
            }
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

  Widget _buildSuccessSection(DetailNews data) {
    return ListView.builder(
      itemCount: data.data!.posts?.length,
      itemBuilder: (BuildContext context, int index) {
        debugPrint("${data.data!.posts?[index].runtimeType}");
        Posts posts = data.data!.posts![index];
        return NewsItemCard(posts);
      },
    );
  }

  Widget _buildSuccessImage(DetailNews data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Image.network(
          "${data.data!.image}",
          width: 500,
          height: 500,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
