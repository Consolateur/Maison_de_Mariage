import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'services/auth_service.dart';
import 'services/socket_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaisonApp());
}

class MaisonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        Provider(create: (_) => SocketService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Maison de Mariage',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: Consumer<AuthService>(
          builder: (ctx, auth, _) {
            if (auth.isLoggedIn) return HomeScreen();
            return LoginScreen();
          },
        ),
      ),
    );
  }
}
