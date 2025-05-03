import 'package:store_app/data/models/notification_model/notification_model.dart';

abstract interface class INotificationRepository{
  Future<List<NotificationModel>> fetchNotification();
}