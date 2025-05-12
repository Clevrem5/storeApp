import 'package:hive/hive.dart';
import 'package:store_app/data/repository/notification/notification_repository_interface.dart';
import '../../client.dart';
import '../../models/notification_model/notification_model.dart';

class NotificationRepositoryRemote implements INotificationRepository {
  final ApiClient client;

  NotificationRepositoryRemote({required this.client});

  List<NotificationModel> notification = [];

  @override
  Future<List<NotificationModel>> fetchNotification() async {
    // Hive box ni ochish (AppLocal bilan integratsiya)
    final Box<NotificationModel> box =
    await Hive.box<NotificationModel>("notifications");

    // API dan xabarlarni olish
    var rawNotification = await client.fetchNotification();

    // JSON dan modelga o‘tkazish
    notification = rawNotification
        .map((e) => NotificationModel.fromJson(e))
        .toList();

    // Mahalliy bazani yangilash
    await box.clear();
    await box.addAll(notification);

    print("--------------------------------- ----- ${box.values}");

    return notification;
  }
}
