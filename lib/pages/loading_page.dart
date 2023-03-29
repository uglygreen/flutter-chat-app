import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/usuarios_page.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLogingState(context),
        builder: (context, snapshot) {
          return Center(
            child: Text('espere...'),
          );
        },
      ),
    );
  }
}

Future checkLogingState(BuildContext context) async {
  final authService = Provider.of<AuthService>(context, listen: false);

  final autenticando = await authService.isLoggedIn();

  if (autenticando) {
    //TODO: Conectar al socket server
    // Navigator.pushReplacementNamed(context, 'usuarios');
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => UsuariosPage(),
            transitionDuration: Duration(milliseconds: 0)));
  } else {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (_, __, ___) => LoginPage(),
            transitionDuration: Duration(milliseconds: 0)));
  }
}
