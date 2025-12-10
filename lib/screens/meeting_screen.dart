import 'package:flutter/material.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});
  @override Widget build(BuildContext ctx) {
    final sample = List.generate(8, (i) => {'id':'u\$i','name':'User \$i','age':20+i,'country':'BF','faceHidden': true});
    return Scaffold(
      appBar: AppBar(title: Text('Rencontres')),
      body: ListView.builder(
        itemCount: sample.length,
        itemBuilder: (c,i){
          final u = sample[i];
          return ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text('\${u['name']}, \${u['age']}'),
            subtitle: Text(u['country']),
            trailing: u['faceHidden'] ? Icon(Icons.lock) : Icon(Icons.remove_red_eye),
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileDetailScreen(user:u))),
          );
        },
      ),
    );
  }
}

class ProfileDetailScreen extends StatelessWidget {
  final Map user;
  ProfileDetailScreen({required this.user});
  @override Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text(user['name'])),
      body: Padding(padding: EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(child: CircleAvatar(radius:48, child: Icon(Icons.person, size:48))),
        SizedBox(height:12),
        Text('Âge: \${user['age']}'),
        Text('Pays: \${user['country']}'),
        SizedBox(height:18),
        ElevatedButton(child: Text('Demander à discuter'), onPressed: (){
          ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(content: Text('Demande envoyée (simulé)')));
        }),
      ])),
    );
  }
}
