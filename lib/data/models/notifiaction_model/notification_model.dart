
import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  final int id;
  final String icon, content,title;
  final DateTime date;

  NotificationModel({
    required this.id,
    required this.content,
    required this.icon,
    required this.title,
    required this.date,
  });
  factory NotificationModel.fromJson(Map<String,dynamic>json)=>_$NotificationModelFromJson(json);
  Map<String,dynamic>toJson()=>_$NotificationModelToJson(this);

}
