// models/neuvaine.dart
class Neuvaine {
  final String titre;
  final String description;
  final List<String> jours;
  final String imageUrl;
  
  Neuvaine({
    required this.titre,
    required this.description,
    required this.jours,
    required this.imageUrl,
  });
}

// Données des neuvaines
final neuvaines = [
  Neuvaine(
    titre: 'Neuvaine pour une intention spéciale',
    description: '9 jours de prière pour confier une intention particulière à Saint Joseph',
    jours: [
      'Jour 1 - Confiance en Saint Joseph',
      'Jour 2 - Saint Joseph, modèle des travailleurs',
      // ... autres jours
    ],
    imageUrl: 'assets/images/neuvaine1.jpg',
  ),
  // Autres neuvaines...
];