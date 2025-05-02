import 'package:store_app/Data/client.dart';
import 'package:store_app/data/models/notifiaction_model/notification_model.dart';

class NotificationRepository{
  final ApiClient client;
  NotificationRepository({required this.client});

  List<NotificationModel> notification=[];

  Future<List<NotificationModel>>fetchNotification()async{
    var rawNotification=await client.fetchNotification();
    notification=rawNotification.map((e)=>NotificationModel.fromJson(e)).toList();
    return notification;
  }

}