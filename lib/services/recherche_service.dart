// lib/services/recherche_service.dart
import 'package:joe/models/priere_model.dart';
import 'package:joe/models/enseignement_model.dart';
//import 'package:joe/models/meditation_modele.dart';
import 'package:joe/models/oeuvre_modele.dart';
import 'package:joe/data/prieres_data.dart';
import 'package:joe/data/enseignements_data.dart';

// Définir la classe en dehors de RechercheService (au même niveau)
class ResultatsRecherche {
  List<Priere> prieres = [];
  List<Enseignement> enseignements = [];

  List<OeuvreArt> oeuvres = [];

  bool get isEmpty => 
      prieres.isEmpty && 
      enseignements.isEmpty && 
      oeuvres.isEmpty;

  
}

class RechercheService {
  // Filtres disponibles
  static List<String> categoriesPrieres = [
    'Toutes',
    'quotidiennes',
    'intentions',
    'traditionnelles',
    'litanies',
  ];

  static List<String> categoriesEnseignements = [
    'Tous',
    'Papes',
    'Saints',
    'Docteurs',
    'Méditations',
  ];

  static List<String> themesMeditations = [
    'Tous',
    'Vierge Marie',
    'Saint Joseph',
    'Pères de l\'Église',
    'Saints',
    'Conversion',
    'Fêtes du Seigneur',
    'Théologie',
  ];

  static List<String> typesOeuvres = [
    'Tous',
    'icone',
    'tableau',
    'fresque',
    'sculpture',
    'vitrail',
  ];

  // Recherche globale avec filtres
  static ResultatsRecherche rechercher({
    required String requete,
    List<String>? categoriesPriere,
    List<String>? categoriesEnseignement,
    List<String>? themesMeditation,
    List<String>? typesOeuvre,
    bool recherchePrieres = true,
    bool rechercheEnseignements = true,
    bool rechercheMeditations = true,
    bool rechercheOeuvres = true,
  }) {
    final resultats = ResultatsRecherche(); // Maintenant ça fonctionne
    final query = requete.toLowerCase().trim();

    if (query.isEmpty) return resultats;

    // Recherche dans les prières
    if (recherchePrieres) {
      resultats.prieres = PrieresData.toutesLesPrieres.where((priere) {
        // Filtre par catégorie
        if (categoriesPriere != null && 
            categoriesPriere.isNotEmpty && 
            !categoriesPriere.contains('Toutes') && 
            !categoriesPriere.contains(priere.categorie)) {
          return false;
        }

        // Recherche textuelle
        return priere.titre.toLowerCase().contains(query) ||
               priere.texte.toLowerCase().contains(query) ||
               priere.sousTitre.toLowerCase().contains(query) ||
               (priere.intentions?.any((i) => i.toLowerCase().contains(query)) ?? false);
      }).toList();
    }

    // Recherche dans les enseignements
    if (rechercheEnseignements) {
      resultats.enseignements = EnseignementsData.tousLesEnseignements.where((ens) {
        // Filtre par catégorie
        if (categoriesEnseignement != null && 
            categoriesEnseignement.isNotEmpty && 
            !categoriesEnseignement.contains('Tous') && 
            !categoriesEnseignement.contains(ens.categorie)) {
          return false;
        }

        // Recherche textuelle
        return ens.titre.toLowerCase().contains(query) ||
               ens.auteur.toLowerCase().contains(query) ||
               ens.extrait.toLowerCase().contains(query) ||
               ens.contenu.toLowerCase().contains(query) ||
               ens.references.any((r) => r.toLowerCase().contains(query));
      }).toList();
    }

 

    // Recherche dans les œuvres
    if (rechercheOeuvres) {
      resultats.oeuvres = GalerieData.toutes.where((oeuvre) {
        // Filtre par type
        if (typesOeuvre != null && 
            typesOeuvre.isNotEmpty && 
            !typesOeuvre.contains('Tous') && 
            !typesOeuvre.contains(oeuvre.type)) {
          return false;
        }

        // Recherche textuelle
        return oeuvre.titre.toLowerCase().contains(query) ||
               oeuvre.artiste.toLowerCase().contains(query) ||
               oeuvre.description.toLowerCase().contains(query) ||
               oeuvre.histoire.toLowerCase().contains(query) ||
               oeuvre.epoque.toLowerCase().contains(query) ||
               oeuvre.tags.any((t) => t.toLowerCase().contains(query));
      }).toList();
    }

    return resultats;
  }

  // Recherche par tags
  static ResultatsRecherche rechercherParTag(String tag) {
    final resultats = ResultatsRecherche(); // Maintenant ça fonctionne
    final tagLower = tag.toLowerCase();

    // Recherche dans les prières (via les intentions)
    resultats.prieres = PrieresData.toutesLesPrieres.where((priere) {
      return priere.intentions?.any((i) => i.toLowerCase().contains(tagLower)) ?? false;
    }).toList();

    // Recherche dans les enseignements
    resultats.enseignements = EnseignementsData.tousLesEnseignements.where((ens) {
      return ens.titre.toLowerCase().contains(tagLower) ||
             ens.categorie.toLowerCase().contains(tagLower) ||
             ens.references.any((r) => r.toLowerCase().contains(tagLower));
    }).toList();

  
    // Recherche dans les œuvres
    resultats.oeuvres = GalerieData.toutes.where((oeuvre) {
      return oeuvre.tags.any((t) => t.toLowerCase().contains(tagLower));
    }).toList();

    return resultats;
  }

  // Obtenir tous les tags uniques
  static List<String> getAllTags() {
    Set<String> tags = {};

    // Tags des prières (intentions)
    for (var priere in PrieresData.toutesLesPrieres) {
      if (priere.intentions != null) {
        tags.addAll(priere.intentions!);
      }
    }

    // Tags des enseignements (catégories)
    for (var ens in EnseignementsData.tousLesEnseignements) {
      tags.add(ens.categorie);
    }

   

    // Tags des œuvres
    for (var oeuvre in GalerieData.toutes) {
      tags.addAll(oeuvre.tags);
    }

    return tags.toList()..sort();
  }
}