import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Monedas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple),
      ),
      home: CurrencyConverter(),
    );
  }
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double pesos = 0.0;
  double reales = 0.0;
  double dollars = 0.0;
  double euros = 0.0;

  // Tasas de cambio reales
  double copToUsdRate = 0.00024;
  double copToEurRate = 0.00023;
  double copToBrlRate = 0.0012;

  void convertCurrency() {
    setState(() {
      dollars = pesos * copToUsdRate;
      euros = pesos * copToEurRate;
      reales = pesos * copToBrlRate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de Monedas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) {
                pesos = double.tryParse(value) ?? 0.0;
              },
              decoration: InputDecoration(labelText: 'Peso Colombiano'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertCurrency,
              child: Text('Convertir'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Dólares',
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0)),
                    Text(
                      '\$${dollars.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Euros',
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0)),
                    Text(
                      '€${euros.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Reales',
                        style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0)),
                    Text(
                      'R\$${reales.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.black, fontSize: 15.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
