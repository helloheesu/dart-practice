import 'package:flutter/material.dart';
import 'package:alarm/alarm.dart';
import 'app/app.dart';
import 'core/constants/strings.dart';
import 'core/notifications/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.instance.init();
  runApp(const App());

  // Show a stop dialog when alarm rings
  Alarm.ringStream.stream.listen((alarm) async {
    final ctx = navigatorKey.currentContext;
    if (ctx == null) return;
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text(AppStrings.alarmRinging),
        content: Text(alarm.notificationBody),
        actions: [
          TextButton(
            onPressed: () async {
              await NotificationService.instance.stop(id: alarm.id);
              if (navigatorKey.currentState?.canPop() ?? false) {
                navigatorKey.currentState?.pop();
              }
            },
            child: const Text(AppStrings.alarmStop),
          ),
        ],
      ),
    );
  });
}
