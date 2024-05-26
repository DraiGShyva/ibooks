import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/my_app_button_rounded.dart';
import 'package:myapp/components/my_app_image.dart';
import 'package:myapp/components/my_app_notification.dart';
import 'package:myapp/components/my_app_text.dart';
import 'package:myapp/components/my_app_text_field.dart';
import 'package:myapp/controller/account_controller.dart';
import 'package:myapp/controller/app_controller.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/local_image.dart';
import 'package:myapp/utils/route.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/utils/validator.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    Get.put(AppController()).isDarkMode.listen((isDarkMode) {
      if (mounted) setState(() {});
    });

    final List<Map<String, dynamic>> listButton = [
      {
        'name': 'Change password',
        'onTap': () => _changePassword(context),
      },
      {
        'name': 'Log out',
        'onTap': () => _logout(context),
      },
      {
        'name': 'About',
        'onTap': () => _about(context),
      },
    ];

    Future<void> pickImage() async {
      File imageFile;
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      imageFile = File(pickedFile!.path);
      String message = await Get.put(AccountController()).setAvatar(imageFile);
      MyAppNotification.showToast(content: message);
      setState(() {});
    }

    return Column(
      children: [
        const SizedBox(height: 100.0),
        _avatar(pickImage),
        const SizedBox(height: 50.0),
        _buttonList(
          context,
          listButton: listButton,
        ),
      ],
    );
  }
}

Widget _avatar(pickImage) {
  AccountController accountController = Get.put(AccountController());
  String avatar = accountController.getAvatar();
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: MyAppColors.blueAccent, width: 5.0),
        ),
        child: ClipOval(
          child: GestureDetector(
            onTap: () {
              pickImage();
              avatar = accountController.getAvatar();
            },
            child: avatar != ''
                ? MyAppImage.file(avatar, width: 120.0, height: 120.0)
                : const MyAppImage(AVATAR, width: 120.0, height: 120.0),
          ),
        ),
      ),
      const Positioned(
        right: 0.0,
        top: 0.0,
        child: CircleAvatar(child: Icon(Icons.add_photo_alternate)),
      ),
    ],
  );
}

Widget _buttonList(BuildContext context, {required List listButton}) {
  AppController appController = Get.put(AppController());
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Ink(
      decoration: BoxDecoration(
        color: Get.put(AppController()).isDarkMode.value
            ? MyAppColors.blueGrey
            : MyAppColors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const [
          BoxShadow(color: MyAppColors.black, blurRadius: 10.0),
        ],
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 10.0),
              const MyAppText('Dark mode'),
              const SizedBox(width: 10.0),
              Obx(() => Switch(
                    value: appController.isDarkMode.value,
                    onChanged: (value) {
                      appController.isDarkMode(value);
                      appController.saveDarkMode();
                    },
                  )),
            ],
          ),
        ),
        const Divider(height: 0),
        ...List.generate(
          listButton.length,
          (index) {
            Widget inkWell = InkWell(
              borderRadius: index == listButton.length - 1
                  ? const BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))
                  : null,
              onTap: listButton[index]['onTap'],
              child: SizedBox(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: MyAppText(listButton[index]['name']),
                ),
              ),
            );

            if (index == listButton.length - 1) return inkWell;

            return Column(
              children: [
                inkWell,
                const Divider(height: 0),
              ],
            );
          },
        ),
      ]),
    ),
  );
}

_changePassword(BuildContext context) {
  AccountController accountController = Get.put(AccountController());
  AppController appController = Get.put(AppController());
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  MyAppNotification.showAlertDialog(
      context: context,
      title: 'Change password',
      content: Material(
        color: MyAppColors.transparent,
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              MyAppTextField(
                labelText: 'Password*',
                hintText: 'Enter your password.',
                textEC: passwordController,
                isPassword: true,
                validator: Validator.passwordValidator.call,
              ),
              const SizedBox(height: 10),
              MyAppTextField(
                labelText: 'New password*',
                hintText: 'Enter your new password.',
                textEC: newPasswordController,
                isPassword: true,
                validator: Validator.passwordValidator.call,
              ),
              const SizedBox(height: 10),
              MyAppTextField(
                labelText: 'Confirm Password*',
                hintText: 'Enter your password again.',
                textEC: confirmPasswordController,
                isPassword: true,
                validator: Validator.passwordValidator.call,
              ),
            ],
          ),
        ),
      ),
      listButton: [
        MyAppRoundedButton(
          child: const MyAppText(' Cancel ', style: MyAppTextStyles.mediumBlue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        MyAppRoundedButton(
          child: const MyAppText('Confirm', style: MyAppTextStyles.mediumBlue),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              accountController.isAccountValid(
                username: appController.authenKey.value,
                password: passwordController.text,
                onComplete: (value) {
                  if (value) {
                    if (confirmPasswordController.value !=
                        newPasswordController.value) {
                      MyAppNotification.showToast(
                          content: 'Confirm password does not match!');
                    } else {
                      accountController.changePassword(
                          username: appController.authenKey.value,
                          newPassword: newPasswordController.text,
                          onComplete: (message, isSuccessful) {
                            MyAppNotification.showToast(content: message);
                            if (isSuccessful) {
                              Navigator.pop(context);
                            }
                          });
                    }
                  } else {
                    MyAppNotification.showToast(content: 'Incorrect password!');
                  }
                },
              );
            }
          },
        )
      ]);
}

_logout(context) {
  MyAppNotification.showAlertDialog(
    context: context,
    title: 'Confirm the log out',
    content: const Text('Are you sure you want to log out?'),
    listButton: [
      MyAppRoundedButton(
          child: const MyAppText(' Cancel ', style: MyAppTextStyles.mediumBlue),
          onPressed: () {
            Navigator.pop(context);
          }),
      MyAppRoundedButton(
          child: const MyAppText('Confirm', style: MyAppTextStyles.mediumBlue),
          onPressed: () {
            Get.put(AppController()).deleteAuthenKey();
            Navigator.pushNamedAndRemoveUntil(context, LOGIN, (route) => false);
          })
    ],
  );
}

_about(context) {
  showAboutDialog(
    context: context,
    applicationName: '𝕀𝔹𝕆𝕆𝕂𝕊',
    applicationVersion: '𝕍𝕖𝕣𝕤𝕚𝕠𝕟 𝟙.𝟘.𝟘',
    applicationIcon: const ClipOval(child: MyAppImage(LOGO)),
    applicationLegalese:
        '©𝟚𝟘𝟚𝟜 𝔻𝕣𝕒𝕚𝔾𝕊𝕙𝕪𝕧𝕒\n\nA̶l̶l̶ ̶r̶i̶g̶h̶t̶s̶ ̶r̶e̶s̶e̶r̶v̶e̶d̶.̶',
  );
}
