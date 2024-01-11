import 'package:get/get.dart';
import 'package:notification_listener_service/notification_event.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

class SMSController extends GetxController {
  RxList<ServiceNotificationEvent> notificationList =
      RxList<ServiceNotificationEvent>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    listenNotification();
  }

  void requestForPermission() async {
    print("Requesting Permission");
    final bool status = await NotificationListenerService.isPermissionGranted();
    if (status != true) {
      print("No permission");
      final bool statuss =
          await NotificationListenerService.requestPermission();
      return;
    }
    listenNotification();
  }

  void listenNotification() {
    print("Listning SMS");
    NotificationListenerService.notificationsStream.listen((event) {
      notificationList.add(event);
      print(notificationList);
    });
  }
}
