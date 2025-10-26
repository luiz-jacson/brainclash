import 'package:brainclash/models/categoria.dart';
import 'package:brainclash/screens/menu.dart';
import 'package:brainclash/service/categoria_service.dart';
import 'package:brainclash/service/pergunta_service.dart';

void main() async{
  //menu();
  PerguntaService perguntaService = PerguntaService();
  perguntaService.gerarPerguntaGemini(Categoria("Ciências", 1)); 
}
