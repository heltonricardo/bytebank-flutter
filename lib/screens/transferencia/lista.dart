import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:flutter/material.dart';

const _titleAppBar = "Transferências";

class ListaTransferencias extends StatefulWidget {
  /* Como _transferencias terá sua referência constante (não mudará, não será
   * atribuída a outra coisa), deixamos sua declaração na classe Stateful e a
   * referenciamos, na classe State (abaixo), utilizando widget.campo. Se a
   * referência fosse algo variável, poderíamos deixar sua declaração na própria
   * classe State. Isso é uma convenção.
   */
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, int index) {
          final transferencia = widget._transferencias[index];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then((transferencia) => _atualiza(transferencia));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualiza(Transferencia transferencia) {
    if (transferencia != null) {
      setState(() {
        widget._transferencias.add(transferencia);
      });
    }
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
        subtitle: Text("Agência: ${_transferencia.agencia}\n" +
            "Conta: ${_transferencia.conta}"),
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return CardTransferencia(_transferencia);
              });
        },
      ),
    );
  }
}

class CardTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  CardTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CardItem("Banco", _transferencia.banco,
                icon: Icons.account_balance),
            CardItem("Agência", _transferencia.agencia, icon: Icons.business),
            CardItem("Conta", _transferencia.conta,
                icon: Icons.account_box_rounded),
            CardItem("Valor", _transferencia.valor,
                icon: Icons.monetization_on),
            Divider(),
            CardItem("Descrição", _transferencia.descricao),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('Voltar'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String _title;
  final Object _content;
  final IconData _icon;

  CardItem(this._title, this._content, {icon}) : _icon = icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _icon == null ? null : Icon(_icon),
      title: Text(_title),
      subtitle: Text(_content.toString()),
    );
  }
}
