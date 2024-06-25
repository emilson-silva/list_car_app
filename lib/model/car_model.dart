class Car {
  final int id;
  final String timestampCadastro;
  final int modeloId;
  final String nomeModelo;
  final double valor;
  final int ano;
  final String combustivel;
  final int numPortas;
  final String cor;

  Car({
    required this.modeloId,
    required this.id,
    required this.nomeModelo,
    required this.valor,
    required this.ano,
    required this.combustivel,
    required this.numPortas,
    required this.cor,
    required this.timestampCadastro,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      modeloId: json['modelo_id'] ?? 0,
      id: json['id'] ?? 0,
      nomeModelo: json['nome_modelo'] ?? '',
      valor: json['valor'],
      ano: json['ano'] ?? 0,
      combustivel: json['combustivel'] ?? '',
      numPortas: json['num_portas'] ?? 0,
      cor: json['cor'] ?? '',
      timestampCadastro: json['timestamp_cadastro'].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomeModelo': nomeModelo,
      'valor': valor,
      'ano': ano,
      'combustivel': combustivel,
      'num_portas': numPortas,
      'cor': cor,
      'timestamp_cadastro': timestampCadastro,
    };
  }
}
