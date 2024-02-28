import 'package:cloud_craft_solution/domain/notification_config.dart';
import 'package:cloud_craft_solution/ui/theme/text_styles.dart';
import 'package:cloud_craft_solution/ui/utils/colors.dart';
import 'package:cloud_craft_solution/ui/utils/common_widget.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  late Future<bool> notification;

  @override
  void initState() {
    notification = NotificationConfig.getNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: notification,
      builder: (context, snapshot) {
        return SizedBox(
          height: 40,
          child: Row(
            children: [
              Icon(
                snapshot.data ?? false
                    ? Icons.notifications
                    : Icons.notifications_off,
                size: 24,
                color: Colors.white,
              ),
              width_40,
              Text(
                'Notifiche',
                style: semibold_18.copyWith(
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Switch(
                value: snapshot.data ?? false,
                onChanged: (isLock) {
                  setState(() {
                    if (isLock == true) {
                      NotificationConfig.saveNotification();
                      notification = NotificationConfig.getNotification();
                    }
                    if (isLock == false) {
                      NotificationConfig.deleteNotification();
                      notification = NotificationConfig.getNotification();
                    }
                  });
                },
                activeTrackColor: primariBlue,
                inactiveTrackColor: Colors.grey[400],
              ),
              width_16,
            ],
          ),
        );
      },
    );
  }
}
