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
        body: ValorCompra(),
      ),
    );
  }
}

class ValorCompra extends StatefulWidget {
  @override
  _ValorCompraState createState() => _ValorCompraState();
}

class _ValorCompraState extends State<ValorCompra> {
  final TextEditingController _valor = TextEditingController();
  final TextEditingController _quantidade = TextEditingController();

  String _resultado = '';
  void compra() {
    final double? valor = double.tryParse(_valor.text);
    final double? quantidade = double.tryParse(_quantidade.text);

    if (valor != null && quantidade != null) {
      final double total = valor * quantidade;

      setState(() {
        _resultado = 'Total da compra: R\$${total.toStringAsFixed(2)}';
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
          Text('Valor Final da Compra', style: TextStyle(fontSize: 35)),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150, // Largura fixa para o primeiro campo
                child: TextField(
                  controller: _valor,
                  decoration: InputDecoration(labelText: 'Preço'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              SizedBox(width: 20),
              SizedBox(
                width: 150, // Largura fixa para o primeiro campo
                child: TextField(
                  controller: _quantidade,
                  decoration: InputDecoration(labelText: 'Quantidade'),
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
              onPressed: compra,
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