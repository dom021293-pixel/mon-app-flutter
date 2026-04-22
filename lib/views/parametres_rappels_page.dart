// lib/views/parametres_rappels_page.dart
import 'package:flutter/material.dart';
import 'package:joe/services/rappel_priere_service.dart';
import 'package:joe/services/rappel_neuvaine_service.dart';
import 'package:joe/services/rappel_premier_mercredi_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:joe/data/prieres_data.dart';

class ParametresRappelsPage extends StatefulWidget {
  @override
  _ParametresRappelsPageState createState() => _ParametresRappelsPageState();
}

class _ParametresRappelsPageState extends State<ParametresRappelsPage> {
  bool _rappelPriereActif = false;
  bool _rappelPremierMercrediActif = false;
  TimeOfDay _heurePriere = const TimeOfDay(hour: 8, minute: 0);
  TimeOfDay _heureNeuvaine = const TimeOfDay(hour: 20, minute: 0);

  static const String PREFS_PRIERE_ACTIF = 'rappel_priere_actif';
  static const String PREFS_PRIERE_HEURE = 'rappel_priere_heure';
  static const String PREFS_PREMIER_MERCREDI = 'rappel_premier_mercredi';

  @override
  void initState() {
    super.initState();
    _chargerParametres();
  }

  Future<void> _chargerParametres() async {
    final prefs = await SharedPreferences.getInstance();
    
    setState(() {
      _rappelPriereActif = prefs.getBool(PREFS_PRIERE_ACTIF) ?? false;
      _rappelPremierMercrediActif = prefs.getBool(PREFS_PREMIER_MERCREDI) ?? false;
      
      // Charger l'heure sauvegardée
      int savedHour = prefs.getInt('${PREFS_PRIERE_HEURE}_hour') ?? 8;
      int savedMinute = prefs.getInt('${PREFS_PRIERE_HEURE}_minute') ?? 0;
      _heurePriere = TimeOfDay(hour: savedHour, minute: savedMinute);
    });
  }

  Future<void> _sauvegarderHeurePriere(TimeOfDay heure) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('${PREFS_PRIERE_HEURE}_hour', heure.hour);
    await prefs.setInt('${PREFS_PRIERE_HEURE}_minute', heure.minute);
  }

  Future<void> _activerRappelPriere(bool activer) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(PREFS_PRIERE_ACTIF, activer);
    
    if (activer) {
      // Récupérer la prière du jour
      final priere = PrieresData.getPriereDuJour();
      if (priere != null) {
        await RappelPriereService.activerRappelPriere(
          priereId: priere.id,
          priereTitre: priere.titre,
          heure: _heurePriere,
        );
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('✅ Rappel de la prière du jour activé'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      // Désactiver tous les rappels de prières
      await RappelPriereService.desactiverTousRappelsPriere();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('❌ Rappels de prières désactivés'),
          backgroundColor: Colors.grey,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _reprogrammerAvecNouvelleHeure(TimeOfDay nouvelleHeure) async {
    if (_rappelPriereActif) {
      // Désactiver d'abord
      await RappelPriereService.desactiverTousRappelsPriere();
      
      // Réactiver avec la nouvelle heure
      final priere = PrieresData.getPriereDuJour();
      if (priere != null) {
        await RappelPriereService.activerRappelPriere(
          priereId: priere.id,
          priereTitre: priere.titre,
          heure: nouvelleHeure,
        );
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('🕐 Heure modifiée à ${nouvelleHeure.hour}:${nouvelleHeure.minute.toString().padLeft(2, '0')}'),
          backgroundColor: Colors.blue,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rappels de prières'),
        backgroundColor: Colors.brown,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Rappels quotidiens',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          
          // Rappel prière du jour
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.menu_book, color: Colors.blue),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Prière du jour',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Recevez chaque jour une prière différente',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: _rappelPriereActif,
                        onChanged: _activerRappelPriere,
                        activeColor: Colors.blue,
                      ),
                    ],
                  ),
                  if (_rappelPriereActif) ...[
                    const Divider(height: 24),
                    ListTile(
                      title: const Text('Heure du rappel'),
                      subtitle: Text(
                        '${_heurePriere.hour.toString().padLeft(2, '0')}:${_heurePriere.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      trailing: const Icon(Icons.access_time, color: Colors.blue),
                      onTap: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: _heurePriere,
                        );
                        if (time != null) {
                          setState(() => _heurePriere = time);
                          await _sauvegarderHeurePriere(time);
                          await _reprogrammerAvecNouvelleHeure(time);
                        }
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Rappel premier mercredi
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.calendar_month, color: Colors.orange),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Premier mercredi',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Rappel pour la dévotion mensuelle',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      FutureBuilder<bool>(
                        future: RappelPremierMercrediService.estRappelActif(),
                        builder: (context, snapshot) {
                          return Switch(
                            value: snapshot.data ?? false,
                            onChanged: (value) async {
                              await RappelPremierMercrediService.activerRappel(value);
                              setState(() {
                                _rappelPremierMercrediActif = value;
                              });
                            },
                            activeColor: Colors.orange,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
          
          // Section conseils
          const Text(
            'Conseils',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb_outline, color: Colors.amber, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Pour bien utiliser les rappels',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    '• Les rappels vous aident à garder une vie de prière régulière',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '• Choisissez l\'heure qui correspond le mieux à votre routine',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '• La prière du jour change automatiquement chaque jour',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '• Vous pouvez activer/désactiver les rappels à tout moment',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),
          
          // Bouton pour tester les notifications
         /* Center(
            child: TextButton.icon(
              onPressed: () async {
                await RappelPriereService.envoyerNotificationTest('Test');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Notification de test envoyée'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              icon: const Icon(Icons.notifications_active),
              label: const Text('Tester les notifications'),
            ),
          ),*/
        ],
      ),
    );
  }
}