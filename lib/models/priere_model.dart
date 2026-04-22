class Priere {
   String id;
   String titre;
   String texte;
   String categorie;
   String sousTitre;
  final String? audioUrl;
   bool estFavori;
   List<String>? intentions;
  final String? imageUrl;

  Priere({
    required this.id,
    required this.titre,
    required this.texte,
    required this.categorie,
    required this.sousTitre,
    this.audioUrl,
    this.estFavori = false,
    this.intentions,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titre': titre,
      'texte': texte,
      'categorie': categorie,
      'sousTitre': sousTitre,
      'audioUrl': audioUrl,
      'estFavori': estFavori,
      'intentions': intentions,
      'imageUrl': imageUrl,
    };
  }

  factory Priere.fromJson(Map<String, dynamic> json) {
    return Priere(
      id: json['id'],
      titre: json['titre'],
      texte: json['texte'],
      categorie: json['categorie'],
      sousTitre: json['sousTitre'],
      audioUrl: json['audioUrl'],
      estFavori: json['estFavori'] ?? false,
      intentions: List<String>.from(json['intentions'] ?? []),
      imageUrl: json['imageUrl'],
    );
  }
}