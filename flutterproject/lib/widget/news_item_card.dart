import 'package:flutter/material.dart';
import 'package:flutterproject/models/detail_news.dart';
import 'package:flutterproject/pages/news_list.dart';
import 'package:flutterproject/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItemCard extends StatelessWidget {
  final Posts postsItem;

  NewsItemCard(this.postsItem);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            "${postsItem.thumbnail}",
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
              "${postsItem.title!.length>23?postsItem.title!.substring(0,23)+'...':postsItem.title}",
              style: blackTextStyle.copyWith(
                fontSize: 12,
              ),
            ),

            SizedBox(
              height: 9,
            ),
            Text(
              '${postsItem.pubDate}',
              style: mainTextStyle,
            ),
          ],
        ),
        Spacer(),
        SizedBox(
          width: 50,
        ),
        IconButton(
          onPressed: _launchUrl,
          icon: Icon(
            Icons.chevron_right,
            color: greyColor,
          ),
        ),
      ],
    );
  }
  void _launchUrl() async {
    if (!await launchUrl(Uri.parse("${postsItem.link}"))) throw 'Could not launch ${postsItem.link}';
  }
}
