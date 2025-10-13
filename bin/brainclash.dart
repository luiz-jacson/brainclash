
import 'package:brainclash/models/categoria.dart';
import 'package:brainclash/models/pergunta.dart';
import 'package:brainclash/service/categoria_service.dart';
import 'package:brainclash/service/pergunta_service.dart';
void main() async{
  CategoriaService categoriaService = CategoriaService();
  PerguntaService perguntaService = PerguntaService();
  Categoria categoria = await categoriaService.getCategoriaAleatoria();
  Pergunta pergunta = await perguntaService.getPerguntabyCategoria(categoria);
  
}
