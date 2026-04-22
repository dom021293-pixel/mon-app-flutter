// lib/models/intention_model.dart (version améliorée)
class Intention {
  final String id;
  final String nom;
  final String email;
  final String intention;
  final DateTime dateSoumission;
  final bool isAnonyme;
  final bool estPubliee;
  int nombreDePrieres; // Nouveau champ

  Intention({
    required this.id,
    required this.nom,
    required this.email,
    required this.intention,
    required this.dateSoumission,
    this.isAnonyme = false,
    this.estPubliee = false,
    this.nombreDePrieres = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'email': email,
      'intention': intention,
      'dateSoumission': dateSoumission.toIso8601String(),
      'isAnonyme': isAnonyme,
      'estPubliee': estPubliee,
      'nombreDePrieres': nombreDePrieres,
    };
  }

  factory Intention.fromJson(Map<String, dynamic> json) {
    return Intention(
      id: json['id'],
      nom: json['nom'],
      email: json['email'],
      intention: json['intention'],
      dateSoumission: DateTime.parse(json['dateSoumission']),
      isAnonyme: json['isAnonyme'] ?? false,
      estPubliee: json['estPubliee'] ?? false,
      nombreDePrieres: json['nombreDePrieres'] ?? 0,
    );
  }
}