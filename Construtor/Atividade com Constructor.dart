class AnimalRotina{
  int frequenciaBanho=0, frequenciaExame=0, frequenciaVacina=0;
  String nomeAnimal="";
  
  AnimalRotina(this.frequenciaBanho, this.frequenciaExame, this.frequenciaVacina, this.nomeAnimal);
  
  void proximoBanho(dd, mm, aaaa){
    var dataBanho = DateTime(aaaa, mm, dd + this.frequenciaBanho);
    var dataHoje = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    if (dataBanho.compareTo(dataHoje) < 0){
      print("$nomeAnimal deveria ter tomado banho na data ${dataBanho.day}/${dataBanho.month}/${dataBanho.year}.");
    }
    else if(dataBanho.compareTo(dataHoje) == 0){
      print("$nomeAnimal deverá tomar banho hoje!");
    }
    else{
      print("$nomeAnimal deverá tomar banho na data ${dataBanho.day}/${dataBanho.month}/${dataBanho.year}.");
    }
  }
  
  void proximoExame(dd, mm, aaaa){
    var dataExame = DateTime(aaaa, mm, dd + this.frequenciaExame);
    var dataHoje = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    if (dataExame.compareTo(dataHoje) < 0){
      print("$nomeAnimal deveria ter feito exame na data ${dataExame.day}/${dataExame.month}/${dataExame.year}.");
    }
    else if(dataExame.compareTo(dataHoje) == 0){
      print("$nomeAnimal deverá fazer exame hoje!");
    }
    else{
      print("$nomeAnimal deverá fazer exame na data ${dataExame.day}/${dataExame.month}/${dataExame.year}.");
    }
  }
  
  void proximaVacina(dd, mm, aaaa){
    var dataVacina = DateTime(aaaa, mm, dd + this.frequenciaVacina);
    var dataHoje = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    if (dataVacina.compareTo(dataHoje) < 0){
      print("$nomeAnimal deveria ter tomado vacina na data ${dataVacina.day}/${dataVacina.month}/${dataVacina.year}.");
    }
    else if(dataVacina.compareTo(dataHoje) == 0){
      print("$nomeAnimal deverá tomar vacina hoje!");
    }
    else{
      print("$nomeAnimal deverá tomar vacina na data ${dataVacina.day}/${dataVacina.month}/${dataVacina.year}.");
    }
  }
}

void main(){
  var animal = AnimalRotina(20, 90, 360, "Fifi");
  animal.proximoBanho(21,2,2025);
  animal.proximoExame(11,1,2025);
  animal.proximaVacina(12,4,2023);
}