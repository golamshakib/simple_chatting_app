import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_chatting_app/features/chat/controler/chatlist_controller.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../helper_method/helper_method.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatListController());
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        vertical: getHeight(4),
      ),
      leading: CircleAvatar(
        radius: 35,
        backgroundImage: AssetImage(ImagePath.profileImage),
      ),
      title: CustomText(
        text: "Sohel Hosen",
        fontSize: getWidth(16),
        fontWeight: FontWeight.w600,
        maxLines: 1,
        textOverflow: TextOverflow.ellipsis,
      ),
      subtitle:  CustomText(
        text: "Hello Sir, How are you?",
        fontSize: getWidth(14),
        fontWeight: FontWeight.w400,
        maxLines: 1,
        textOverflow: TextOverflow.ellipsis,
      ),
      trailing: CustomText(
        text: formatTimestamp("2026-02-08T10:30:00Z"),
        fontSize: getWidth(12),
        fontWeight: FontWeight.w400,
        maxLines: 1,
        textOverflow: TextOverflow.ellipsis,
      ),
    );
  }
}