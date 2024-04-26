class Produto {
  //atributos
  final String nome;
  final double valor;
  final String categoria;
  //construtor
  Produto({
    required this.nome, 
    required this.valor, 
    required this.categoria
    });

  //métodos(toJson e fromJson)
  Map<String, dynamic> toJson() =>
      {
        'nome': nome, 
        'preco': valor, 
        'categoria': categoria
        };

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      nome: json['nome'],
      valor: json['preco'],
      categoria: json['categoria'],
    );
  }
}
