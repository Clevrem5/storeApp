import 'package:connectivity_plus/connectivity_plus.dart';

import '../../models/notification_model/notification_model.dart';
import 'notification_repository_interface.dart';
import 'notification_repository_local.dart';
import 'notification_repository_remote.dart';

class NotificationRepository implements INotificationRepository {
  final NotificationRepositoryRemote remoteRepo;
  final NotificationRepositoryLocal localRepo;

  NotificationRepository({required this.remoteRepo, required this.localRepo});

  @override
  Future<List<NotificationModel>> fetchNotification() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    final isOnline = connectivityResult.contains(ConnectivityResult.mobile) || connectivityResult.contains(ConnectivityResult.wifi);

    if (isOnline) {
      return await remoteRepo.fetchNotification();
    } else {
      return await localRepo.fetchNotification();
    }
  }
}
