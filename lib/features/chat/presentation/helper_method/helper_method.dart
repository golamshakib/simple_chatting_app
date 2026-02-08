import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatTimestamp(String timestamp) {
  if (timestamp.isEmpty) return "";

  try {
    final messageTime = DateTime.parse(timestamp).toLocal();
    final now = DateTime.now();
    final diff = now.difference(messageTime);

    if (diff.inMinutes < 1) return "Just now";
    if (diff.inMinutes < 60) return "${diff.inMinutes}m ago";
    if (diff.inHours < 24) return "${diff.inHours}h ago";

    final today = DateTime(now.year, now.month, now.day);
    final msgDay = DateTime(messageTime.year, messageTime.month, messageTime.day);
    final dayDiff = today.difference(msgDay).inDays;

    if (dayDiff == 1) return "Yesterday";
    if (dayDiff < 7) return "${dayDiff}d ago";

    // 26 Jan, 2026
    return DateFormat('dd MMM, yyyy').format(messageTime);

  } catch (e) {
    debugPrint("Error parsing timestamp: $e");
    return "";
  }
}
