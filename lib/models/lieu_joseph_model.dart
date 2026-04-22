// lib/models/lieu_joseph_model.dart
class LieuJoseph {
  final String nom;
  final String ville;
  final String pays;
  final double latitude;
  final double longitude;
  final String description;
  final String type; // eglise, sanctuaire, chapelle, statue
  final String imageUrl;
  final String horaires;
  final String siteWeb;

  LieuJoseph({
    required this.nom,
    required this.ville,
    required this.pays,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.type,
    required this.imageUrl,
    required this.horaires,
    required this.siteWeb,
  });
}

class LieuxJosephData {
  static List<LieuJoseph> tous = [
    LieuJoseph(
      nom: 'Sanctuaire de Saint Joseph',
      ville: 'Montréal',
      pays: 'Canada',
      latitude: 45.5216,
      longitude: -73.6052,
      description: 'Le plus grand sanctuaire dédié à Saint Joseph au monde. Son oratoire domine la ville.',
      type: 'sanctuaire',
      imageUrl: 'images/oratoire_montreal.jpg',
      horaires: '6h - 21h tous les jours',
      siteWeb: 'www.saint-joseph.org',
    ),
    LieuJoseph(
      nom: 'Église Saint-Joseph des Nations',
      ville: 'Paris',
      pays: 'France',
      latitude: 48.8566,
      longitude: 2.3522,
      description: 'Église dédiée à Saint Joseph, connue pour ses magnifiques vitraux.',
      type: 'eglise',
      imageUrl: 'images/st_joseph_paris.jpg',
      horaires: '8h - 19h',
      siteWeb: 'www.stjoseph-paris.fr',
    ),
    LieuJoseph(
      nom: 'Basilique Saint-Joseph',
      ville: 'Grenoble',
      pays: 'France',
      latitude: 45.1885,
      longitude: 5.7245,
      description: 'Magnifique basilique dédiée au père nourricier de Jésus.',
      type: 'basilique',
      imageUrl: 'images/basilique_grenoble.jpg',
      horaires: '7h - 20h',
      siteWeb: 'www.basilique-grenoble.fr',
    ),
     LieuJoseph(
      nom: 'Sanctuaire Saint Joseph de Nazouma (Kombissiri)',
      ville: 'Ouagadougou',
      pays: 'Burkina Faso',
      latitude:  12.0534468496474, 
      longitude: -1.332110418645997,
      description: 'Magnifique sanctuaire dédiée à Saint Joseph Artisan.',
      type: 'sanctuaire',
      imageUrl: 'images/nazouma.jpg',
      horaires: '7h - 20h',
      siteWeb: 'www.catholique.bf/annonces/1498-pelerinage-diocesain-a-nazouma-kombissiriass=',
    ),
    // Ajoutez d'autres lieux...
  ];

  static List<LieuJoseph> getLieuxProches(double lat, double lng, {int rayonKm = 100}) {
    // Implémenter la logique de distance
    return tous;
  }
}