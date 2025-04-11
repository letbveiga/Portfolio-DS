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
        body: CalculoSalario(),
      ),
    );
  }
}

class CalculoSalario extends StatefulWidget {
  @override
  _CalculoSalarioState createState() => _CalculoSalarioState();
}

class _CalculoSalarioState extends State<CalculoSalario> {
  final TextEditingController _valorSalario = TextEditingController();
  final TextEditingController _horaExtra = TextEditingController();
  final TextEditingController _horaFalta = TextEditingController();

  String _resultado = '';

  void salario() {
    final double? valorSalario = double.tryParse(_valorSalario.text);
    final double? horaExtra = double.tryParse(_horaExtra.text);
    final double? horaFalta = double.tryParse(_horaFalta.text);

    if (horaExtra != null && horaFalta != null && valorSalario != null) {
      final double valorHora = valorSalario / 240;
      final double valorHoraExtra = valorHora * 1.5;

      setState(() {
        _resultado =
            'Salário Líquido: R\$${(valorSalario + valorHoraExtra * horaExtra - valorHora * horaFalta).toStringAsFixed(2)}\nSalário Bruto: R\$${valorSalario.toStringAsFixed(2)}\nAcréscimos: R\$${(valorHoraExtra * horaExtra).toStringAsFixed(2)}\nDescontos: R\$${(valorHora * horaFalta).toStringAsFixed(2)}';
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
          Text('Calculadora de Holerite', style: TextStyle(fontSize: 35)),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120, // Largura fixa para o primeiro campo
                child: TextField(
                  controller: _valorSalario,
                  decoration: InputDecoration(labelText: 'Salário Bruto'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              SizedBox(width: 20),
              SizedBox(
                width: 120, // Largura fixa para o primeiro campo
                child: TextField(
                  controller: _horaExtra,
                  decoration: InputDecoration(labelText: 'Horas Extras'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              SizedBox(width: 20),
              SizedBox(
                width: 120, // Largura fixa para o primeiro campo
                child: TextField(
                  controller: _horaFalta,
                  decoration: InputDecoration(labelText: 'Horas Faltadas'),
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
              onPressed: salario,
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