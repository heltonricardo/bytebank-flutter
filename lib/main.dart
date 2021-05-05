import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Transferências"),
        ),
        body: ListaTransferencias(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ),
    ));

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        ItemTransferencia(Transferencia(100.9, "123-6")),
        ItemTransferencia(Transferencia(200.8, "456-5")),
        ItemTransferencia(Transferencia(300.7, "789-4")),
      ],
    ));
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
