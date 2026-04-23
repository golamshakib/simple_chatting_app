import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_chatting_app/core/common/widgets/custom_text.dart';
import 'package:simple_chatting_app/core/common/widgets/glassy_appbar.dart';
import 'package:simple_chatting_app/features/chat/controler/message_controller.dart';
import 'package:simple_chatting_app/features/chat/presentation/widgets/chat_bubble.dart';
import 'package:simple_chatting_app/features/chat/presentation/widgets/glassy_bottom_bar.dart';
import 'package:simple_chatting_app/routes/app_routes.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject Controller
    final controller = Get.put(MessageController());
    final participants = controller.conversation.participants;

    log('Data is: ${controller.conversation.toJson()}');
    log(
      'Participants Data is: ${controller.conversation.participants?.toJson()}',
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFDEE9D2),
      body: Stack(
        children: [
          // Chat Content
          Positioned.fill(
            child: ListView.builder(
              padding: EdgeInsets.only(
                top:
                    MediaQuery.of(context).padding.top +
                    75, // Start below app bar pills
                bottom: 120, // Enough space for bottom bar and final message
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                // Dates as in screenshot
                if (index == 6) {
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const CustomText(
                        text: "April 4",
                        textColor: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  );
                }

                bool isSender = index % 2 != 0;
                return ChatBubble(
                  message: isSender
                      ? "Stateless refactor complete! All components are now isolated floating islands."
                      : "This matter has been ongoing for more than 3 months, and the delay is primarily due to the lack of access from the client's side.",
                  time: "12:49 PM",
                  isSender: isSender,
                );
              },
            ),
          ),
          // Glassy Blur Layer (Top) with smooth fade
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).padding.top + 50, // Covers app bar area
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  color: Colors.white.withOpacity(0.12),
                ),
              ),
            ),
          ),

          // Glassy Blur Layer (Bottom) with smooth fade
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 75, // Covers bottom bar area
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  color: Colors.white.withOpacity(0.12),
                ),
              ),
            ),
          ),

          // Isolated Floating App Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GlassyAppBar(
              title: participants?.username ?? 'Unknown User)',
              subtitle: 'last seen 37 minutes ago',
              badgeCount: 20,
              profileImageUrl:
                  (participants?.image != null &&
                      participants!.image!.isNotEmpty)
                  ? participants.image
                  : 'https://i.pravatar.cc/150?u=a042581f4e29026704d',
            ),
          ),

          // Isolated Floating Bottom Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GlassyBottomBar(
              controller: controller.messageController,
              onAttach: () {
                // Implementation for file picker
              },
              onMicTap: () {
                // Implementation for voice recording
                Get.toNamed(AppRoute.shapeScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
