// lib/models/temoignage_model.dart
class Temoignage {
  final String id;
  final String nom;
  final String? email;
  final String titre;
  final String contenu;
  final DateTime dateSoumission;
  final bool isAnonyme;
  final bool estPublie;
   int nombreDePrieres;
   int nombreDeGratitudes;

  Temoignage({
    required this.id,
    required this.nom,
    this.email,
    required this.titre,
    required this.contenu,
    required this.dateSoumission,
    this.isAnonyme = false,
    this.estPublie = true,
    this.nombreDePrieres = 0,
    this.nombreDeGratitudes = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'email': email,
      'titre': titre,
      'contenu': contenu,
      'dateSoumission': dateSoumission.toIso8601String(),
      'isAnonyme': isAnonyme,
      'estPublie': estPublie,
      'nombreDePrieres': nombreDePrieres,
      'nombreDeGratitudes': nombreDeGratitudes,
    };
  }

  factory Temoignage.fromJson(Map<String, dynamic> json) {
    return Temoignage(
      id: json['id'],
      nom: json['nom'],
      email: json['email'],
      titre: json['titre'],
      contenu: json['contenu'],
      dateSoumission: DateTime.parse(json['dateSoumission']),
      isAnonyme: json['isAnonyme'] ?? false,
      estPublie: json['estPublie'] ?? true,
      nombreDePrieres: json['nombreDePrieres'] ?? 0,
      nombreDeGratitudes: json['nombreDeGratitudes'] ?? 0,
    );
  }
}