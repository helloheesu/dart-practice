import 'package:alarm/alarm.dart';

class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  Future<void> init() async {
    await Alarm.init();
  }

  Future<void> scheduleAfterMinutes({
    required int minutes,
    String? title,
    String? body,
  }) async {
    final dateTime = DateTime.now().add(Duration(minutes: minutes));
    final settings = AlarmSettings(
      id: 1,
      dateTime: dateTime,
      assetAudioPath: 'assets/alarm.mp3',
      loopAudio: true,
      vibrate: true,
      volume: 0.8,
      fadeDuration: 2.0,
      notificationTitle: title ?? '⏰ 예약 알림',
      notificationBody: body ?? '예약된 시간이 되었습니다.',
    );
    await Alarm.set(alarmSettings: settings);
  }

  Future<void> stop({int id = 1}) async {
    await Alarm.stop(id);
  }

  Future<void> stopAll() async {
    await Alarm.stopAll();
  }
}
