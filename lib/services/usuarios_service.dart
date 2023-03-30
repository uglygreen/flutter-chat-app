import 'package:chat/global/enviroment.dart';
import 'package:chat/models/usuario.dart';
import 'package:chat/models/usuarios_response.dart';
import 'package:chat/services/auth_service.dart';
import 'package:http/http.dart' as http;

class UsuariosService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final token = await AuthService.getToken();

      if (token != null) {
        var url = Uri.parse('${Enviroment.apiUrl}/usuarios');

        final resp = await http.get(url,
            headers: {'Content-Type': 'application/json', 'x-token': token});

        final usuariosResponse = usuariosResponseFromJson(resp.body);

        return usuariosResponse.usuarios;
      } else {
        var url = Uri.parse('${Enviroment.apiUrl}/usuarios');

        final resp = await http.get(url);

        final usuariosResponse = usuariosResponseFromJson(resp.body);

        return usuariosResponse.usuarios;
      }
    } catch (e) {
      return [];
    }
  }
}
