import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/component/image/common_image.dart';
import '../../../../../core/component/text/common_text.dart';
import '../../data/model/chat_list_model.dart';
import '../../../../../core/utils/extensions/extension.dart';

Widget chatListItem({required ChatModel item}) {
  return Container(
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.only(bottom: 12),
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      shadows: [
        BoxShadow(
          color: Color(0x11000000),
          blurRadius: 2,
          offset: Offset(0, 2),
          spreadRadius: 0,
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          children: [
            /// participant image here
            CircleAvatar(
              radius: 35.sp,
              child: ClipOval(
                child: CommonImage(imageSrc: item.participant.image, size: 70),
              ),
            ),
            12.width,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// participant Name here
                        CommonText(
                          text: item.participant.fullName,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),

                        /// participant Last Message here
                        CommonText(
                          text: item.latestMessage.message,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ),
                  12.width,
                  CommonText(
                    text: "2 Min Ago",
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
