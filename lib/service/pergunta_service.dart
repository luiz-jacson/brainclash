import 'dart:convert';
import 'dart:math';
import 'package:brainclash/api.key.dart';
import 'package:brainclash/api_config/api_config.dart';
import 'package:brainclash/models/categoria.dart';
import 'package:http/http.dart';

class PerguntaService {

  final Map<String, String> _headers = {
    "Authorization": "Bearer ${gitHubApiKey}",
  };

  int gerarNumeroAleatorio(int maximo){
    final random = Random();
    return random.nextInt(maximo);
  }


}