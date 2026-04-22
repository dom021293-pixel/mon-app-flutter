// lib/services/supabase_temoignage_service.dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:joe/models/temoignage_model.dart';

class SupabaseTemoignageService {
  static final SupabaseClient _client = Supabase.instance.client;

  // Ajouter un témoignage
  static Future<void> ajouterTemoignage(Temoignage temoignage) async {
    try {
      await _client.from('temoignages').insert({
        'nom': temoignage.nom,
        'email': temoignage.email,
        'titre': temoignage.titre,
        'contenu': temoignage.contenu,
        'date_soumission': temoignage.dateSoumission.toIso8601String(),
        'is_anonyme': temoignage.isAnonyme,
        'est_publie': temoignage.estPublie,
        'nombre_prieres': 0,
        'nombre_gratitudes': 0,
      });
      debugPrint('✅ Témoignage ajouté');
    } catch (e) {
      debugPrint('❌ Erreur: $e');
      rethrow;
    }
  }

  // Récupérer les témoignages en temps réel
  static Stream<List<Map<String, dynamic>>> getTemoignages() {
    return _client
        .from('temoignages')
        .stream(primaryKey: ['id'])
        .map((snapshot) => snapshot);
  }

  // Rendre grâce pour un témoignage
  static Future<void> remercier(String id) async {
    try {
      await _client.rpc('increment_gratitudes', params: {'row_id': id});
    } catch (e) {
      debugPrint('❌ Erreur: $e');
    }
  }

  // Prier pour un témoignage
  static Future<void> prier(String id) async {
    try {
      await _client.rpc('increment_prieres_temoignage', params: {'row_id': id});
    } catch (e) {
      debugPrint('❌ Erreur: $e');
    }
  }
}