import 'dart:developer';

import 'package:get/get.dart';
import 'package:simple_chatting_app/core/services/network_caller.dart';
import 'package:simple_chatting_app/core/utils/constants/app_urls.dart';
import 'package:simple_chatting_app/core/utils/logging/logger.dart';

import '../data/model/chatlist-model.dart';

class ChatListController extends GetxController {

  RxBool isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    getConversationList();
  }

  Future<void> getConversationList() async {
    try {
      final response = await NetworkCaller().getRequest(
        "${AppUrls.getConversationList}?limit=10&page=1",
      );
      if (response.isSuccess) {
        final data = ConversationResponse.fromJson(response.responseData);
        log("Status Code: ${response.statusCode}");
        log("Response: $data");
      } else {
        AppLoggerHelper.error("Error: ${response.errorMessage}");
      }
    } catch (e) {
      AppLoggerHelper.error("Error: $e");
    }
  }

  Future<void> refreshChatList() async {
    await Future.delayed(const Duration(seconds: 1));
    await getConversationList();
    update();
  }
}
