import 'dart:convert';

class CategoriaDomain {
  final int id;
  final String descricao;

  CategoriaDomain({
    required this.id,
    required this.descricao,
  });

  

  CategoriaDomain copyWith({
    int? id,
    String? descricao,
  }) {
    return CategoriaDomain(
      id: id ?? this.id,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
    };
  }

  factory CategoriaDomain.fromMap(Map<String, dynamic> map) {
    return CategoriaDomain(
      id: map['id']?.toInt() ?? 0,
      descricao: map['descricao'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriaDomain.fromJson(String source) => CategoriaDomain.fromMap(json.decode(source));

  @override
  String toString() => 'CategoriaDomain(id: $id, descricao: $descricao)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CategoriaDomain &&
      other.id == id &&
      other.descricao == descricao;
  }

  @override
  int get hashCode => id.hashCode ^ descricao.hashCode;
}