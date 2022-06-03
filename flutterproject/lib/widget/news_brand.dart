import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/models/news.dart';
import 'package:flutterproject/pages/category_news_list.dart';
import 'package:flutterproject/services/data_source.dart';
import 'package:flutterproject/widget/card_widget.dart';

class NewsWidget extends StatefulWidget {
  final String username;
  final bool isLogin;
  const NewsWidget({Key? key, required this.username, required this.isLogin}) : super(key: key);

  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildBodyNews();
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
      scrollDirection: Axis.horizontal,
      itemCount: data.endpoints?.length,
      itemBuilder: (BuildContext context, int index) {
        //debugPrint("${data.endpoints?[index].runtimeType}");
        return Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryNewsList(newsName: '${data.endpoints![index].name}', indexEndpoint: index, username: widget.username, isLogin: widget.isLogin,),
                  ),
                );
              },
              child: CardWidget(data.endpoints![index], "${index==10?'nasional':'terbaru'}"),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        );
        // return Container(
        //   child: CardWidget(data.endpoints![index]),
        // );
      },
    );
  }
}
