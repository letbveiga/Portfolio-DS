class Amigo{
  int _idade = 0, _idadeAmigo = 0;
  bool? _melhor;
  String _nome = '';
  
  int get idade => _idade;
  set idade(int novoIdade) => _idade = novoIdade;
  
  int get idadeAmigo => _idadeAmigo;
  set idadeAmigo(int novoIdadeAmigo) => _idadeAmigo = novoIdadeAmigo;
  
  bool? get melhor => _melhor;
  set melhor(bool? novoMelhor) => _melhor = novoMelhor;
  
  String get nome => _nome;
  set nome(String novoNome) => _nome = novoNome;
  
  String detalhes(){
    return 
      "${this._melhor == true ? 
        "${this._idadeAmigo > this.idade ? 
          "${this._nome} é meu melhor amigo e é mais velho que eu":
          "${this._idadeAmigo < this.idade ? 
            "${this._nome} é meu melhor amigo e é mais novo que eu":
            "${this._nome} é meu melhor amigo e tem a minha idade"}"}":
        "${this._idadeAmigo > this.idade ? 
          "${this._nome} é meu inimigo e é mais velho que eu":
          "${this._idadeAmigo < this.idade ? 
            "${this._nome} é meu inimigo e é mais novo que eu":
            "${this._nome} é meu inimigo e tem a minha idade"}"}"}";
  }
}

void main(){
  var amigo = Amigo();
  
  amigo.nome = 'José';
  amigo.melhor = true;
  amigo.idade = 13;
  amigo.idadeAmigo = 12;
  
  print(amigo.detalhes());
}