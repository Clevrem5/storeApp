import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  final int id;
  final String icon;
  final String content;
  final String title;
  final DateTime date;

  NotificationModel({
    required this.id,
    required this.content,
    required this.icon,
    required this.title,
    required this.date,
  });

  @override
  String toString() {
    return 'NotificationModel(id: $id, title: $title, content: $content, icon: $icon, date: $date)';
  }


  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}

class NotificationAdapter extends TypeAdapter<NotificationModel> {
  @override
  int get typeId => 2;

  @override
  void write(BinaryWriter writer, NotificationModel obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.icon);
    writer.write(obj.content);
    writer.write(obj.date);
  }

  @override
  NotificationModel read(BinaryReader reader) {
    return NotificationModel(
      id: reader.read(),
      content: reader.read(),
      icon: reader.read(),
      title: reader.read(),
      date: reader.read(),
    );
  }
}
