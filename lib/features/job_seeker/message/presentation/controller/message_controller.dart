import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/model/chat_message_model.dart';
import '../../data/model/message_model.dart';

import '../../../../../core/services/socket/socket_service.dart';
import '../../../../../core/services/storage/storage_services.dart';
import '../../../../../core/utils/enum/enum.dart';

class MessageController extends GetxController {
  bool isLoading = false;
  bool isMoreLoading = false;
  String? video;

  List messages = [];

  String chatId = "";
  String name = "";

  int page = 1;
  int currentIndex = 0;
  Status status = Status.completed;

  bool isMessage = false;
  bool isInputField = false;

  ScrollController scrollController = ScrollController();
  TextEditingController messageController = TextEditingController();

  static MessageController get instance => Get.put(MessageController());

  MessageModel messageModel = MessageModel.fromJson({});

  Future<void> getMessageRepo() async {
    // Demo data for testing
    if (page == 1) {
      messages.clear();
      status = Status.loading;
      update();
    }

    // Add demo messages based on chatId
    List<ChatMessageModel> demoMessages = _getDemoMessagesForChat(chatId);

    for (var message in demoMessages) {
      messages.add(message);
    }

    page = page + 1;
    status = Status.completed;
    update();

    // Original API call code (commented out for demo)
    /*
    var response = await ApiService.get(
      "${ApiEndPoint.messages}?chatId=$chatId&page=$page&limit=15",
    );

    if (response.statusCode == 200) {
      var data = response.data['data']['attributes']['messages'];

      for (var messageData in data) {
        messageModel = MessageModel.fromJson(messageData);

        messages.add(
          ChatMessageModel(
            time: messageModel.createdAt.toLocal(),
            text: messageModel.message,
            image: messageModel.sender.image,
            isNotice: messageModel.type == "notice" ? true : false,
            isMe: LocalStorage.userId == messageModel.sender.id ? true : false,
          ),
        );
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

  /// Get demo messages for specific chat
  List<ChatMessageModel> _getDemoMessagesForChat(String chatId) {
    switch (chatId) {
      case "chat_1": // Sarah Johnson
        return [
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(minutes: 30)),
            text:
                "Hi! I saw your application for the Software Engineer position. When can we schedule an interview?",
            image:
                "https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face",
            isMe: false,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(minutes: 25)),
            text:
                "Hello! Thank you for reaching out. I'm available for an interview this week. What time works best for you?",
            image:
                "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face",
            isMe: true,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(minutes: 20)),
            text:
                "Great! How about Thursday at 2 PM? We can do it via video call or in person at our office.",
            image:
                "https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face",
            isMe: false,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(minutes: 15)),
            text:
                "Thursday at 2 PM works perfectly for me. I prefer video call if that's okay with you.",
            image:
                "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face",
            isMe: true,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(minutes: 10)),
            text:
                "Perfect! I'll send you the meeting link via email. Looking forward to speaking with you!",
            image:
                "https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face",
            isMe: false,
          ),
        ];

      case "chat_2": // Michael Chen
        return [
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(hours: 5)),
            text:
                "Thank you for your interest in our company. We'll review your resume and get back to you soon.",
            image:
                "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face",
            isMe: false,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(
              const Duration(hours: 4, minutes: 30),
            ),
            text:
                "Thank you for the update. I'm excited about this opportunity and look forward to hearing from you.",
            image:
                "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face",
            isMe: true,
          ),
        ];

      case "chat_3": // Emily Rodriguez
        return [
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(days: 1)),
            text:
                "Great! Your interview is scheduled for tomorrow at 2 PM. Please bring your portfolio.",
            image:
                "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face",
            isMe: false,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(days: 1, minutes: 30)),
            text:
                "Perfect! I'll have my portfolio ready. Is there anything specific you'd like me to prepare for the interview?",
            image:
                "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face",
            isMe: true,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(days: 1, minutes: 15)),
            text:
                "Please be ready to discuss your previous projects and how you approach problem-solving. See you tomorrow!",
            image:
                "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face",
            isMe: false,
          ),
        ];

      case "chat_4": // David Kim
        return [
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(days: 2)),
            text:
                "We're impressed with your skills. Would you like to discuss the offer details?",
            image:
                "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face",
            isMe: false,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(days: 2, minutes: 30)),
            text:
                "That's wonderful news! Yes, I'd love to discuss the offer details. When would be a good time?",
            image:
                "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face",
            isMe: true,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(days: 2, minutes: 15)),
            text:
                "How about we schedule a call for tomorrow at 3 PM? I'll share the offer details and answer any questions you have.",
            image:
                "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face",
            isMe: false,
          ),
        ];

      case "chat_5": // Lisa Thompson
        return [
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(days: 3)),
            text:
                "Welcome to the team! Your start date is next Monday. Looking forward to working with you!",
            image:
                "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150&h=150&fit=crop&crop=face",
            isMe: false,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(days: 3, minutes: 30)),
            text:
                "Thank you so much! I'm excited to join the team. What should I bring on my first day?",
            image:
                "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face",
            isMe: true,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(days: 3, minutes: 15)),
            text:
                "Just bring yourself and a positive attitude! We'll provide everything else you need. See you Monday at 9 AM!",
            image:
                "https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150&h=150&fit=crop&crop=face",
            isMe: false,
          ),
        ];

      default:
        return [
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(minutes: 10)),
            text: "Hello! This is a demo message.",
            image:
                "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face",
            isMe: false,
          ),
          ChatMessageModel(
            time: DateTime.now().subtract(const Duration(minutes: 5)),
            text: "Hi there! This is a demo response.",
            image:
                "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face",
            isMe: true,
          ),
        ];
    }
  }

  addNewMessage() async {
    isMessage = true;
    update();

    messages.insert(
      0,
      ChatMessageModel(
        time: DateTime.now(),
        text: messageController.text,
        image: LocalStorage.myImage,
        isMe: true,
      ),

      // ChatMessageModel(
      //     currentTime.format(context).toString(),
      //     controller.messageController.text,
      //     true),
    );

    isMessage = false;
    update();

    var body = {
      "chat": chatId,
      "message": messageController.text,
      "sender": LocalStorage.userId,
    };

    messageController.clear();

    SocketServices.emitWithAck("add-new-message", body, (data) {
      if (kDebugMode) {
        print(
          "===============================================================> Received acknowledgment: $data",
        );
      }
    });
  }

  listenMessage(String chatId) async {
    SocketServices.on('new-message::$chatId', (data) {
      status = Status.loading;
      update();

      var time = data['createdAt'].toLocal();
      messages.insert(
        0,
        ChatMessageModel(
          isNotice: data['messageType'] == "notice" ? true : false,
          time: time,
          text: data['message'],
          image: data['sender']['image'],
          isMe: false,
        ),
      );

      status = Status.completed;
      update();
    });
  }

  void isEmoji(int index) {
    currentIndex = index;
    isInputField = isInputField;
    update();
  }
}
