import 'package:embeyi/core/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../../core/component/image/common_image.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../../../../core/component/text_field/common_text_field.dart';
import '../../data/model/chat_message_model.dart';
import '../../../../../core/utils/extensions/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/message_controller.dart';
import '../widgets/chat_bubble_message.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  String chatId = Get.parameters["chatId"] ?? "";
  String name = Get.parameters["name"] ?? "";
  String image = Get.parameters["image"] ?? "";

  @override
  void initState() {
    MessageController.instance.name = name;
    MessageController.instance.chatId = chatId;
    MessageController.instance.getMessageRepo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white,

          /// App Bar Section starts here
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.white,
                size: 20.sp,
              ),
              onPressed: () => Get.back(),
            ),
            title: Row(
              children: [
                /// participant image here
                CircleAvatar(
                  radius: 18.sp,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: CommonImage(imageSrc: image, size: 36),
                  ),
                ),
                12.width,

                /// participant Name and Status here
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonText(
                      text: name,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                    CommonText(
                      text: "ACTIVE NOW",
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      color: AppColors.white,
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.videocam, color: AppColors.white, size: 24.sp),
                onPressed: () {},
              ),
            ],
          ),

          /// Body Section starts here
          body: controller.isLoading
              /// Loading bar here
              ? const Center(child: CircularProgressIndicator())
              /// Show data  here
              : Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  child: ListView.builder(
                    reverse: true,
                    controller: controller.scrollController,
                    itemCount: controller.isMoreLoading
                        ? controller.messages.length + 1
                        : controller.messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      /// Message item here
                      if (index < controller.messages.length) {
                        ChatMessageModel message = controller.messages[index];
                        return ChatBubbleMessage(
                          index: index,
                          image: message.image,
                          time: message.time,
                          text: message.text,
                          isMe: message.isMe,
                          name: name,
                          onTap: () {},
                        );
                      } else {
                        /// More data loading bar
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),

          /// bottom Navigation Bar Section starts here
          bottomNavigationBar: AnimatedPadding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            duration: const Duration(milliseconds: 100),
            curve: Curves.decelerate,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: const Color(0xFFE8EEF2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  /// Attachment Icon
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.attach_file,
                      color: AppColors.grey,
                      size: 24.sp,
                    ),
                  ),
                  12.width,

                  /// Text Field
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: CommonTextField(
                        hintText: "Write your message",
                        borderColor: Colors.transparent,
                        fillColor: AppColors.white,
                        borderRadius: 20,
                        paddingHorizontal: 16,
                        paddingVertical: 10,
                        controller: controller.messageController,
                        onSubmitted: (p0) => controller.addNewMessage(),
                      ),
                    ),
                  ),
                  12.width,

                  /// Send Button
                  GestureDetector(
                    onTap: controller.addNewMessage,
                    child: Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.send,
                        color: AppColors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
