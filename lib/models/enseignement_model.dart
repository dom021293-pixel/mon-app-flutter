// lib/models/enseignement_model.dart
class Enseignement {
   String id;
   String titre;
   String auteur;
   String extrait;
   String contenu;
   String categorie;
   String date;
   String imageUrl;
   List<String> references;
   bool estFavori;

  Enseignement({
    required this.id,
    required this.titre,
    required this.auteur,
    required this.extrait,
    required this.contenu,
    required this.categorie,
    required this.date,
    required this.imageUrl,
    required this.references,
    this.estFavori = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titre': titre,
      'auteur': auteur,
      'extrait': extrait,
      'contenu': contenu,
      'categorie': categorie,
      'date': date,
      'imageUrl': imageUrl,
      'references': references,
      'estFavori': estFavori,
    };
  }

  factory Enseignement.fromJson(Map<String, dynamic> json) {
    return Enseignement(
      id: json['id'],
      titre: json['titre'],
      auteur: json['auteur'],
      extrait: json['extrait'],
      contenu: json['contenu'],
      categorie: json['categorie'],
      date: json['date'],
      imageUrl: json['imageUrl'],
      references: List<String>.from(json['references'] ?? []),
      estFavori: json['estFavori'] ?? false,
    );
  }
}