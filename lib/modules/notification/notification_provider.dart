import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/notification.dart';
import 'notification_service.dart';

final notificationProvider =
    StateNotifierProvider<NotificationProvider, List<NotificationModel>>(
  (ref) => NotificationProvider(),
);

class NotificationProvider extends StateNotifier<List<NotificationModel>> {
  NotificationProvider() : super([]);

  Future<void> addNotification(NotificationModel notification) async {
    state = [...state, notification];
    await NotificationService.showNotification(
      id: notification.id.hashCode,
      title: notification.title,
      body: notification.body,
    );
  }

  Future<void> markNotificationAsRead(NotificationModel notification) async {
    final index = state.indexWhere((n) => n.id == notification.id);
    if (index != -1) {
      final updatedNotification = NotificationModel(
        id: notification.id,
        title: notification.title,
        body: notification.body,
        dateTime: notification.dateTime,
        isRead: true,
      );
      state = [
        ...state.sublist(0, index),
        updatedNotification,
        ...state.sublist(index + 1),
      ];
    }
  }

  Future<void> deleteNotification(NotificationModel notification) async {
    state = state.where((n) => n.id != notification.id).toList();
  }
}
