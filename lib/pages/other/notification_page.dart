import 'package:flutter/material.dart';
import 'package:ibooks/components/my_app_notification.dart';
import 'package:ibooks/components/my_app_text.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isSelectAll = false;
  List<String> selectedNotifications = [];

  void handleLongPress(String notification) {
    setState(() {
      isSelectAll = true;
      selectedNotifications = MyAppNotification.notifications;
    });
  }

  void handleSelect(String notification) {
    setState(() {
      if (selectedNotifications.contains(notification)) {
        selectedNotifications.remove(notification);
      } else {
        selectedNotifications.add(notification);
      }
      if (selectedNotifications.length ==
          MyAppNotification.notifications.length) {
        isSelectAll = true;
      } else {
        isSelectAll = false;
      }
    });
  }

  void handleSelectAll() {
    setState(() {
      isSelectAll = !isSelectAll;
      if (isSelectAll) {
        selectedNotifications = MyAppNotification.notifications;
      } else {
        selectedNotifications = [];
      }
    });
  }

  void handleDelete() {
    setState(() {
      MyAppNotification.notifications.removeWhere(
          (notification) => selectedNotifications.contains(notification));
      selectedNotifications = [];
      isSelectAll = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const MyAppText('Danh sách thông báo'),
        actions: [
          IconButton(
            onPressed: handleSelectAll,
            icon:
                Icon(isSelectAll ? Icons.check_box : Icons.check_box_outlined),
          ),
          IconButton(
            onPressed: handleDelete,
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: MyAppNotification.notifications.length,
        itemBuilder: (context, index) {
          final notification = MyAppNotification.notifications[index];
          return GestureDetector(
            onLongPress: () => handleLongPress(notification),
            child: CheckboxListTile(
              title: MyAppText(notification,
                  style: MyAppTextStyles.smallBlue, maxLines: 5),
              value: selectedNotifications.contains(notification),
              onChanged: (value) => handleSelect(notification),
            ),
          );
        },
      ),
    );
  }
}
