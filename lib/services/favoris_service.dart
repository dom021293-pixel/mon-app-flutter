// lib/services/favoris_service.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:joe/models/priere_model.dart';
import 'package:joe/models/enseignement_model.dart';
//import 'package:joe/models/meditation_modele.dart';
import 'package:joe/models/oeuvre_modele.dart';
import 'package:joe/data/prieres_data.dart';
import 'package:joe/data/enseignements_data.dart';

class FavorisService {
  static const String PRIERES_FAVORIS = 'prieres_favoris';
  static const String ENSEIGNEMENTS_FAVORIS = 'enseignements_favoris';
  static const String MEDITATIONS_FAVORIS = 'meditations_favoris';
  static const String OEUVRES_FAVORIS = 'oeuvres_favoris';

  // Sauvegarder les favoris
  static Future<void> _sauvegarderList(String key, List<String> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, jsonEncode(ids));
  }

  static Future<List<String>> _chargerList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(key);
    if (data != null) {
      return List<String>.from(jsonDecode(data));
    }
    return [];
  }

  // Prières
  static Future<void> togglePriereFavori(String id) async {
    final favoris = await _chargerList(PRIERES_FAVORIS);
    if (favoris.contains(id)) {
      favoris.remove(id);
    } else {
      favoris.add(id);
    }
    await _sauvegarderList(PRIERES_FAVORIS, favoris);
    
    // Mettre à jour le modèle
    final priere = PrieresData.getPriereParId(id);
    if (priere != null) {
      priere.estFavori = !priere.estFavori;
    }
  }

  static Future<bool> estPriereFavori(String id) async {
    final favoris = await _chargerList(PRIERES_FAVORIS);
    return favoris.contains(id);
  }

  static Future<List<Priere>> getPrieresFavoris() async {
    final favoris = await _chargerList(PRIERES_FAVORIS);
    return PrieresData.toutesLesPrieres
        .where((p) => favoris.contains(p.id))
        .toList();
  }

  // Enseignements
  static Future<void> toggleEnseignementFavori(String id) async {
    final favoris = await _chargerList(ENSEIGNEMENTS_FAVORIS);
    if (favoris.contains(id)) {
      favoris.remove(id);
    } else {
      favoris.add(id);
    }
    await _sauvegarderList(ENSEIGNEMENTS_FAVORIS, favoris);
  }

  static Future<bool> estEnseignementFavori(String id) async {
    final favoris = await _chargerList(ENSEIGNEMENTS_FAVORIS);
    return favoris.contains(id);
  }

  static Future<List<Enseignement>> getEnseignementsFavoris() async {
    final favoris = await _chargerList(ENSEIGNEMENTS_FAVORIS);
    return EnseignementsData.tousLesEnseignements
        .where((e) => favoris.contains(e.id))
        .toList();
  }

  // Méditations
  static Future<void> toggleMeditationFavori(int jour) async {
    final favoris = await _chargerList(MEDITATIONS_FAVORIS);
    final id = jour.toString();
    if (favoris.contains(id)) {
      favoris.remove(id);
    } else {
      favoris.add(id);
    }
    await _sauvegarderList(MEDITATIONS_FAVORIS, favoris);
  }

  static Future<bool> estMeditationFavori(int jour) async {
    final favoris = await _chargerList(MEDITATIONS_FAVORIS);
    return favoris.contains(jour.toString());
  }



  // Œuvres
  static Future<void> toggleOeuvreFavori(String id) async {
    final favoris = await _chargerList(OEUVRES_FAVORIS);
    if (favoris.contains(id)) {
      favoris.remove(id);
    } else {
      favoris.add(id);
    }
    await _sauvegarderList(OEUVRES_FAVORIS, favoris);
  }

  static Future<bool> estOeuvreFavori(String id) async {
    final favoris = await _chargerList(OEUVRES_FAVORIS);
    return favoris.contains(id);
  }

  static Future<List<OeuvreArt>> getOeuvresFavoris() async {
    final favoris = await _chargerList(OEUVRES_FAVORIS);
    return GalerieData.toutes
        .where((o) => favoris.contains(o.id))
        .toList();
  }

  // Synchronisation complète
  static Future<Map<String, int>> getStatsFavoris() async {
    return {
      'prieres': (await getPrieresFavoris()).length,
      'enseignements': (await getEnseignementsFavoris()).length,
      'oeuvres': (await getOeuvresFavoris()).length,
      'total': (await getPrieresFavoris()).length +
                (await getEnseignementsFavoris()).length +
                (await getOeuvresFavoris()).length,
    };
  }

  // Exporter tous les favoris
  static Future<Map<String, dynamic>> exporterFavoris() async {
    return {
      'prieres': await _chargerList(PRIERES_FAVORIS),
      'enseignements': await _chargerList(ENSEIGNEMENTS_FAVORIS),
      'meditations': await _chargerList(MEDITATIONS_FAVORIS),
      'oeuvres': await _chargerList(OEUVRES_FAVORIS),
    };
  }

  // Importer des favoris
  static Future<void> importerFavoris(Map<String, dynamic> data) async {
    if (data.containsKey('prieres')) {
      await _sauvegarderList(PRIERES_FAVORIS, List<String>.from(data['prieres']));
    }
    if (data.containsKey('enseignements')) {
      await _sauvegarderList(ENSEIGNEMENTS_FAVORIS, List<String>.from(data['enseignements']));
    }
    if (data.containsKey('meditations')) {
      await _sauvegarderList(MEDITATIONS_FAVORIS, List<String>.from(data['meditations']));
    }
    if (data.containsKey('oeuvres')) {
      await _sauvegarderList(OEUVRES_FAVORIS, List<String>.from(data['oeuvres']));
    }
  }
}