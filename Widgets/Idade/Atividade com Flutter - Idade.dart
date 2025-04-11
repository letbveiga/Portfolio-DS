import 'package:flutter/material.dart';

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
        body: CalculadoraIdade(),
      ),
    );
  }
}

class CalculadoraIdade extends StatefulWidget {
  @override
  _CalculadoraIdadeState createState() => _CalculadoraIdadeState();
}

class _CalculadoraIdadeState extends State<CalculadoraIdade> {
  final TextEditingController _a = TextEditingController();

  String _resultado = '';

  void idade() {
    final int? a = int.tryParse(_a.text);

    if (a != null) {
      int anoAtual = DateTime.now().year;
      // Converter HORA em MINUTO usando return
      final int idade = anoAtual - a;

      setState(() {
        _resultado = 'Quem nasceu em $a possui/fará $idade anos em $anoAtual';
      });
    } else {
      setState(() {
        _resultado = 'Por favor, insira números válidos.';
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
          Text('Calculadora de Idade', style: TextStyle(fontSize: 35)),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150, // Largura fixa para o primeiro campo
                child: TextField(
                  controller: _a,
                  decoration: InputDecoration(labelText: 'Ano de Nascimento'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.teal),
              ),
              onPressed: idade,
              child: Text(
                ' Calcular ',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),

          SizedBox(height: 20),
          Text(_resultado, style: TextStyle(fontSize: 15, color: Colors.teal)),
        ],
      ),
    );
  }
}