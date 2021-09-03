import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hsvh/auth/AuthServices.dart';
import 'package:hsvh/controllers/Contact/PersonalConversationPageController.dart';

class PersonalConversationPage extends StatefulWidget {
  const PersonalConversationPage({Key? key}) : super(key: key);

  @override
  _PersonalConversationPageState createState() =>
      _PersonalConversationPageState();
}

class _PersonalConversationPageState extends State<PersonalConversationPage> {
  final PersonalConversationController controller =
      Get.put(PersonalConversationController());
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonalConversationController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
              body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            iconSize: 30,
                            color: Colors.grey.shade700,
                            onPressed: () {},
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          CircleAvatar(
                            radius: 20.0,
                            backgroundImage: AssetImage('assets/avatar.png'),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.4),
                            child: Text(
                              "User",
                              style: TextStyle(fontSize: 20),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8),
                    ),
                    IconButton(
                      icon: Icon(Icons.more_vert),
                      iconSize: 30,
                      color: Colors.grey.shade700,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            index == 0 ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text("Yesterday"),
                            ) : Container(),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.8),
                                  child: Text(
                                    "Hello, My name is Harshit",
                                  ),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      )
                                    ],
                                    color: Color(0xFFEBEBEB),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12.0),
                                      topRight: Radius.circular(12.0),
                                      bottomRight: Radius.circular(12.0),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  margin: EdgeInsets.symmetric(vertical: 10.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Container(
                                alignment: Alignment.topRight,
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.8),
                                  child: Text(
                                    "Hii, My name is Harshit too!!",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      )
                                    ],
                                    color: Color(0xFFC41C27),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12.0),
                                      topRight: Radius.circular(12.0),
                                      bottomLeft: Radius.circular(12.0),
                                    ),
                                  ),
                                  padding: EdgeInsets.all(10.0),
                                  margin: EdgeInsets.symmetric(vertical: 10.0),
                                ),
                              ),
                            ),
                          ],
                        );
                      })),
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        minLines: 1,
                        maxLines: 10,
                        controller: messageController,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration.collapsed(
                          hintText: "Type Something",
                        ),
                        textCapitalization: TextCapitalization.sentences,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.attachment),
                      iconSize: 30,
                      color: Colors.grey.shade700,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      iconSize: 30,
                      color: Colors.grey.shade700,
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          )),
        );
      },
    );
  }
}
