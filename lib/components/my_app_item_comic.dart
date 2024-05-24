import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/my_app_image.dart';
import 'package:myapp/components/my_app_notification.dart';
import 'package:myapp/components/my_app_text.dart';
import 'package:myapp/controller/account_controller.dart';
import 'package:myapp/controller/app_controller.dart';
import 'package:myapp/models/comic_model.dart';
import 'package:myapp/utils/route.dart';

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
  final Comic comic;
  final double heightImage;
  final double widthImage;
  final Function? setState;

  @override
  Widget build(BuildContext context) {
    final accountController = Get.put(AccountController());
    final appController = Get.put(AppController());

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
          String data = accountController.getFavouriteList().contains(comic.id)
              ? 'Remove from favorite'
              : 'Add to favorite';
          alertDialog(context, appController, accountController, data);
        },
        child: content(),
      ),
    );
  }

  void alertDialog(BuildContext context, AppController appController,
      AccountController accountController, String data) {
    MyAppNotification.showAlertDialog(
      context: context,
      title: 'Comic Information',
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyAppText(
            text: '${comic.title}',
            style: MyAppTextStyles.mediumGrey,
            maxLines: 3,
          ),
          const SizedBox(height: 10),
          comic.author != null
              ? Column(children: [
                  MyAppText(
                    text: 'Tác giả: ${comic.author}',
                    style: MyAppTextStyles.smallGrey,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 10),
                ])
              : const SizedBox(),
          comic.category != null
              ? Column(children: [
                  MyAppText(
                    text: 'Thể loại: ${comic.category!.join(', ')}',
                    style: MyAppTextStyles.smallGrey,
                    maxLines: 10,
                  ),
                  const SizedBox(height: 10)
                ])
              : const SizedBox(),
          comic.description != null
              ? MyAppText(
                  text: 'Mô tả: ${comic.description}',
                  maxLines: 20,
                  style: MyAppTextStyles.smallGrey,
                  textAlign: TextAlign.justify,
                )
              : const SizedBox(),
        ],
      ),
      listButton: [
        TextButton(
          onPressed: () {
            if (appController.authenKey.value.isEmpty) {
              MyAppNotification.showToast(
                  content: 'You need to login to add your favorite comic.');
            } else if (accountController
                .getFavouriteList()
                .contains(comic.id)) {
              accountController.removeFavourite(comic.id);
              MyAppNotification.showToast(
                  content: 'Removed from your favorite list.');
              data = 'Remove from favorite';
              setState != null ? setState!() : null;
              Navigator.pop(context);
            } else {
              accountController.addFavourite(comic.id);
              MyAppNotification.showToast(
                  content: 'Added to your favorite list.');
              data = 'Add to favorrite';
              setState != null ? setState!() : null;
              Navigator.pop(context);
            }
          },
          child: Text(data),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Close'),
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
                  text: '${comic.title}',
                  style: MyAppTextStyles.mediumBold,
                  maxLines: 1,
                  overflow: true,
                ),
                comic.author != null
                    ? MyAppText(
                        text: 'Tác giả: ${comic.author}',
                        style: MyAppTextStyles.smallGrey,
                        maxLines: 1,
                        overflow: true,
                      )
                    : const SizedBox(),
                comic.description != null
                    ? Column(
                        children: [
                          MyAppText(
                            text: '${comic.description}',
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
                        text: 'Thể loại: ${comic.category!.join(', ')}',
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
