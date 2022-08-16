import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/constant/data.dart';
import 'package:flutter_chat_ui/pages/chat_detail_page.dart';
import 'package:flutter_chat_ui/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: ListView(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://scontent.fhan1-1.fna.fbcdn.net/v/t39.30808-1/293989864_1744694495872104_5072628103205789416_n.jpg?stp=cp1_dst-jpg_p160x160&_nc_cat=104&ccb=1-7&_nc_sid=7206a8&_nc_ohc=n5QmYYKiN9oAX8PWsWn&_nc_ht=scontent.fhan1-1.fna&oh=00_AT9Eft4Qm87KUdwqr2D51p7mPFyU0_IzNpcvzJLuj05Z3A&oe=62FF3E91"),
                        fit: BoxFit.cover))),
            const Text(
              "Tin nhắn",
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: black),
            ),
            const Icon(Icons.edit)
          ]),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: grey, borderRadius: BorderRadius.circular(15)),
            child: TextField(
                cursorColor: black,
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm',
                  border: InputBorder.none,
                  prefixIcon:
                      Icon(LineIcons.search, color: black.withOpacity(0.5)),
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: grey),
                              child: const Center(
                                child: Icon(
                                  LineIcons.plus,
                                  size: 33,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Thêm tin")
                          ],
                        )
                      ],
                    )),
                Row(
                    children: List.generate(
                        userStories.length,
                        (index) => Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(
                                      child: Stack(
                                        children: [
                                          userStories[index]['story']
                                              ? Container(
                                                  width: 75,
                                                  height: 75,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          width: 2,
                                                          color: blue_story)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Container(
                                                        width: 73,
                                                        height: 73,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image: DecorationImage(
                                                                image: NetworkImage(
                                                                    userStories[
                                                                            index]
                                                                        [
                                                                        'img']),
                                                                fit: BoxFit
                                                                    .cover))),
                                                  ))
                                              : Container(
                                                  width: 73,
                                                  height: 73,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              userStories[index]
                                                                  ['img']),
                                                          fit: BoxFit.cover))),
                                          userStories[index]['online']
                                              ? Positioned(
                                                  bottom: 8,
                                                  left: 55,
                                                  child: Container(
                                                    width: 20,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                        color: online,
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                            width: 3,
                                                            color: white)),
                                                  ))
                                              : Container()
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(userStories[index]['name'])
                                  ],
                                )
                              ],
                            ))))
              ])),
          const SizedBox(
            height: 20,
          ),
          Column(
              children: List.generate(
                  userMessages.length,
                  (index) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ChatDetailPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  child: Stack(
                                    children: [
                                      userMessages[index]['story']
                                          ? Container(
                                              width: 75,
                                              height: 75,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      width: 2,
                                                      color: blue_story)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Container(
                                                    width: 73,
                                                    height: 73,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                userMessages[
                                                                        index]
                                                                    ['img']),
                                                            fit:
                                                                BoxFit.cover))),
                                              ))
                                          : Container(
                                              width: 73,
                                              height: 73,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          userMessages[index]
                                                              ['img']),
                                                      fit: BoxFit.cover))),
                                      userMessages[index]['online']
                                          ? Positioned(
                                              bottom: 8,
                                              left: 55,
                                              child: Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    color: online,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: 3,
                                                        color: white)),
                                              ))
                                          : Container()
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        userMessages[index]['name'],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                145,
                                        child: Text(userMessages[index]
                                                ['message'] +
                                            " - " +
                                            userMessages[index]['created_at']),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )))),
        ]));
  }
}
