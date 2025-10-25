import 'dart:io';

import 'package:brainclash/models/categoria.dart';
import 'package:brainclash/models/pergunta.dart';
import 'package:brainclash/service/categoria_service.dart';
import 'package:brainclash/service/pergunta_service.dart';

void inicializaQuiz() async {
  List<String> categoriasEscolhidas = [];
  List<String> perguntasFeitas = [];
  int pontuacao = 0;
  for (int i = 0; i < 5; i++) {
    Categoria categoria = await escolheCategoria(categoriasEscolhidas, i);
    categoriasEscolhidas.add(categoria.getNome());
    bool resposta = await quiz(categoria, perguntasFeitas);
    if (resposta) {
      print("Resposta correta :)");
      pontuacao = pontuacao + 1;
    } else {
      print("Resposta errada :(");
    }
  }
  print("Pontuação Final: $pontuacao");
}

Future<bool> quiz(Categoria categoria, List<String> perguntasFeitas) async {
  PerguntaService perguntaService = PerguntaService();
  Pergunta pergunta = await perguntaService.getPerguntabyCategoria(categoria);
  if (perguntasFeitas.contains(pergunta.getQuestao())) {
    return quiz(categoria, perguntasFeitas);
  }
  carregando();
  print(pergunta.getQuestao());
  perguntasFeitas.add(pergunta.getQuestao());
  List<String> respostas = pergunta.getRespostas();
  for (int i = 0; i < 4; i++) {
    print("${i + 1} - ${respostas[i]}");
  }
  var escolha = stdin.readLineSync();
  switch (escolha) {
    case '1':
      return pergunta.verificaResposta(respostas[0]);
    case '2':
      return pergunta.verificaResposta(respostas[1]);
    case '3':
      return pergunta.verificaResposta(respostas[2]);
    case '4':
      return pergunta.verificaResposta(respostas[3]);
    default:
      return quiz(categoria, perguntasFeitas);
  }
}

carregando() {
  print("--------------------------------------------------------");
  print("Carregando...");
  print("--------------------------------------------------------");
}

Future<Categoria> escolheCategoria(
  List<String> categoriasEscolhidas,
  int index,
) async {
  CategoriaService categoriaService = CategoriaService();
  Categoria primeira = await categoriaService.getCategoriaAleatoria();
  Categoria segunda = await categoriaService.getCategoriaAleatoria();
  Categoria terceira = await categoriaService.getCategoriaAleatoria();
  Categoria quarta = await categoriaService.getCategoriaAleatoria();
  if ((categoriasEscolhidas.contains(primeira.getNome()) ||
          categoriasEscolhidas.contains(segunda.getNome()) ||
          categoriasEscolhidas.contains(terceira.getNome()) ||
          categoriasEscolhidas.contains(quarta.getNome())) &&
      (primeira.getNome() == segunda.getNome() ||
          primeira.getNome() == terceira.getNome() ||
          primeira.getNome() == quarta.getNome() ||
          segunda.getNome() == terceira.getNome() ||
          segunda.getNome() == quarta.getNome() ||
          terceira.getNome() == quarta.getNome())) {
    return escolheCategoria(categoriasEscolhidas, index);
  }
  carregando();
  print("Selecione o tema da ${index + 1}ª pergunta!");
  print("1 - ${primeira.getNome()}");
  print("2 - ${segunda.getNome()}");
  print("3 - ${terceira.getNome()}");
  print("4 - ${quarta.getNome()}");
  var escolha = stdin.readLineSync();
  switch (escolha) {
    case '1':
      return primeira;
    case '2':
      return segunda;
    case '3':
      return terceira;
    case '4':
      return quarta;
    default:
      return escolheCategoria(categoriasEscolhidas, index);
  }
}
