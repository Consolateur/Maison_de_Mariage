import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override Widget build(BuildContext ctx) {
    return Scaffold(appBar: AppBar(title: Text('Mon profil')), body: Center(child: Text('Gérer profil')));
  }
}
