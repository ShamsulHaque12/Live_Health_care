import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/chat_controller.dart';
import '../model/chat_user_model.dart';
import '../model/message_model.dart';
import '../widgets/clear_chat_bottom_sheet.dart';
import '../widgets/show_block_bottom_sheet.dart';
import '../widgets/show_unblock_bottom_sheet.dart';

class ChatView extends StatelessWidget {
  final ChatUserModel user;

  ChatView({super.key, required this.user});

  late final ChatController controller = Get.put(
    ChatController(user),
    tag: user.id,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),

      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage(user.avatar)),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name, style: TextStyle(fontSize: 14.sp)),
                Text(
                  user.isOnline ? "Online" : "Offline",
                  style: TextStyle(fontSize: 10.sp),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Theme(
            data: Theme.of(context).copyWith(cardColor: Colors.white),
            child: PopupMenuButton<String>(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              onSelected: (value) {
                if (value == 'block') {
                  showBlockSheet(
                    isBlocked: controller.isBlocked.value,
                    onConfirm: controller.blockUser,
                    context: context,
                  );
                } else if (value == 'clear') {
                  showClearSheet(
                    context: context,
                    onConfirm: () {
                      controller.messages.clear();
                    },
                  );
                }
              },
              itemBuilder: (_) => [
                const PopupMenuItem(
                  value: 'block',
                  child: Text("Block", style: TextStyle(color: Colors.black)),
                ),
                const PopupMenuItem(
                  value: 'clear',
                  child: Text(
                    "Clear Chat",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          /// MESSAGE LIST
          Expanded(
            child: Obx(
              () => ListView.builder(
                reverse: false,
                padding: EdgeInsets.all(12.w),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final msg = controller.messages[index];
                  final isMe = msg.isMe;

                  return Column(
                    crossAxisAlignment: isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      if (!isMe)
                        Padding(
                          padding: EdgeInsets.only(left: 4.w),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 16.r,
                                backgroundImage: AssetImage(user.avatar),
                              ),
                              SizedBox(width: 8.w),
                              Flexible(
                                child: _buildMessageBubble(msg, isMe: false),
                              ),
                            ],
                          ),
                        )
                      else
                        _buildMessageBubble(msg, isMe: true),

                      if (isMe)
                        Padding(
                          padding: EdgeInsets.only(
                            right: 8.w,
                            top: 2.h,
                            bottom: 6.h,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildStatusWidget(msg.status),
                              SizedBox(width: 4.w),
                              Text(
                                DateFormat('h:mm a').format(msg.time),
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        )
                      else
                        SizedBox(height: 8.h),
                    ],
                  );
                },
              ),
            ),
          ),

          /// BLOCKED
          Obx(() {
            if (controller.isBlocked.value) {
              return GestureDetector(
                // onTap: controller.unblockUser,
                onTap: () {
                  showUnblockSheet(
                    isBlocked: true,
                    onConfirm: controller.unblockUser,
                    context: context,
                  );
                },
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Container(
                        height: 30.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(4.r)),
                        ),
                        padding: const EdgeInsets.all(14),
                        child: Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              text: "You blocked this user. ",
                              style: const TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "Tap to unblock.",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF9B51E0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              );
            }

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(Icons.add, color: Colors.black54),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: TextField(
                        controller: controller.textController,
                        minLines: 1,
                        maxLines: 6,
                        textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          hintText: "Ask a question...",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Container(
                    height: 32.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB575B0),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: InkWell(
                      onTap: controller.sendMessage,
                      child: Transform.rotate(
                        angle: -0.77,
                        child: const Icon(Icons.send, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(MessageModel msg, {required bool isMe}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      margin: EdgeInsets.symmetric(vertical: 2.h),
      constraints: BoxConstraints(maxWidth: 0.75.sw),
      decoration: BoxDecoration(
        color: isMe ? const Color(0xFF000000).withAlpha(10) : Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        msg.text,
        style: TextStyle(fontSize: 14.sp, color: Colors.black),
      ),
    );
  }

  Widget _buildStatusWidget(MessageStatus status) {
    switch (status) {
      // case MessageStatus.sending:
      //   return Icon(
      //     Icons.access_time_filled_rounded,
      //     size: 14.sp,
      //     color: Colors.grey[500],
      //   );
      case MessageStatus.sent:
        return Text(
          'Sent',
          style: TextStyle(fontSize: 12.sp, color: Colors.grey[500]),
        );
      case MessageStatus.delivered:
        return Text(
          'Read',
          style: TextStyle(fontSize: 12.sp, color: Colors.grey[500]),
        );
      case MessageStatus.read:
        return Text(
          'Read',
          style: TextStyle(fontSize: 12.sp, color: Colors.grey[500]),
        );
      case MessageStatus.sending:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}
