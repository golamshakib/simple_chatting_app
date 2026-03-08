import 'package:flutter/material.dart';
import 'package:simple_chatting_app/features/chat/data/model/chatlist-model.dart';

import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_sizes.dart';
import '../../../../core/utils/constants/image_path.dart';
import '../helper_method/helper_method.dart';

class ChatListItem extends StatelessWidget {
  final ConversationResult conversation;

  const ChatListItem({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    final participants = conversation.participants;
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: getHeight(4)),
      leading: CircleAvatar(
        radius: 35,
        // Default background image
        backgroundImage: AssetImage(ImagePath.profileImage),
        // Load participant's image if available, otherwise use default
        foregroundImage:
            (conversation.participants?.image != null &&
                conversation.participants!.image!.isNotEmpty)
            ? NetworkImage(conversation.participants!.image!)
            : null,
      ),
      title: CustomText(
        text: participants?.username ?? 'Unknown',
        fontSize: getWidth(16),
        fontWeight: FontWeight.w600,
        maxLines: 1,
        textOverflow: TextOverflow.ellipsis,
      ),
      subtitle: CustomText(
        text: conversation.lastMessage ?? 'No messages yet',
        fontSize: getWidth(14),
        fontWeight: FontWeight.w400,
        maxLines: 1,
        textOverflow: TextOverflow.ellipsis,
      ),
      trailing: CustomText(
        text: formatTimestamp(conversation.lastMessageTime ?? ''),
        fontSize: getWidth(12),
        fontWeight: FontWeight.w400,
        maxLines: 1,
        textOverflow: TextOverflow.ellipsis,
      ),
    );
  }
}
