class Categoria {
  
  int _idCategoria;
  String _nome;

  Categoria(this._nome, this._idCategoria);

  String getNome(){
    return _nome;
  }

  setNome(String nome){
    _nome = nome;
  }

  int getIdCategoria(){
    return _idCategoria;
  }

  setIdCategoria(int idCategoria){
    _idCategoria = _idCategoria;
  }

}

