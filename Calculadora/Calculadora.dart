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
        appBar: AppBar(
          title: Text(
            'Lucas Martins e Letícia Veiga',
            style: TextStyle(fontSize: 10),
          ),
        ),
        body: SomadorForm(),
      ),
    );
  }
}

class SomadorForm extends StatefulWidget {
  @override
  _SomadorFormState createState() => _SomadorFormState();
}

class _SomadorFormState extends State<SomadorForm> {
  final TextEditingController _numero1 = TextEditingController();
  final TextEditingController _numero2 = TextEditingController();

  String _resultado = '';

  void _somar() {
    final double? numero1 = double.tryParse(_numero1.text);
    final double? numero2 = double.tryParse(_numero2.text);

    if (numero1 != null && numero2 != null) {
      final double soma = numero1 + numero2;

      setState(() {
        _resultado = 'Resultado: $soma';
      });
    } else {
      setState(() {
        _resultado = 'Por favor, insira números válidos.';
      });
    }
  }

  void _subtrair() {
    final double? numero1 = double.tryParse(_numero1.text);
    final double? numero2 = double.tryParse(_numero2.text);

    if (numero1 != null && numero2 != null) {
      final double subtracao = numero1 - numero2;

      setState(() {
        _resultado = 'Resultado: $subtracao';
      });
    } else {
      setState(() {
        _resultado = 'Por favor, insira números válidos.';
      });
    }
  }

  void _multiplicar() {
    final double? numero1 = double.tryParse(_numero1.text);
    final double? numero2 = double.tryParse(_numero2.text);

    if (numero1 != null && numero2 != null) {
      final double multiplicacao = numero1 * numero2;

      setState(() {
        _resultado = 'Resultado: $multiplicacao';
      });
    } else {
      setState(() {
        _resultado = 'Por favor, insira números válidos.';
      });
    }
  }

  void _dividir() {
    final double? numero1 = double.tryParse(_numero1.text);
    final double? numero2 = double.tryParse(_numero2.text);

    if (numero1 != null && numero2 != null && numero2 != 0) {
      final double divisao = numero1 / numero2;

      setState(() {
        _resultado = 'Resultado: $divisao';
      });
    } else {
      setState(() {
        if (numero2 == 0) {
          _resultado = 'O segundo número não pode ser 0.';
        } else {
          _resultado = 'Por favor, insira números válidos.';
        }
      });
    }
  }

  void _potenciar() {
    final double? numero1 = double.tryParse(_numero1.text);
    final double? numero2 = double.tryParse(_numero2.text);

    if (numero1 != null && numero2 != null) {
      final num potenciacao = pow(numero1, numero2);

      setState(() {
        _resultado = 'Resultado: $potenciacao';
      });
    } else {
      setState(() {
        _resultado = 'Por favor, insira números válidos.';
      });
    }
  }

  void _radiciar() {
    final double? numero1 = double.tryParse(_numero1.text);
    final double? numero2 = double.tryParse(_numero2.text);

    if (numero1 != null && numero2 != null && numero2 != 0) {
      final num radiciacao = pow(numero1, 1 / numero2);

      setState(() {
        _resultado = 'Resultado: $radiciacao';
      });
    } else {
      setState(() {
        if (numero2 == 0) {
          _resultado = 'O segundo número não pode ser 0.';
        } else {
          _resultado = 'Por favor, insira números válidos.';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Calculadora', style: TextStyle(fontSize: 35)),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150, // Largura fixa para o primeiro campo
                child: TextField(
                  controller: _numero1,
                  decoration: InputDecoration(labelText: 'Número 1'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              SizedBox(width: 20),
              SizedBox(
                width: 150, // Largura fixa para o segundo campo
                child: TextField(
                  controller: _numero2,
                  decoration: InputDecoration(labelText: 'Número 2'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.teal),
                  ),
                  onPressed: _somar,
                  child: Text(
                    ' Somar ',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.teal),
                  ),
                  onPressed: _multiplicar,
                  child: Text(
                    'Multiplicar',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.teal),
                  ),
                  onPressed: _potenciar,
                  child: Text(
                    'Potenciar',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.teal),
                  ),
                  onPressed: _subtrair,
                  child: Text(
                    'Subtrair',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.teal),
                  ),
                  onPressed: _dividir,
                  child: Text(
                    '    Dividir    ',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.teal),
                  ),
                  onPressed: _radiciar,
                  child: Text(
                    ' Radiciar ',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(_resultado, style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}