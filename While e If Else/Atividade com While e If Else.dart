class ProducaoMilkshake {
  double _vl=0, _vc=0, _gp=0, _fvl=0, _fvc=0, _fgp=0;
  int _qmg=0, _qmp=0;
  
  // Getter e Setter para o VOLUME DE LEITE
  double get vl => _vl;
  set vl(double vlNovo) => _vl = vlNovo;
  
  // Getter e Setter para o VOLUME DE CALDA
  double get vc => _vc;
  set vc(double vcNovo) => _vc = vcNovo;
  
  // Getter e Setter para o PESO DE CHOCOLATE EM PÓ
  double get gp => _gp;
  set gp(double gpNovo) => _gp = gpNovo;
  
  // Getter para o VOLUME QUE FALTA DE LEITE
  double get fvl => _fvl;
  
  // Getter para o VOLUME QUE FALTA DE CALDA
  double get fvc => _fvc;
  
  // Getter para o PESO QUE FALTA DE CHOCOLATE EM PÓ
  double get fgp => _fgp;
  
  // Getter para a QUANTIDADE DE MILKSHAKE GRANDE
  int get qmg => _qmg;
  
  // Getter para a QUANTIDADE DE MILKSHAKE PEQUENO
  int get qmp => _qmp;
  
  
  // Método para a PRODUÇÂO DE MILKSHAKE GRANDE
  void calculoMilkG(int quantidade){
    var totLeiteNecessario = 0.5 * quantidade;
    var totCaldaNecessario = 0.08 * quantidade;
    var totChocPoNecessario = 45 * quantidade;
    while (this._vl >= 0.5 && this._vc >= 0.08 && this._gp >= 45 && quantidade > 0){
      totLeiteNecessario -= 0.5;
      totCaldaNecessario -= 0.08;
      totChocPoNecessario -= 45;
      quantidade -= 1;
      this._vl -= 0.5;
      this._vc -= 0.08;
      this._gp -= 45;
      this._qmg += 1;
    }
    if (totLeiteNecessario > 0){
      this._fvl += totLeiteNecessario;
    }
    if (totCaldaNecessario > 0){
      this._fvc += totCaldaNecessario;
    }
    if (totChocPoNecessario > 0){
      this._fgp += totChocPoNecessario;
    }
   }
  
  // Método para a PRODUÇÂO DE MILKSHAKE PEQUENO
  void calculoMilkP(int quantidade){
    var totLeiteNecessario = 0.3 * quantidade;
    var totCaldaNecessario = 0.03 * quantidade;
    var totChocPoNecessario = 20 * quantidade;
    while (this._vl >= 0.3 && this._vc >= 0.03 && this._gp >= 20 && quantidade > 0){
      totLeiteNecessario -= 0.3;
      totCaldaNecessario -= 0.03;
      totChocPoNecessario -= 20;
      quantidade -= 1;
      this._vl -= 0.3;
      this._vc -= 0.03;
      this._gp -= 20;
      this._qmp += 1;
    } 
    if (totLeiteNecessario > 0){
      this._fvl += totLeiteNecessario;
    }
    if (totCaldaNecessario > 0){
      this._fvc += totCaldaNecessario;
    }
    if (totChocPoNecessario > 0){
      this._fgp += totChocPoNecessario;
    }
   }
  
  // Método para a PRODUÇÃO DA MENSSAGEM
  String mensagem(){
    var texto = "Não conseguimos produzir nenhum milkshake";
    this._fvl -= this._vl;
    this._fvc -= this._vc;
    this._fgp -= this._gp;
    if (this._qmg > 0 && this._qmp > 0){
      texto = "Foram produzidos ${this._qmg} milkshakes grandes e ${this._qmp} milkshakes pequenos";
    }
    else if(this._qmp > 0){
      texto = "Foram produzidos ${this._qmp} milkshakes pequenos";
    }
    else if(this._qmg > 0){
      texto = "Foram produzidos ${this._qmg} milkshakes grandes";
    }
    
    if (this._fvl > 0 && this._fvc > 0 && this._fgp > 0){
      return ("${texto}, faltam ${this._fvl} litros de leite, ${this._fvc} litros de calda e ${this._fgp} gramas de chocolate em pó para produzir seu(s) milkshake(s).");
    }
    else if (this._fvl > 0 && this._fvc > 0){
      return ("${texto}, faltam ${this._fvl} litros de leite e ${this._fvc} litros de calda para produzir seu(s) milkshake(s).");
    }
    else if (this._fvl > 0 && this._fgp > 0){
      return ("${texto}, faltam ${this._fvl} litros de leite e ${this._fgp} gramas de chocolate em pó para produzir seu(s) milkshake(s).");
    }
    else if (this._fvc > 0 && this._fgp > 0){
      return ("${texto}, faltam ${this._fvc} litros de calda e ${this._fgp} gramas de chocolate em pó para produzir seu(s) milkshake(s).");
    }
    else if (this._fvc > 0){
      return ("${texto}, faltam ${this._fvc} litros de calda para produzir seu(s) milkshake(s).");
    }
    else if (this._fvl > 0){
      return ("${texto}, faltam ${this._fvl} litros de leite para produzir seu(s) milkshake(s).");
    }
    else if (this._fgp > 0){
      return ("${texto}, faltam ${this._fgp} gramas de chocolate em pó para produzir seu(s) milkshake(s).");
    }
    return texto += ".";
  }
}

void main(){
  var producaoMilkshake = ProducaoMilkshake();
  producaoMilkshake.vl = 1;
  producaoMilkshake.vc = 3;
  producaoMilkshake.gp = 100;
  
  producaoMilkshake.calculoMilkG(2);
  producaoMilkshake.calculoMilkP(10);
   producaoMilkshake.calculoMilkG(3);
  print(producaoMilkshake.mensagem());
}