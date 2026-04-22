// lib/services/widget_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class WidgetService {
  static const String PREFS_PRIERE_DU_JOUR = 'widget_priere_du_jour';
  static const String PREFS_NEUVAINE_EN_COURS = 'widget_neuvaine_en_cours';
  static const String PREFS_PROGRESSION = 'widget_progression';

  // Sauvegarder les données pour le widget
  static Future<void> sauvegarderDonneesWidget({
    required String priereDuJour,
    required String neuvaineEnCours,
    required int progression,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(PREFS_PRIERE_DU_JOUR, priereDuJour);
    await prefs.setString(PREFS_NEUVAINE_EN_COURS, neuvaineEnCours);
    await prefs.setInt(PREFS_PROGRESSION, progression);
  }

  // Récupérer les données pour le widget
  static Future<Map<String, dynamic>> getDonneesWidget() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'priereDuJour': prefs.getString(PREFS_PRIERE_DU_JOUR) ?? 'Saint Joseph, priez pour nous',
      'neuvaineEnCours': prefs.getString(PREFS_NEUVAINE_EN_COURS) ?? 'Aucune neuvaine',
      'progression': prefs.getInt(PREFS_PROGRESSION) ?? 0,
    };
  }
}