class Estatistica {
  final int id;
  final String tipoAtividade;
  final int limiteAtividade;
  final double horaAtividade;

  Estatistica(
      this.id, this.tipoAtividade, this.limiteAtividade, this.horaAtividade);

  @override
  String toString() {
    return 'estatistica{id:$id, tipoAtividade:$tipoAtividade, limiteAtividade:$limiteAtividade, horaAtividade:$horaAtividade}';
  }
}
