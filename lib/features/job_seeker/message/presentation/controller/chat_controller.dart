import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/chat_list_model.dart';
import '../../../../../core/services/socket/socket_service.dart';
import '../../../../../core/services/storage/storage_services.dart';
import '../../../../../core/utils/enum/enum.dart';

class ChatController extends GetxController {
  /// Api status check here
  Status status = Status.completed;

  /// Chat more Data Loading Bar
  bool isMoreLoading = false;

  /// page no here
  int page = 1;

  /// Chat List here
  List chats = [];

  /// Chat Scroll Controller
  ScrollController scrollController = ScrollController();

  /// Chat Controller Instance create here
  static ChatController get instance => Get.put(ChatController());

  /// Chat More data Loading function
  Future<void> moreChats() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      isMoreLoading = true;
      update();
      await getChatRepo();
      isMoreLoading = false;
      update();
    }
  }

  /// Chat data Loading function
  Future<void> getChatRepo() async {
    // Demo data for testing
    if (page == 1) {
      status = Status.loading;
      update();
    }

    // Add demo chat data
    List<Map<String, dynamic>> demoChats = [
      {
        "_id": "chat_1",
        "participant": {
          "_id": "user_1",
          "fullName": "Sarah Johnson",
          "image":
              "https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face",
        },
        "latestMessage": {
          "_id": "msg_1",
          "message":
              "Hi! I saw your application for the Software Engineer position. When can we schedule an interview?",
          "createdAt": DateTime.now()
              .subtract(const Duration(hours: 2))
              .toIso8601String(),
        },
      },
      {
        "_id": "chat_2",
        "participant": {
          "_id": "user_2",
          "fullName": "Michael Chen",
          "image":
              "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face",
        },
        "latestMessage": {
          "_id": "msg_2",
          "message":
              "Thank you for your interest in our company. We'll review your resume and get back to you soon.",
          "createdAt": DateTime.now()
              .subtract(const Duration(hours: 5))
              .toIso8601String(),
        },
      },
      {
        "_id": "chat_3",
        "participant": {
          "_id": "user_3",
          "fullName": "Emily Rodriguez",
          "image":
              "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face",
        },
        "latestMessage": {
          "_id": "msg_3",
          "message":
              "Great! Your interview is scheduled for tomorrow at 2 PM. Please bring your portfolio.",
          "createdAt": DateTime.now()
              .subtract(const Duration(days: 1))
              .toIso8601String(),
        },
      },
      {
        "_id": "chat_4",
        "participant": {
          "_id": "user_4",
          "fullName": "David Kim",
          "image":
              "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face",
        },
        "latestMessage": {
          "_id": "msg_4",
          "message":
              "We're impressed with your skills. Would you like to discuss the offer details?",
          "createdAt": DateTime.now()
              .subtract(const Duration(days: 2))
              .toIso8601String(),
        },
      },
      {
        "_id": "chat_5",
        "participant": {
          "_id": "user_5",
          "fullName": "Lisa Thompson",
          "image":
              "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150&h=150&fit=crop&crop=face",
        },
        "latestMessage": {
          "_id": "msg_5",
          "message":
              "Welcome to the team! Your start date is next Monday. Looking forward to working with you!",
          "createdAt": DateTime.now()
              .subtract(const Duration(days: 3))
              .toIso8601String(),
        },
      },
    ];

    // Add demo chats to the list
    for (var item in demoChats) {
      chats.add(ChatModel.fromJson(item));
    }

    page = page + 1;
    status = Status.completed;
    update();

    // Original API call code (commented out for demo)
    /*
    var response = await ApiService.get("${ApiEndPoint.chats}?page=$page");

    if (response.statusCode == 200) {
      var data = response.data['chats'] ?? [];

      for (var item in data) {
        chats.add(ChatModel.fromJson(item));
      }

      page = page + 1;
      status = Status.completed;
      update();
    } else {
      Utils.errorSnackBar(response.statusCode.toString(), response.message);
      status = Status.error;
      update();
    }
    */
  }

  /// Chat data Update  Socket listener
  listenChat() async {
    SocketServices.on("update-chatlist::${LocalStorage.userId}", (data) {
      page = 1;
      chats.clear();

      for (var item in data) {
        chats.add(ChatModel.fromJson(item));
      }

      status = Status.completed;
      update();
    });
  }

  /// Controller on Init¬
  @override
  void onInit() {
    getChatRepo();
    super.onInit();
  }
}
