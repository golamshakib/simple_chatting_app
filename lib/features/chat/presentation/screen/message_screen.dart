import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_chatting_app/core/common/widgets/glassy_appbar.dart';
import 'package:simple_chatting_app/features/chat/controler/message_controller.dart';
import 'package:simple_chatting_app/features/chat/presentation/widgets/chat_bubble.dart';
import 'package:simple_chatting_app/features/chat/presentation/widgets/glassy_bottom_bar.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject Controller
    final controller = Get.put(MessageController());
    final participants = controller.conversation.participants;
    
    log('Data is: ${controller.conversation.toJson()}');
    log('Participants Data is: ${controller.conversation.participants?.toJson()}');

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFDEE9D2),
      body: Stack(
        children: [

          // Chat Content
          Positioned.fill(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                top: kToolbarHeight,
                bottom: 110, // Space for bottom bar
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                // Dates as in screenshot
                if (index == 6) {
                   return Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "April 4",
                        style: TextStyle(color: Colors.white, fontSize: 13),
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

          // Isolated Floating App Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GlassyAppBar(
              title: participants?.username ?? 'Jahid (SMT - BACKE...)',
              subtitle: 'last seen 37 minutes ago',
              badgeCount: 11,
              profileImageUrl: (participants?.image != null && participants!.image!.isNotEmpty)
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
