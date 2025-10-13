import 'package:api/categoria.dart';

class Pergunta {
  String _questao;
  List<String> _respostas;
  String _respostaCorreta;
  List<Categoria> _categorias;


  Pergunta(this._questao, this._respostas, this._respostaCorreta, this._categorias);

  String getQuestao(){
    return _questao;
  }

  setQuestao(String questao){
    _questao = questao;
  }

  List<String> getRespostas(List<String> respostas){
    return _respostas;
  }

  setRespostas(List<String> respostas){
    _respostas = respostas;
  }

  List<Categoria> getCategorias(){
    return _categorias;
  }

  setCategorias(List<Categoria> categorias){
    _categorias = categorias;
  }

  String getRespostaCorreta(){
    return _respostaCorreta;
  }

  setRespostaCorreta(String respostaCorreta){
    _respostaCorreta = respostaCorreta;
  }

  bool verificaResposta(String resposta){
    if(resposta != getRespostaCorreta()){
      return false;
    }
    return true;
  }
}