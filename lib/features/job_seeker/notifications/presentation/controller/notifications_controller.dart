import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/notification_model.dart';
import '../../repository/notification_repository.dart';

class NotificationsController extends GetxController {
  /// Notification List
  List notifications = [];

  /// Notification Loading Bar
  bool isLoading = false;

  /// Notification more Data Loading Bar
  bool isLoadingMore = false;

  /// No more notification data
  bool hasNoData = false;

  /// page no here
  int page = 0;

  /// Notification Scroll Controller
  ScrollController scrollController = ScrollController();

  /// Notification More data Loading function

  void moreNotification() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (isLoadingMore || hasNoData) return;
        isLoadingMore = true;
        update();
        page++;
        List<NotificationModel> list = await notificationRepository(page);
        if (list.isEmpty) {
          hasNoData = true;
        } else {
          notifications.addAll(list);
        }
        isLoadingMore = false;
        update();
      }
    });
  }

  /// Notification data Loading function
  getNotificationsRepo() async {
    isLoading = true;
    update();

    // Demo notifications data
    await Future.delayed(const Duration(milliseconds: 500));

    notifications = [
      NotificationModel(
        id: '1',
        message: 'Google is Hiring UI/UX Designers in New York.',
        linkId: 'job_001',
        type: 'Job Alert',
        role: 'job_seeker',
        receiver: 'user_001',
        v: 1,
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      NotificationModel(
        id: '2',
        message: 'Your Application For Junior UX Designer Was Not Shortlisted.',
        linkId: 'application_001',
        type: 'Reject Application',
        role: 'job_seeker',
        receiver: 'user_001',
        v: 1,
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      NotificationModel(
        id: '3',
        message: 'HR Invited You For A Video Call Today At 05:00pm',
        linkId: 'message_001',
        type: 'Message Alert',
        role: 'job_seeker',
        receiver: 'user_001',
        v: 1,
        createdAt: DateTime.now().subtract(const Duration(hours: 8)),
        updatedAt: DateTime.now().subtract(const Duration(hours: 8)),
      ),
      NotificationModel(
        id: '4',
        message: 'Your Free Plan Applications Are Almost Over. Please Buy Now Plan.',
        linkId: 'subscription_001',
        type: 'Message Alert',
        role: 'job_seeker',
        receiver: 'user_001',
        v: 1,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      NotificationModel(
        id: '5',
        message: 'Google is Hiring UI/UX Designers in New York.',
        linkId: 'job_002',
        type: 'Job Alert',
        role: 'job_seeker',
        receiver: 'user_001',
        v: 1,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      NotificationModel(
        id: '6',
        message: 'Your Application For Junior UX Designer Was Not Shortlisted.',
        linkId: 'application_002',
        type: 'Reject Application',
        role: 'job_seeker',
        receiver: 'user_001',
        v: 1,
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
        updatedAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      NotificationModel(
        id: '7',
        message: 'HR Invited You For A Video Call Today At 05:00pm',
        linkId: 'message_002',
        type: 'Message Alert',
        role: 'job_seeker',
        receiver: 'user_001',
        v: 1,
        createdAt: DateTime.now().subtract(const Duration(days: 4)),
        updatedAt: DateTime.now().subtract(const Duration(days: 4)),
      ),
      NotificationModel(
        id: '8',
        message: 'Your Free Plan Applications Are Almost Over. Please Buy Now Plan.',
        linkId: 'subscription_002',
        type: 'Message Alert',
        role: 'job_seeker',
        receiver: 'user_001',
        v: 1,
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
        updatedAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
    ];

    isLoading = false;
    update();

    // Uncomment below to use real API
    /*
    if (isLoading || hasNoData) return;
    isLoading = true;
    update();

    page++;
    List<NotificationModel> list = await notificationRepository(page);
    if (list.isEmpty) {
      hasNoData = true;
    } else {
      notifications.addAll(list);
    }
    isLoading = false;
    update();
    */
  }

  /// Notification Controller Instance create here
  static NotificationsController get instance =>
      Get.put(NotificationsController());

  /// Controller on Init
  @override
  void onInit() {
    getNotificationsRepo();
    moreNotification();
    super.onInit();
  }
}
