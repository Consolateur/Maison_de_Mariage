import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  @override State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  final _form = GlobalKey<FormState>();
  String fname='', lname='', phone='', email='', pass='';

  @override Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text('Inscription')),
      body: Padding(padding: EdgeInsets.all(16), child: Form(key: _form, child: ListView(children: [
        TextFormField(decoration: InputDecoration(labelText:'Prénom'), onSaved: (v)=>fname=v!),
        TextFormField(decoration: InputDecoration(labelText:'Nom'), onSaved: (v)=>lname=v!),
        TextFormField(decoration: InputDecoration(labelText:'Téléphone (ou email)'), onSaved: (v)=>phone=v!),
        TextFormField(decoration: InputDecoration(labelText:'Email (optionnel)'), onSaved: (v)=>email=v!),
        TextFormField(decoration: InputDecoration(labelText:'Mot de passe'), obscureText:true, onSaved:(v)=>pass=v!),
        SizedBox(height:12),
        ElevatedButton(child: Text('S\'inscrire'), onPressed: () async {
          _form.currentState?.save();
          final payload = {
            'first_name': fname, 'last_name': lname, 'phone': phone, 'email': email, 'password': pass,
          };
          final ok = await Provider.of<AuthService>(context, listen:false).register(payload);
          if (ok) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Inscription réussie. Vérifiez SMS/Email.')));
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur inscription')));
          }
        })
      ]))),
    );
  }
}
