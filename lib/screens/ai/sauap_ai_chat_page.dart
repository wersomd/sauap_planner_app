import 'package:flutter/material.dart';
import 'package:sauap_planner/components/widgets.dart';
import 'package:sauap_planner/screens/ai/model/chat_model.dart';
import 'package:sauap_planner/utils/color_palette.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageTextController = TextEditingController();
  final List<Message> _chatMessages = [];

  void _sendMessage(String userMessage) {
    setState(() {
      _chatMessages.add(Message(content: userMessage, role: 'user'));
      _chatMessages.add(Message(
          content: 'Біздің AI қазіргі уақытта қолжетімсіз...',
          role: 'assistant'));
    });
    _messageTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _chatMessages.isNotEmpty
              ? ListView.builder(
                  itemCount: _chatMessages.length,
                  itemBuilder: (context, index) {
                    final Message message = _chatMessages[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: message.role == 'user'
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: message.role == 'user'
                                    ? kTransparentColor
                                    : kTransparentColor,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: kPrimaryColor,
                                  width: 1.0,
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message.role,
                                  style: const TextStyle(color: kGrey1),
                                ),
                                const SizedBox(height: 5.0),
                                Text(message.content),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                )
              : Center(
                  child: buildText(
                    "Sauap AI",
                    kPrimaryColor,
                    26,
                    FontWeight.w500,
                    TextAlign.center,
                    TextOverflow.clip,
                  ),
                ),
        ),
        Container(
          height: 120.0,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: const BoxDecoration(
            color: kWhiteColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -1),
                blurRadius: 15.0,
                color: kPrimaryColor,
              )
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TextField(
                  controller: _messageTextController,
                  decoration: InputDecoration(
                      label: const Text('Сұрағыңызды қойсаңыз болады?'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              const SizedBox(width: 10.0),
              IconButton(
                icon: const Icon(Icons.send_outlined),
                onPressed: () {
                  _sendMessage(_messageTextController.text);
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
