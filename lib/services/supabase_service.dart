// lib/services/supabase_service.dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:joe/models/intention_model.dart';

class SupabaseService {
  static final SupabaseClient _client = Supabase.instance.client;
  
  // Getter pour accéder au client depuis l'extérieur
  static SupabaseClient get client => _client;
  
  // Initialiser Supabase
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: 'https://wtcfulhgxklmxcwbvpad.supabase.co', // Remplacez par votre URL Supabase
      anonKey: 'sb_publishable_L40zpvGCaxj9GH5JimTkAg_q7I43BEB', // Remplacez par votre clé anon
    );
    debugPrint('✅ Supabase initialisé');
  }
  
  // Ajouter une intention
  static Future<void> ajouterIntention(Intention intention) async {
    try {
      await _client.from('intentions').insert({
        'nom': intention.nom,
        'intention': intention.intention,
        'date_soumission': intention.dateSoumission.toIso8601String(),
        'is_anonyme': intention.isAnonyme,
        'est_publiee': intention.estPubliee,
        'nombre_prieres': 0,
      });
      debugPrint('✅ Intention ajoutée');
    } catch (e) {
      debugPrint('❌ Erreur: $e');
      rethrow;
    }
  }
  
  // Récupérer les intentions en temps réel
  static Stream<List<Map<String, dynamic>>> getIntentions() {
    return _client
        .from('intentions')
        .stream(primaryKey: ['id'])
        .map((snapshot) => snapshot);
  }
  
  // Prier pour une intention (augmenter le compteur)
  static Future<void> prierPourIntention(int id) async {
    try {
      await _client.rpc('increment_prieres', params: {'row_id': id});
    } catch (e) {
      debugPrint('❌ Erreur: $e');
      rethrow;
    }
  }
}