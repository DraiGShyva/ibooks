import 'package:flutter/material.dart';
import 'package:myapp/components/my_app_image.dart';
import 'package:myapp/components/my_app_notification.dart';
import 'package:myapp/components/my_app_text.dart';
import 'package:myapp/data/account_data.dart';
import 'package:myapp/models/comic_model.dart';
import 'package:myapp/my_app.dart';

class MyAppItemComic extends StatelessWidget {
  const MyAppItemComic({
    super.key,
    required this.context,
    required this.comic,
    this.heightImage = 160,
    this.widthImage = 120,
    this.setState,
  });

  final BuildContext context;
  final ComicModel comic;
  final double heightImage;
  final double widthImage;
  final Function? setState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(0),
        ),
        onPressed: () {
          Navigator.pushNamed(context, MyApp.LIST_CHAPTER, arguments: {
            'id': comic.id,
          });
        },
        onLongPress: () {
          MyAppNotification.showAlertDialog(
            context: context,
            title: 'Thông tin truyện',
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyAppText(
                  text: '${comic.title}',
                  style: MyAppTextStyles.mediumBold,
                  maxLines: 3,
                ),
                const SizedBox(height: 10),
                MyAppText(
                  text: 'Tác giả: ${comic.author}',
                  style: MyAppTextStyles.small,
                  maxLines: 3,
                ),
                const SizedBox(height: 10),
                MyAppText(
                  text: 'Thể loại: ${comic.category}',
                  style: MyAppTextStyles.small,
                  maxLines: 10,
                ),
                const SizedBox(height: 10),
                MyAppText(
                  text: 'Mô tả: ${comic.description}',
                  maxLines: 20,
                  style: MyAppTextStyles.small,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            listButton: [
              TextButton(
                onPressed: () {
                  if (MyApp.username == null) {
                    MyAppNotification.showSnackBar(
                      content: 'You need to login to add your favorite comic.',
                      context: context,
                    );
                  } else if (AccountData.getFavouriteList(MyApp.username!)
                      .contains(comic.id)) {
                    AccountData.removeFavourite(MyApp.username!, comic.id);
                    MyAppNotification.showSnackBar(
                      content: 'Removed from your favorite list.',
                      context: context,
                    );
                    setState != null ? setState!() : null;
                  } else {
                    AccountData.addFavourite(MyApp.username!, comic.id);
                    MyAppNotification.showSnackBar(
                      content: 'Added to your favorite list.',
                      context: context,
                    );
                    setState != null ? setState!() : null;
                  }
                },
                child: const Text('Thêm vào yêu thích'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Đóng'),
              ),
            ],
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: MyAppImage(
                imageUrl: '${comic.image}',
                height: heightImage,
                width: widthImage,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyAppText(
                      text: '${comic.title}',
                      style: MyAppTextStyles.mediumBold,
                      maxLines: 1,
                      overflow: true,
                    ),
                    MyAppText(
                      text: 'Tác giả: ${comic.author}',
                      style: MyAppTextStyles.smallGrey,
                      maxLines: 1,
                      overflow: true,
                    ),
                    MyAppText(
                      text: '${comic.description}',
                      style: MyAppTextStyles.small,
                      maxLines: 3,
                      overflow: true,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 10),
                    MyAppText(
                      text: 'Thể loại: ${comic.category}',
                      style: MyAppTextStyles.smallGrey,
                      maxLines: 1,
                      overflow: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
