import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isSender;

  const ChatBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isSender ? const Color(0xFFE1FEC6) : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: isSender ? const Radius.circular(18) : const Radius.circular(4),
            bottomRight: isSender ? const Radius.circular(4) : const Radius.circular(18),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 3,
              spreadRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 14), // Space for time
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.3,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 11,
                      color: isSender ? Colors.black45 : Colors.grey[500],
                    ),
                  ),
                  if (isSender) ...[
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.done_all,
                      size: 14,
                      color: Color(0xFF4FC3F7),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
