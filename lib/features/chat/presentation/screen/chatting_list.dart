import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_chatting_app/core/common/widgets/custom_appbar.dart';
import 'package:simple_chatting_app/core/common/widgets/custom_text.dart';
import 'package:simple_chatting_app/core/utils/constants/app_sizes.dart';

import '../../../../core/common/widgets/custom_pull_refresh.dart';
import '../../controler/chatlist_controller.dart';
import '../widgets/chatlist_item.dart';

class ChattingListScreen extends StatelessWidget {
  const ChattingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatListController());

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
          child: Obx(() {
            if (controller.conversationList.isEmpty) {
              return const Center(child: CustomText(text: 'NO DATA FOUND'));
            }
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                /// Custom Pull To Refresh
                CupertinoSliverRefreshControl(
                  onRefresh: () async {
                    await controller.refreshChatList();
                  },
                  builder:
                      (
                        BuildContext context,
                        RefreshIndicatorMode mode,
                        double pulledExtent,
                        double refreshTriggerPullDistance,
                        double refreshIndicatorExtent,
                      ) {
                        final bool refreshing =
                            mode == RefreshIndicatorMode.refresh ||
                            mode == RefreshIndicatorMode.armed;

                        return CustomPullRefresh(
                          pulledExtent: pulledExtent,
                          refreshing: refreshing,
                        );
                      },
                ),

                /// Chat List
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final chat = controller.conversationList[index];
                    return ChatListItem(conversation: chat);
                  },
                      childCount: controller.conversationList.length
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }












}
