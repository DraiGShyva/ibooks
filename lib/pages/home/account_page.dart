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
  Future<void> _pickImage() async {
    File imageFile;
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    imageFile = File(pickedFile!.path);
    String message = await Get.put(AccountController()).setAvatar(imageFile);
    MyAppNotification.showToast(content: message);
  }

  @override
  Widget build(BuildContext context) {
    AccountController account = Get.put(AccountController());
    String avatar = account.getAvatar();

    changePassword() {
      String authenkey = Get.put(AppController()).authenKey.value;
      TextEditingController passwordController = TextEditingController();
      TextEditingController newPasswordController = TextEditingController();
      TextEditingController confirmPasswordController = TextEditingController();
      GlobalKey<FormState> formKey = GlobalKey();

      MyAppNotification.showAlertDialog(
          context: context,
          title: 'Change password',
          content: Material(
            color: Colors.transparent,
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
              name: ' Cancel ',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            MyAppRoundedButton(
              name: 'Confirm',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  account.isAccountValid(
                    username: authenkey,
                    password: passwordController.text,
                    onComplete: (value) {
                      if (value) {
                        if (confirmPasswordController.value !=
                            newPasswordController.value) {
                          MyAppNotification.showToast(
                              content: 'Confirm password does not match!');
                        } else {
                          account.changePassword(
                              username: authenkey,
                              newPassword: newPasswordController.text,
                              onComplete: (message, isSuccessful) {
                                MyAppNotification.showToast(content: message);
                                if (isSuccessful) {
                                  Navigator.pop(context);
                                }
                              });
                        }
                      } else {
                        MyAppNotification.showToast(
                            content: 'Incorrect password!');
                      }
                    },
                  );
                }
              },
            )
          ]);
    }

    logout() {
      MyAppNotification.showAlertDialog(
        context: context,
        title: 'Confirm the log out',
        content: const Text('Are you sure you want to log out?'),
        listButton: [
          MyAppRoundedButton(
              name: 'Cancel',
              onPressed: () {
                Navigator.pop(context);
              }),
          MyAppRoundedButton(
              name: 'Confirm',
              onPressed: () {
                Get.put(AppController()).deleteAuthenKey();
                Navigator.pushNamedAndRemoveUntil(
                    context, LOGIN, (route) => false);
              })
        ],
      );
    }

    final List<Map<String, dynamic>> listButton = [
      {
        'name': 'Settings',
        'onTap': () {},
      },
      {
        'name': 'Change password',
        'onTap': () => changePassword(),
      },
      {
        'name': 'Log out',
        'onTap': () => logout(),
      },
    ];

    return Column(
      children: [
        const SizedBox(height: 50.0),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 5.0),
              ),
              child: GestureDetector(
                onTap: () {
                  _pickImage();
                  avatar = account.getAvatar();
                },
                child: avatar != ''
                    ? MyAppImage.file(avatar, width: 120.0, height: 120.0)
                    : const MyAppImage(AVATAR, width: 120.0, height: 120.0),
              ),
            ),
            const Positioned(
                right: 0.0,
                top: 0.0,
                child: CircleAvatar(
                    child: Icon(
                  Icons.add_photo_alternate,
                  color: Colors.blueGrey,
                ))),
          ],
        ),
        const SizedBox(height: 20.0),
        const Divider(height: 0),
        ...List.generate(
          listButton.length,
          (index) => Column(
            children: [
              InkWell(
                onTap: listButton[index]['onTap'],
                child: SizedBox(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: MyAppText(
                        text: listButton[index]['name'],
                        style: MyAppTextStyles.mediumGrey),
                  ),
                ),
              ),
              const Divider(height: 0),
            ],
          ),
        ),
      ],
    );
  }
}
