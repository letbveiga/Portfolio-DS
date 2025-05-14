import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'Comportamentos Animal',
            style: TextStyle(color: Colors.white70),
          ),
        ),
        body: ComportamentosAnimal(),
      ),
    );
  }
}

class ComportamentosAnimal extends StatefulWidget {
  @override
  _ComportamentosAnimalState createState() => _ComportamentosAnimalState();
}

class _ComportamentosAnimalState extends State<ComportamentosAnimal> {
  bool botaoTubarao = true;
  bool botaoAranha = true;
  String texto = '';
  String imagem =
      'https://c8.alamy.com/comp/2M91T7E/animals-text-written-on-yellow-black-round-stamp-sign-2M91T7E.jpg';
  int botaoSelecionado = 0;

  void _aranha() {
    setState(() {
      botaoAranha = false;
      imagem =
          'https://cdn1.iconfinder.com/data/icons/halloween-flat-square-rounded-vol-3/150/spider__bug__insect__tarantula-512.png';
    });
  }

  void _tubarao() {
    setState(() {
      botaoTubarao = false;
      imagem = 'https://cdn-icons-png.flaticon.com/256/3068/3068031.png';
    });
  }

  void _nadar() {
    Tubarao tubarao = Tubarao();
    setState(() {
      texto = tubarao.nadar();
      botaoSelecionado = 1;
    });
  }

  void _morderTubarao() {
    Tubarao tubarao = Tubarao();
    setState(() {
      texto = tubarao.morder();
      botaoSelecionado = 3;
    });
  }

  void _tecer() {
    Aranha aranha = Aranha();
    setState(() {
      texto = aranha.tecer();
      botaoSelecionado = 1;
    });
  }

  void _morderAranha() {
    Aranha aranha = Aranha();
    setState(() {
      texto = aranha.morder();
      botaoSelecionado = 3;
    });
  }

  void _animalTubarao() {
    Tubarao tubarao = Tubarao();
    setState(() {
      texto = tubarao.comer() + '\n' + tubarao.respirar();
      botaoSelecionado = 2;
    });
  }

  void _animalAranha() {
    Aranha aranha = Aranha();
    setState(() {
      texto = aranha.comer() + '\n' + aranha.respirar();
      botaoSelecionado = 2;
    });
  }

  void _voltar() {
    setState(() {
      botaoTubarao = true;
      botaoAranha = true;
      texto = '';
      imagem =
          'https://c8.alamy.com/comp/2M91T7E/animals-text-written-on-yellow-black-round-stamp-sign-2M91T7E.jpg';
      botaoSelecionado = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(color: Colors.orange[100]!, width: 3.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image.network(imagem, fit: BoxFit.contain),
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:
                botaoTubarao && botaoAranha
                    ? [
                      ElevatedButton(
                        onPressed: _tubarao,
                        child: Text('Tubarão'),
                      ),
                      ElevatedButton(onPressed: _aranha, child: Text('Aranha')),
                    ]
                    : botaoTubarao == false
                    ? [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: botaoSelecionado == 1
                              ? Colors.purple[500]
                              : null,
                          foregroundColor: botaoSelecionado == 1
                              ? Colors.white
                              : null,
                        ),
                        onPressed: _nadar,
                        child: Text('Nadar'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: botaoSelecionado == 2
                              ? Colors.purple[500]
                              : null,
                          foregroundColor: botaoSelecionado == 2
                              ? Colors.white
                              : null,
                        ),
                        onPressed: _animalTubarao,
                        child: Text('ser animal'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: botaoSelecionado == 3
                              ? Colors.purple[500]
                              : null,
                          foregroundColor: botaoSelecionado == 3
                              ? Colors.white
                              : null,
                        ),
                        onPressed: _morderTubarao,
                        child: Text('Morder'),
                      ),
                    ]
                    : [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: botaoSelecionado == 1
                              ? Colors.purple[500]
                              : null,
                          foregroundColor: botaoSelecionado == 1
                              ? Colors.white
                              : null,
                        ),
                        onPressed: _tecer,
                        child: Text('Tecer'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: botaoSelecionado == 2
                              ? Colors.purple[500]
                              : null,
                          foregroundColor: botaoSelecionado == 2
                              ? Colors.white
                              : null,
                        ),
                        onPressed: _animalAranha,
                        child: Text('ser animal'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: botaoSelecionado == 3
                              ? Colors.purple[500]
                              : null,
                          foregroundColor: botaoSelecionado == 3
                              ? Colors.white 
                              : null,
                        ),
                        onPressed: _morderAranha,
                        child: Text('Morder'),
                      ),
                    ],
          ),
          SizedBox(height: 50),
          if (!botaoTubarao || !botaoAranha) ...[
            if (texto.isNotEmpty)
              Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  border: Border.all(color: Colors.orange[100]!, width: 3.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  texto,
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            SizedBox(height: 50),
            ElevatedButton(onPressed: _voltar, child: Text('Voltar')),
          ],
        ],
      ),
    );
  }
}

class Animal {
  String comer() {
    return "Estou comendo";
  }

  String respirar() {
    return "Estou respirando";
  }
}

abstract class Nadar {
  String nadar();
}

abstract class Morder {
  String morder();
}

abstract class Tecer {
  String tecer();
}

class Tubarao extends Animal implements Nadar, Morder {
  @override
  String nadar() {
    return "Estou nadando";
  }

  @override
  String morder() {
    return "Estou mordendo";
  }
}

class Aranha extends Animal implements Tecer, Morder {
  @override
  String tecer() {
    return "Estou tecendo";
  }

  @override
  String morder() {
    return "Estou mordendo";
  }
}