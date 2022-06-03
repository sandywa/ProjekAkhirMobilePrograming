
import 'package:flutter/material.dart';
import 'package:flutterproject/models/katalog.dart';
import 'package:flutterproject/pages/news_list.dart';
import 'package:flutterproject/theme.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;
  final String newsName;
  final String username;
  final bool isLogin;

  TipsCard(this.tips, this.newsName, this.username, this.isLogin);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "${tips.imageUrl}",
            width: 80,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${tips.title}",
              style: blackTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              '${tips.keterangan}',
              style: mainTextStyle,
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            if(newsName!="null"){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsListPage(newsName: newsName, newsCategory: '${tips.catalog}', username: username, isLogin: isLogin,),
                ),
              );
            }
          },
          icon: Icon(
            Icons.chevron_right,
            color: greyColor,
          ),
        ),
      ],
    );
  }
}
