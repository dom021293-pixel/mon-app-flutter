// lib/services/intention_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:joe/models/intention_model.dart';

class IntentionService {
  static final CollectionReference _intentionsCollection = 
      FirebaseFirestore.instance.collection('intentions');

  // Ajouter une intention
  static Future<void> ajouterIntention(Intention intention) async {
    try {
      await _intentionsCollection.add({
        'id': intention.id,
        'nom': intention.nom,
        'intention': intention.intention,
        'dateSoumission': intention.dateSoumission.toIso8601String(),
        'isAnonyme': intention.isAnonyme,
        'estPubliee': intention.estPubliee,
        'nombreDePrieres': intention.nombreDePrieres,
      });
    } catch (e) {
      print('❌ Erreur ajout intention: $e');
      rethrow;
    }
  }

  // Récupérer toutes les intentions publiées
  static Stream<List<Intention>> getIntentionsPubliques() {
    return _intentionsCollection
        .where('estPubliee', isEqualTo: true)
        .orderBy('dateSoumission', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return Intention(
              id: doc['id'],
              nom: doc['nom'],
              email: '', // Pas stocké pour la sécurité
              intention: doc['intention'],
              dateSoumission: DateTime.parse(doc['dateSoumission']),
              isAnonyme: doc['isAnonyme'],
              estPubliee: doc['estPubliee'],
              nombreDePrieres: doc['nombreDePrieres'] ?? 0,
            );
          }).toList();
        });
  }

  // Prier pour une intention (incrémenter le compteur)
  static Future<void> prierPourIntention(String intentionId) async {
    try {
      final intentionRef = _intentionsCollection
          .where('id', isEqualTo: intentionId);
      
      final snapshot = await intentionRef.get();
      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs.first;
        final currentCount = doc['nombreDePrieres'] ?? 0;
        await doc.reference.update({
          'nombreDePrieres': currentCount + 1,
        });
      }
    } catch (e) {
      print('❌ Erreur prière: $e');
    }
  }
}