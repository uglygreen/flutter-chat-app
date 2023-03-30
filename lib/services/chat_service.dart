import 'package:chat/global/enviroment.dart';
import 'package:chat/models/mensaje.dart';
import 'package:chat/models/mensajes_response.dart';
import 'package:chat/models/usuario.dart';
import 'package:chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatService with ChangeNotifier {
  late Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioID) async {
    try {
      String? token = await AuthService.getToken();

      var url = Uri.parse('${Enviroment.apiUrl}/mensajes/$usuarioID');

      final resp = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'x-token': token.toString()
      });

      final mensajesResp = mensajesResponseFromJson(resp.body);

      return mensajesResp.mensajes;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
