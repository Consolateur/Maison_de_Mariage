import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import 'register_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _loading = false;

  @override Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text('Maison de Mariage')),
      body: Padding(padding: EdgeInsets.all(16), child: Column(children: [
        TextField(controller: _emailCtrl, decoration: InputDecoration(labelText: 'Email ou Téléphone')),
        TextField(controller: _passCtrl, decoration: InputDecoration(labelText: 'Mot de passe'), obscureText: true),
        SizedBox(height: 16),
        ElevatedButton(child: _loading? CircularProgressIndicator(color: Colors.white) : Text('Se connecter'),
          onPressed: _loading? null : () async {
            setState((){_loading=true;});
            final ok = await Provider.of<AuthService>(context, listen:false).login(_emailCtrl.text.trim(), _passCtrl.text.trim());
            setState((){_loading=false;});
            if (ok) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
            else ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Échec connexion')));
          }),
        TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterScreen())), child: Text('Créer un compte'))
      ])),
    );
  }
}
