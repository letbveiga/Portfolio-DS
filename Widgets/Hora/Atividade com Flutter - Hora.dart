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
        body: ConvertorHora(),
      ),
    );
  }
}

class ConvertorHora extends StatefulWidget {
  @override
  _ConvertorHoraState createState() => _ConvertorHoraState();
}

class _ConvertorHoraState extends State<ConvertorHora> {
  final TextEditingController _h = TextEditingController();

  String _resultado = '';

  void hora() {
    final double? h = double.tryParse(_h.text);

    if (h != null) {
      // Converter HORA em MINUTO usando return
      final double resultadoMin = h * 60;
      // Converter HORA em SEGUNDO usando atributo
      final double resultadoSeg = h * 3600;

      setState(() {
        _resultado =
            '$h Horas em Minutos: $resultadoMin minutos\n$h Horas em Segundos: $resultadoSeg segundos';
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
          Text('Convertor de Horas', style: TextStyle(fontSize: 35)),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150, // Largura fixa para o primeiro campo
                child: TextField(
                  controller: _h,
                  decoration: InputDecoration(labelText: 'Hora'),
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
              onPressed: hora,
              child: Text(
                ' Converter ',
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