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
  final TextEditingController _controladorBanco = TextEditingController();
  final TextEditingController _controladorAgencia = TextEditingController();
  final TextEditingController _controladorConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();
  final TextEditingController _controladorDescr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
        appBar: AppBar(
          title: Text("Nova transferência"),
        ),
        body: Column(children: <Widget>[
          Editor(
              label: "Banco",
              hint: "000",
              favicon: Icons.account_balance,
              controller: _controladorBanco),
          Editor(
              label: "Agência",
              hint: "0000",
              favicon: Icons.business,
              controller: _controladorAgencia),
          Editor(
              label: "Conta corrente",
              hint: "00000",
              favicon: Icons.account_box_rounded,
              controller: _controladorConta),
          Editor(
              label: "Valor",
              hint: "0,00",
              favicon: Icons.monetization_on,
              controller: _controladorValor),
          Editor(
              label: "Descrição",
              hint: "Insira a descrição (opcional)",
              controller: _controladorDescr),
          ElevatedButton(
            child: Text("Efetuar transferência"),
            onPressed: () => _criaTransferencia(),
          )
        ]));
  }

  void _criaTransferencia() {
    final int banco = int.tryParse(_controladorBanco.text);
    final int agencia = int.tryParse(_controladorAgencia.text);
    final int conta = int.tryParse(_controladorConta.text);
    final double valor = double.tryParse(_controladorValor.text);
    final String descr = _controladorDescr.text;

    if (banco != null && agencia != null && conta != null && valor != null) {
      final transfer = Transferencia(banco, agencia, conta, valor, descr);
      debugPrint("$transfer");
    }
  }
}

// TODO: Teclado alfanumérico para a descrição
class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData favicon;

  Editor({this.label, this.hint, this.favicon, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 16,
        ),
        decoration: InputDecoration(
            icon: favicon != null ? Icon(favicon) : null,
            labelText: this.label,
            hintText: this.hint),
      ),
    );
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
        children: [],
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

// TODO: Tornar descrição opcional
class Transferencia {
  final int banco;
  final int agencia;
  final int conta;
  final double valor;
  final String descr;

  Transferencia(this.banco, this.agencia, this.conta, this.valor, this.descr);

  @override
  String toString() {
    return "$banco $agencia $conta $valor $descr";
  }
}
