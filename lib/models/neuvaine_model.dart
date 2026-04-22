// lib/models/neuvaine_model.dart
class Neuvaine {
   String id;
   String titre;
   String description;
   String imageUrl;
   List<JourNeuvaine> jours;
   String? audioUrl;
   String couleurHex;
  bool enCours;
  int jourActuel;

  Neuvaine({
    required this.id,
    required this.titre,
    required this.description,
    required this.imageUrl,
    required this.jours,
    this.audioUrl,
    required this.couleurHex,
    this.enCours = false,
    this.jourActuel = 0,
  });

  int get progression => ((jourActuel / jours.length) * 100).round();

  // Pour copier la neuvaine avec de nouvelles valeurs
  Neuvaine copyWith({
    bool? enCours,
    int? jourActuel,
  }) {
    return Neuvaine(
      id: id,
      titre: titre,
      description: description,
      imageUrl: imageUrl,
      jours: jours,
      audioUrl: audioUrl,
      couleurHex: couleurHex,
      enCours: enCours ?? this.enCours,
      jourActuel: jourActuel ?? this.jourActuel,
    );
  }

  // AJOUT : Méthode toJson pour convertir en Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titre': titre,
      'description': description,
      'imageUrl': imageUrl,
      'jours': jours.map((jour) => jour.toJson()).toList(),
      'audioUrl': audioUrl,
      'couleurHex': couleurHex,
      'enCours': enCours,
      'jourActuel': jourActuel,
    };
  }

  // AJOUT : Factory fromJson pour créer une instance depuis une Map
  factory Neuvaine.fromJson(Map<String, dynamic> json) {
    return Neuvaine(
      id: json['id'],
      titre: json['titre'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      jours: (json['jours'] as List).map((j) => JourNeuvaine.fromJson(j)).toList(),
      audioUrl: json['audioUrl'],
      couleurHex: json['couleurHex'],
      enCours: json['enCours'] ?? false,
      jourActuel: json['jourActuel'] ?? 0,
    );
  }
}

class JourNeuvaine {
  final int numero;
  final String titre;
  final String priere;
  final String meditation;
  final String? verset;
  final bool estComplete;

  String get extrait {
    if (meditation.length > 100) {
      return meditation.substring(0, 100) + '...';
    }
    return meditation;
  }

  JourNeuvaine({
    required this.numero,
    required this.titre,
    required this.priere,
    required this.meditation,
    this.verset,
    this.estComplete = false,
  });

  // AJOUT : Méthode toJson pour JourNeuvaine
  Map<String, dynamic> toJson() {
    return {
      'numero': numero,
      'titre': titre,
      'priere': priere,
      'meditation': meditation,
      'verset': verset,
      'estComplete': estComplete,
    };
  }

  // AJOUT : Factory fromJson pour JourNeuvaine
  factory JourNeuvaine.fromJson(Map<String, dynamic> json) {
    return JourNeuvaine(
      numero: json['numero'],
      titre: json['titre'],
      priere: json['priere'],
      meditation: json['meditation'],
      verset: json['verset'],
      estComplete: json['estComplete'] ?? false,
    );
  }
}