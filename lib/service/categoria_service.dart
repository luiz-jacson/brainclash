import 'dart:convert';
import 'dart:math';
import 'package:brainclash/api.key.dart';
import 'package:brainclash/api_config/api_config.dart';
import 'package:brainclash/models/categoria.dart';
import 'package:http/http.dart';

class CategoriaService {
  final Map<String, String> _headers = {
    "Authorization": "Bearer ${gitHubApiKey}",
  };

  int gerarNumeroAleatorio(int maximo){
    final random = Random();
    return random.nextInt(maximo);
  }

  Future<Categoria> getCategoriaAleatoria() async {
    Response response = await get(
      Uri.parse(ApiConfig.getUrlCategorias()),
      headers: _headers,
    );
    Map<String, dynamic> mapResponse = json.decode(response.body);
    List<dynamic> listaCategorias =
        json.decode(mapResponse["files"]["categorias.json"]["content"]);
    List<Categoria> listRandom = [];
    for(Map<String, dynamic> categoria in listaCategorias){
      Categoria categoriaObj = Categoria(categoria["nome"], categoria["idCategoria"]);
       listRandom.add(categoriaObj);
    }
    int num = gerarNumeroAleatorio(listRandom.length);
    print("${listRandom[num].getIdCategoria()} , ${listRandom[num].getNome()}");
    return (listRandom[num]);
    
  }
}
