import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/constant/data.dart';
import 'package:flutter_chat_ui/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _sendMessageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
      bottomSheet: getBottom(),
    );
  }

  getAppBar() {
    return AppBar(
      backgroundColor: grey.withOpacity(0.4),
      elevation: 0.0,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: primary,
        ),
      ),
      title: Row(children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"),
                fit: BoxFit.cover),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tyler Nix",
              style: TextStyle(
                  color: black, fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 1,
            ),
            Text(
              "Đang hoạt động",
              style: TextStyle(color: black.withOpacity(0.4), fontSize: 14),
            )
          ],
        )
      ]),
      actions: [
        const Icon(
          LineIcons.phone,
          color: primary,
          size: 28,
        ),
        const SizedBox(
          width: 15,
        ),
        const Icon(
          LineIcons.video,
          size: 30,
          color: primary,
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          width: 13,
          height: 13,
          decoration: BoxDecoration(
              color: online,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white38)),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }

  Widget getBody() {
    return ListView(
        padding: const EdgeInsets.all(20),
        children: List.generate(
          messages.length,
          (index) => BubbleChat(
            isMe: messages[index]['isMe'],
            message: messages[index]['message'],
            profileImg: messages[index]['profileImg'],
            messageType: messages[index]['messageType'],
          ),
        ));
  }

  Widget getBottom() {
    return Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(color: grey.withOpacity(0.4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          child: Row(children: const [
                        Icon(
                          Icons.add_circle,
                          color: primary,
                          size: 30,
                        ),
                        SizedBox(width: 15),
                        Icon(Icons.camera_alt, color: primary, size: 30),
                        SizedBox(width: 15),
                        Icon(Icons.photo, color: primary, size: 30),
                        SizedBox(width: 10),
                        Icon(Icons.keyboard_voice, color: primary, size: 30),
                      ]))
                    ])),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    child: Container(
                  width: (MediaQuery.of(context).size.width - 90) / 2,
                  height: 35,
                  decoration: BoxDecoration(
                      color: grey, borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    cursorColor: black,
                    controller: _sendMessageController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Aa',
                        suffixIcon: Icon(
                          Icons.face,
                          color: primary,
                          size: 30,
                        )),
                  ),
                )),
                const SizedBox(
                  width: 15,
                ),
                const Icon(
                  Icons.thumb_up,
                  size: 30,
                  color: primary,
                ),
              ],
            ),
          ],
        ));
  }
}

class BubbleChat extends StatelessWidget {
  final bool isMe;
  final String profileImg;
  final String message;
  final int messageType;

  const BubbleChat({
    super.key,
    required this.isMe,
    required this.profileImg,
    required this.message,
    required this.messageType,
  });

  @override
  Widget build(BuildContext context) {
    if (isMe) {
      return Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Row(children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(profileImg), fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  color: grey, borderRadius: getBorderMessageType(messageType)),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    message,
                    style: const TextStyle(fontSize: 15),
                  )),
            ),
          ]));
    } else {
      return Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 145),
              decoration: BoxDecoration(
                  color: primary,
                  borderRadius: getBorderMessageType(messageType)),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    message,
                    style: const TextStyle(fontSize: 15, color: white),
                  )),
            ),
          ]));
    }
  }

  getBorderMessageType(messageType) {
    if (isMe) {
      if (messageType == 1) {
        return getObjectBorder(20, 5, 20, 20);
      } else if (messageType == 2) {
        return getObjectBorder(5, 5, 20, 20);
      } else if (messageType == 3) {
        return getObjectBorder(5, 20, 20, 20);
      }
    } else {
      if (messageType == 1) {
        return getObjectBorder(20, 20, 20, 5);
      } else if (messageType == 2) {
        return getObjectBorder(20, 20, 5, 5);
      } else if (messageType == 3) {
        return getObjectBorder(20, 20, 5, 20);
      }
    }
    return const BorderRadius.all(Radius.circular(20));
  }

  getObjectBorder(
      double topLeft, double bottomLeft, double topRight, double bottomRight) {
    return BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        bottomLeft: Radius.circular(bottomLeft),
        topRight: Radius.circular(topRight),
        bottomRight: Radius.circular(bottomRight));
  }
}
