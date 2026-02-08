import 'package:flutter/material.dart';
import 'package:simple_chatting_app/core/common/widgets/custom_appbar.dart';
import 'package:simple_chatting_app/core/common/widgets/custom_text.dart';
import 'package:simple_chatting_app/core/utils/constants/app_sizes.dart';
import 'package:simple_chatting_app/core/utils/constants/image_path.dart';

import '../helper_method/helper_method.dart';

class ChattingListScreen extends StatelessWidget {
  const ChattingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackIcon: false,
        title: "Chats",
        titleSize: getWidth(24),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(getWidth(24)),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
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
                        text: formatTimestamp("2026-01-26T10:30:00Z"),
                        fontSize: getWidth(12),
                        fontWeight: FontWeight.w400,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

