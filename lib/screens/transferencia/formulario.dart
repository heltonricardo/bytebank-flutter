import 'package:bytebank/componentes/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _titleAppBar = "Nova transferência";
const _titleButton = "Efetuar transferência";

const _labelBanco = "Banco";
const _hintBanco = "000";
const _labelAgencia = "Agencia";
const _hintAgencia = "0000";
const _labelConta = "Conta";
const _hintConta = "00000";
const _labelValor = "Valor";
const _hintValor = "0,00";
const _labelDescricao = "Descrição";
const _hintDescricao = "Insira a descrição (opcional)";

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorBanco = TextEditingController();
  final TextEditingController _controladorAgencia = TextEditingController();
  final TextEditingController _controladorConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();
  final TextEditingController _controladorDescr = TextEditingController();

  void _criaTransferencia(BuildContext context) {
    final int banco = int.tryParse(_controladorBanco.text);
    final int agencia = int.tryParse(_controladorAgencia.text);
    final int conta = int.tryParse(_controladorConta.text);
    final double valor = double.tryParse(_controladorValor.text);
    final String descr = _controladorDescr.text;

    if (banco != null && agencia != null && conta != null && valor != null) {
      final transfer =
          Transferencia(banco, agencia, conta, valor, descr: descr);
      Navigator.pop(context, transfer);
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
        appBar: AppBar(
          title: Text(_titleAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Editor(
                label: _labelBanco,
                hint: _hintBanco,
                favicon: Icons.account_balance,
                controller: _controladorBanco),
            Editor(
                label: _labelAgencia,
                hint: _hintAgencia,
                favicon: Icons.business,
                controller: _controladorAgencia),
            Editor(
                label: _labelConta,
                hint: _hintConta,
                favicon: Icons.account_box_rounded,
                controller: _controladorConta),
            Editor(
                label: _labelValor,
                hint: _hintValor,
                favicon: Icons.monetization_on,
                controller: _controladorValor),
            Editor(
                label: _labelDescricao,
                hint: _hintDescricao,
                controller: _controladorDescr,
                keyboard: TextInputType.text),
            ElevatedButton(
              child: Text(_titleButton),
              onPressed: () => _criaTransferencia(context),
            )
          ]),
        ));
  }
}
