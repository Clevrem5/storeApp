import 'package:hive/hive.dart';
import 'package:store_app/data/repository/notification/notification_repository_interface.dart';

import '../../models/notification_model/notification_model.dart';

class NotificationRepositoryLocal implements INotificationRepository {
  final Box<NotificationModel> box = Hive.box<NotificationModel>("notifications");

  @override
  Future<List<NotificationModel>> fetchNotification() async {
    final notifications = box.values.toList();
    return notifications;
  }
}
