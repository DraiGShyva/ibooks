import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/my_app_button_rounded.dart';
import 'package:myapp/components/my_app_image.dart';
import 'package:myapp/components/my_app_notification.dart';
import 'package:myapp/components/my_app_text.dart';
import 'package:myapp/controller/account_controller.dart';
import 'package:myapp/models/comic_model.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/route.dart';

class MyAppItemComic extends StatelessWidget {
  const MyAppItemComic({
    super.key,
    required this.context,
    required this.comic,
    this.heightImage = 160,
    this.widthImage = 120,
    this.setState,
    required this.authenKey,
  });

  final BuildContext context;
  final Comic comic;
  final double heightImage;
  final double widthImage;
  final Function? setState;
  final String authenKey;

  @override
  Widget build(BuildContext context) {
    final accountController = Get.put(AccountController());

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
          Navigator.pushNamed(context, LIST_CHAPTER, arguments: {
            'id': comic.id,
          });
        },
        onLongPress: () {
          bool favourite =
              accountController.getFavouriteList().contains(comic.id)
                  ? true
                  : false;
          alertDialog(context, accountController, favourite);
        },
        child: content(),
      ),
    );
  }

  void alertDialog(BuildContext context, AccountController accountController,
      bool favourite) {
    MyAppNotification.showAlertDialog(
      context: context,
      title: 'Comic Information',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyAppText(
            '${comic.title}',
            style: MyAppTextStyles.mediumGrey,
            maxLines: 3,
          ),
          const SizedBox(height: 10),
          comic.author != null
              ? Column(children: [
                  MyAppText(
                    'Tác giả: ${comic.author}',
                    style: MyAppTextStyles.smallGrey,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 10),
                ])
              : const SizedBox(),
          comic.category != null
              ? Column(children: [
                  MyAppText(
                    'Thể loại: ${comic.category!.join(', ')}',
                    style: MyAppTextStyles.smallGrey,
                    maxLines: 10,
                  ),
                  const SizedBox(height: 10)
                ])
              : const SizedBox(),
          comic.description != null
              ? MyAppText(
                  'Mô tả: ${comic.description}',
                  maxLines: 20,
                  style: MyAppTextStyles.smallGrey,
                  textAlign: TextAlign.justify,
                )
              : const SizedBox(),
        ],
      ),
      listButton: [
        MyAppRoundedButton(
          onPressed: () {
            if (authenKey.isEmpty) {
              MyAppNotification.showToast(
                  content: 'You need to login to add your favorite comic.');
            } else if (accountController
                .getFavouriteList()
                .contains(comic.id)) {
              accountController.removeFavourite(comic.id);
              MyAppNotification.showToast(
                  content: 'Removed ${comic.title} from your favorite list.');
              favourite = true;
              setState != null ? setState!() : null;
              Navigator.pop(context);
            } else {
              accountController.addFavourite(comic.id);
              MyAppNotification.showToast(
                  content: 'Added ${comic.title} to your favorite list.');
              favourite = false;
              setState != null ? setState!() : null;
              Navigator.pop(context);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(favourite ? Icons.favorite : Icons.favorite_border,
                color: MyAppColors.blueAccent),
          ),
        ),
        const SizedBox(width: 20.0),
        MyAppRoundedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const MyAppText('Close', style: MyAppTextStyles.mediumBlue),
        ),
      ],
    );
  }

  Row content() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          child: MyAppImage(
            '${comic.img}',
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
                  '${comic.title}',
                  style: MyAppTextStyles.mediumBold,
                  maxLines: 1,
                  overflow: true,
                ),
                comic.author != null
                    ? MyAppText(
                        'Tác giả: ${comic.author}',
                        style: MyAppTextStyles.smallGrey,
                        maxLines: 1,
                        overflow: true,
                      )
                    : const SizedBox(),
                comic.description != null
                    ? Column(
                        children: [
                          MyAppText(
                            '${comic.description}',
                            style: MyAppTextStyles.smallGrey,
                            maxLines: 3,
                            overflow: true,
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 10),
                        ],
                      )
                    : const SizedBox(),
                comic.category != null
                    ? MyAppText(
                        'Thể loại: ${comic.category!.join(', ')}',
                        style: MyAppTextStyles.smallGrey,
                        maxLines: 1,
                        overflow: true,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
