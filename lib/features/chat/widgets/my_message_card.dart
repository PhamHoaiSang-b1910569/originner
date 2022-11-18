import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:originner/colors.dart';
import 'package:originner/common/enums/message_enum.dart';
import 'package:originner/features/chat/widgets/display_text_image_gif.dart';

class MyMessageCard extends StatelessWidget {
  final String message;
  final String date;
  final MessageEnum type;

  const MyMessageCard({
    Key? key,
    required this.message,
    required this.date,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: messageColor,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: type == MessageEnum.text
                    ? const EdgeInsets.only(
                        left: 10,
                        right: 30,
                        top: 5,
                        bottom: 20,
                      )
                    : const EdgeInsets.only(
                        left: 5,
                        top: 5,
                        right: 5,
                        bottom: 25,
                      ),
                child: DisplayTextImageGIF(
                  message: message,
                  type: type,
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(153, 155, 154, 154),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(Ionicons.checkmark_done_sharp,size: 15,),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
