import 'dart:convert';
import 'dart:math';
import 'package:brainclash/api.key.dart';
import 'package:brainclash/api_config/api_config.dart';
import 'package:brainclash/models/categoria.dart';
import 'package:brainclash/models/pergunta.dart';
import 'package:http/http.dart';

class PerguntaService {
  final Map<String, String> _headers = {
    "Authorization": "Bearer ${gitHubApiKey}",
  };

  int gerarNumeroAleatorio(int maximo) {
    final random = Random();
    return random.nextInt(maximo);
  }

  Future<Pergunta> getPerguntabyCategoria(Categoria categoria) async {
    Response response = await get(
      Uri.parse(ApiConfig.getUrlPerguntas()),
      headers: _headers,
    );
    Map<String, dynamic> mapResponse = json.decode(response.body);
    List<dynamic> listaPerguntas = json.decode(mapResponse["files"]["perguntas.json"]["content"]);
    List<Pergunta> listRandom = [];
    for (Map<String, dynamic> pergunta in listaPerguntas) {
      if (pergunta["idCategoria"] == categoria.getIdCategoria()) {
        Pergunta perguntaObj = Pergunta(
          pergunta["idPergunta"],
          pergunta["questao"],
          List<String>.from(pergunta["respostas"]),
          pergunta["respostaCorreta"],
          pergunta["idCategoria"],
        );
        listRandom.add(perguntaObj);
      }
    }
    int num = gerarNumeroAleatorio(listRandom.length);
    return (listRandom[num]);
  }
}
