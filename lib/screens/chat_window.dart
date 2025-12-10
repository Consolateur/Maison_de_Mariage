import 'package:flutter/material.dart';

class ChatWindow extends StatefulWidget {
  final String chatId;
  ChatWindow({required this.chatId});
  @override State<ChatWindow> createState() => _ChatWindowState();
}
class _ChatWindowState extends State<ChatWindow> {
  final _ctrl = TextEditingController();
  List<Map> messages = [];
  @override Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Column(children: [
        Expanded(child: ListView.builder(itemCount: messages.length, itemBuilder:(c,i)=>ListTile(title: Text(messages[i]['text'])))),
        Row(children: [
          Expanded(child: TextField(controller: _ctrl)),
          IconButton(icon: Icon(Icons.send), onPressed: (){
            final t=_ctrl.text.trim();
            if(t.isEmpty) return;
            setState(()=>messages.add({'text':t}));
            _ctrl.clear();
          })
        ])
      ]),
    );
  }
}
