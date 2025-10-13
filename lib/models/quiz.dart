import 'package:api/categoria.dart';
import 'package:api/pergunta.dart';

class Quiz {
  int acertos = 0;
  final List<Categoria> _categorias;
  final List<Pergunta> _perguntas;

  Quiz(this._categorias, this._perguntas);


  inicializaQuiz(){
    for(int i = 0; i < numeroPerguntas(); i++){

    }
  }

  numeroPerguntas(){
    return _perguntas.length;
  }

}
