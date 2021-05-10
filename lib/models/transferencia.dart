class Transferencia {
  final int banco;
  final int agencia;
  final int conta;
  final double valor;
  final String descricao;

  Transferencia(this.banco, this.agencia, this.conta, this.valor, {descr})
      : descricao = descr;

  @override
  String toString() {
    return "a";
  }
}