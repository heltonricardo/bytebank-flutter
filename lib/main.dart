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
  final TextEditingController _controllerBanco = TextEditingController();
  final TextEditingController _controllerAgencia = TextEditingController();
  final TextEditingController _controllerConta = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();

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
              controller: _controllerBanco,
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
              controller: _controllerAgencia,
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
              controller: _controllerConta,
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
                controller: _controllerValor,
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
            onPressed: () {
              final int banco = int.tryParse(_controllerBanco.text);
              final int agencia = int.tryParse(_controllerAgencia.text);
              final int conta = int.tryParse(_controllerConta.text);
              final double valor = double.tryParse(_controllerValor.text);

              if (banco != null && agencia != null && conta != null &&
                  valor != null) {
                final transfer = Transferencia(banco, agencia, conta, valor);
              debugPrint("$transfer");
              }

            },
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
          ItemTransferencia(Transferencia(1, 1, 1236, 100.9)),
          ItemTransferencia(Transferencia(1, 1, 4565, 200.8)),
          ItemTransferencia(Transferencia(1, 1, 7894, 300.7)),
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
        subtitle: Text(
            "Agência $_transferencia.agencia Conta: $_transferencia.conta"),
      ),
    );
  }
}

class Transferencia {
  final int banco;
  final int agencia;
  final int conta;
  final double valor;

  Transferencia(this.banco, this.agencia, this.conta, this.valor);

  @override
  String toString() {
    return "$banco $agencia $conta $valor}";
  }
}
