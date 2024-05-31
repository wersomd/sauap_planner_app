import 'package:flutter/material.dart';
import 'package:sauap_planner/screens/ai/model/chat_model.dart';
// import 'package:sauap_planner/screens/ai/repository/chat_repository.dart';

class ChatProvider extends ChangeNotifier {
  // final ChatRepository _chatRepository = ChatRepository();

  final List<Message> _chatMessages = [];

  List<Message> get chatMessages => _chatMessages;

  Future<void> sendMessage({required String userMessage}) async {
    _chatMessages.add(Message(content: userMessage, role: 'user'));
    _chatMessages.add(Message(
        content: 'Біздің AI қазіргі уақытта қолжетімсіз...',
        role: 'assistant'));
    notifyListeners();

    // final assistantMenssage = await _chatRepository.sendMessageAndGetResponse(
    //   chatMessages: _chatMessages,
    // );

    // _chatMessages.removeLast();
    // _chatMessages.add(assistantMenssage);
    // notifyListeners();
  }
}
