import 'package:flutter/material.dart';

class InterfaceApp extends StatefulWidget {
  const InterfaceApp({super.key});

  @override
  State<InterfaceApp> createState() => _InterfaceAppState();
}

class _InterfaceAppState extends State<InterfaceApp> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  var resultado = '';

  void _calcular() {
    _controllerAlcool.text;
    _controllerGasolina.text;

    double precoAlcool = double.parse(_controllerAlcool.text);
    double precoGasolina = double.parse(_controllerGasolina.text);
    double calculo = (precoAlcool / precoGasolina);
    print('calculo: $calculo');

    if (calculo < 0.7) {
      setState(() {
        resultado = 'Use álcool!';
      });
    } else if (calculo >= 0.7) {
      setState(() {
        resultado = 'Use gasolina!';
      });
    } else {
      resultado = 'Utilize um valor valido';
    }

    //_limpaCampos();
  }

  void _limpaCampos() {
    _controllerAlcool.text = '';
    _controllerGasolina.text = '';
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Álcool ou Gasolina",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset(
                  'assets/logo.png',
                  alignment: Alignment.center,
                )),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saiba qual a melhor opção para abastecimento do seu carro",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Preço Alcool, ex 3.59"),
              style: TextStyle(fontSize: 22),
              controller: _controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Preço Gasolina, ex 5.70"),
              style: TextStyle(fontSize: 22),
              controller: _controllerGasolina,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: _calcular,
                child: Text(
                  'Calcular',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: Size.infinite,
                    shape: LinearBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                resultado,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      )),
    );
  }
}
