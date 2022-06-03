import 'package:flutter/material.dart';
import 'package:flutterproject/models/detail_news.dart';
import 'package:flutterproject/models/news.dart';
import 'package:flutterproject/services/data_source.dart';
import 'package:flutterproject/theme.dart';

class CardWidget extends StatelessWidget {
  final Endpoints newsInfo;
  final String tempo;
  CardWidget(this.newsInfo, this.tempo);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                _widgetGetImage(),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                      ),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo-black.png',
                        width: 22,
                        height: 22,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text("${newsInfo.name}",
                style: TextStyle(
                    color: thirdColor,
                    fontFamily: "LatoRegular",
                    fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _widgetGetImage() {
    String pathImage;
    return Container(
      child: FutureBuilder(
        future: NewsDataSource.instance.loadUrls(newsInfo.name, tempo),
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          if (snapshot.hasError) {
            debugPrint("Error Path : ${newsInfo.paths}");
            return Text("Error");
          }
          if (snapshot.hasData) {
            DetailNews newsDetailModel = DetailNews.fromJson(snapshot.data);
            if(newsDetailModel.data?.image != null){
              pathImage = "${newsDetailModel.data?.image}";
            }else{
                pathImage = "assets/images/mobilephone.png";
            };

            debugPrint("COBACEK "+pathImage);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.network(
                  "${pathImage}",
                  width: 120,
                  height: 102,
                  fit: BoxFit.fitWidth,
                ),
              ),
            );

          }else{
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.asset(
                  "assets/images/mobilephone.png",
                  width: 120,
                  height: 102,
                  fit: BoxFit.fitWidth,
                ),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
