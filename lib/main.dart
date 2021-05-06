import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
        appBar: AppBar(
          title: Text("Nova transferência"),
        ),
        body: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                  icon: Icon(Icons.account_balance),
                  labelText: "Banco",
                  hintText: "000"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                  icon: Icon(Icons.business),
                  labelText: "Agência",
                  hintText: "0000"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                  icon: Icon(Icons.account_box_rounded),
                  labelText: "Conta corrente",
                  hintText: "00000"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 24,
                ),
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: "Valor",
                  hintText: "0,00",
                )),
          ),
          ElevatedButton(
            child: Text("Efetuar transferência"),
          ),
        ]));
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferências"),
      ),
      body: Column(
        children: [
          ItemTransferencia(Transferencia(100.9, "123-6")),
          ItemTransferencia(Transferencia(200.8, "456-5")),
          ItemTransferencia(Transferencia(300.7, "789-4")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.compare_arrows),
        title: Text("R\$ " + _transferencia.valor.toStringAsFixed(2)),
        subtitle: Text("Conta: " + _transferencia.conta),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final String conta;

  Transferencia(this.valor, this.conta);
}
