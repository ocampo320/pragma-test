import 'dart:convert';

import 'package:prueba_pragma/core/domain/models/beeds.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_pragma/core/failures/common_failure.dart';

class PestInfoServices {
  static Future<List<Breeds>> getInfoPet() async {
    List<Breeds> lista = [];
    http.Response petResponse =
        await http.get(Uri.parse('https://api.thecatapi.com/v1/breeds'));

    if (petResponse.statusCode == 200) {
      var jsonData = json.decode(petResponse.body);
      jsonData
          .map((movie) => Breeds.fromJson(movie))
          .toList()
          .forEach((element) {
        lista.add(element);
      });
      return lista;
    } else {
      throw CommonFailure;
    }
  }

  static Future<String> getImage(String codeImage) async {
    http.Response petResponse = await http
        .get(Uri.parse('https://api.thecatapi.com/v1/images/$codeImage'));
    if (petResponse.statusCode == 200) {
      var jsonData = json.decode(petResponse.body);

      return jsonData["url"];
    } else {
      throw CommonFailure;
    }
  }
}
