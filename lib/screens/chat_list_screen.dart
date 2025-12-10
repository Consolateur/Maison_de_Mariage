import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});
  @override Widget build(BuildContext ctx) {
    return Scaffold(appBar: AppBar(title: Text('Chats')), body: Center(child: Text('Liste des chats')));
  }
}
