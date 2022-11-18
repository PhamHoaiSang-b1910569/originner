// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:originner/colors.dart';
import 'package:originner/common/widgets/loader.dart';
import 'package:originner/features/auth/controller/auth_controller.dart';
import 'package:originner/features/chat/widgets/bottom_chat_field.dart';

import 'package:originner/models/user_model.dart';
import 'package:originner/features/chat/widgets/chat_list.dart';

class MobileChatScreen extends ConsumerWidget {
  static const String routeName = '/mobile-chat-screen';
  final String name;
  final String uid;

  const MobileChatScreen({
    Key? key,
    required this.name,
    required this.uid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: blackColor,
        backgroundColor: backgroundColor,
        title: StreamBuilder<UserModel>(
            stream: ref.read(authControllerProvider).userDataById(uid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loader();
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: blackColor,
                    ),
                    // textAlign: TextAlign.right
                  ),
                  Text(
                    snapshot.data!.isOnline
                        ? 'Đang hoat động'
                        : 'Đang dừng hoat động',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      color: greyColor,
                    ),
                    // textAlign: TextAlign.right
                  ),
                ],
              );
            }),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.video,
              color: blackColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.call, color: blackColor),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.more, color: blackColor),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatList(
              recieverUserId: uid,
            ),
          ),
          BottomChatField(
            recieverUserId: uid,
          ),
        ],
      ),
    );
  }
}
