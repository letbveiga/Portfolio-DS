class Amigo{
  int _idade = 0;
  bool? _melhor;
  String _nome = '';
  
  int get idade => _idade;
  set idade(int novoIdade) => _idade = novoIdade;
  
  bool? get melhor => _melhor;
  set melhor(bool? novoMelhor) => _melhor = novoMelhor;
  
  String get nome => _nome;
  set nome(String novoNome) => _nome = novoNome;
}

void main(){
  var amigo = Amigo();
  
  amigo.nome = 'José';
  amigo.melhor = false;
  amigo.idade = 12;
  
  print("O nome de meu amigo é: ${amigo.nome}");
  print("Sua idade é: ${amigo._idade}");
  print("Ele é meu melhor amigo: ${amigo.melhor}");
}