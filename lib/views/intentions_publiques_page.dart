// lib/views/intentions_publiques_page.dart
import 'package:flutter/material.dart';
import 'package:joe/models/intention_model.dart';
import 'package:joe/services/supabase_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class IntentionsPubliquesPage extends StatefulWidget {
  @override
  _IntentionsPubliquesPageState createState() => _IntentionsPubliquesPageState();
}

class _IntentionsPubliquesPageState extends State<IntentionsPubliquesPage> {
  String _selectedFilter = 'recentes';
  bool _isOffline = false;
  List<Intention> _intentions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    _loadIntentions();
  }

  Future<void> _checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      _isOffline = connectivityResult == ConnectivityResult.none;
    });
    
    Connectivity().onConnectivityChanged.listen((result) {
      if (mounted) {
        setState(() {
          _isOffline = result == ConnectivityResult.none;
        });
        if (!_isOffline) {
          _loadIntentions();
        }
      }
    });
  }

  Future<void> _loadIntentions() async {
    setState(() => _isLoading = true);
    try {
      final data = await SupabaseService.getIntentions().first;
      setState(() {
        _intentions = data.map((item) => Intention(
          id: item['id'].toString(),
          nom: item['nom'] ?? 'Anonyme',
          email: '',
          intention: item['intention'] ?? '',
          dateSoumission: DateTime.parse(item['date_soumission']),
          isAnonyme: item['is_anonyme'] ?? false,
          estPubliee: item['est_publiee'] ?? true,
          nombreDePrieres: item['nombre_prieres'] ?? 0,
        )).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      debugPrint('Erreur chargement: $e');
    }
  }

  List<Intention> get _intentionsFiltres {
    var list = List.of(_intentions);
    
    if (_selectedFilter == 'recentes') {
      list.sort((a, b) => b.dateSoumission.compareTo(a.dateSoumission));
    } else if (_selectedFilter == 'populaires') {
      list.sort((a, b) => b.nombreDePrieres.compareTo(a.nombreDePrieres));
    }
    
    return list;
  }

  Future<void> _prierPourIntention(Intention intention) async {
    if (_isOffline) return;
    
    try {
      final int id = int.tryParse(intention.id) ?? 0;
      if (id > 0) {
        await SupabaseService.prierPourIntention(id);
        
        // Mettre à jour localement
        setState(() {
          final index = _intentions.indexWhere((i) => i.id == intention.id);
          if (index != -1) {
            _intentions[index].nombreDePrieres++;
          }
        });
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('🙏 Merci pour votre prière !'),
              backgroundColor: Colors.purple,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $e'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      debugPrint('❌ Erreur: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intentions de prière'),
        backgroundColor: Colors.brown,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            color: Colors.brown.shade700,
            child: Row(
              children: [
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedFilter,
                      icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                      dropdownColor: Colors.brown.shade600,
                      items: const [
                        DropdownMenuItem(value: 'recentes', child: Text('Plus récentes', style: TextStyle(color: Colors.white))),
                        DropdownMenuItem(value: 'populaires', child: Text('Les plus priées', style: TextStyle(color: Colors.white))),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedFilter = value!;
                        });
                      },
                    ),
                  ),
                ),
                if (_isOffline)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.wifi_off, size: 14, color: Colors.amber),
                        const SizedBox(width: 4),
                        Text(
                          'Hors ligne',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.amber.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ),
      ),
      body: _buildBody(),
   
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_isOffline && _intentions.isEmpty) {
      return _buildOfflineMode();
    }

    if (_intentions.isEmpty) {
      return _buildEmptyState();
    }

    final intentions = _intentionsFiltres;
    
    if (intentions.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: intentions.length,
      itemBuilder: (context, index) {
        final intention = intentions[index];
        return _buildIntentionCard(intention);
      },
    );
  }

  Widget _buildOfflineMode() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.wifi_off,
                size: 60,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Mode hors ligne',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Vous n\'êtes pas connecté à Internet.\n'
              'Les intentions seront disponibles dès que la connexion sera rétablie.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                _checkConnectivity();
                _loadIntentions();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Réessayer'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            'Connectez vous pour lire les intenions',
            style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
          ),
         
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => Navigator.pushNamed(context, '/intentions'),
            icon: const Icon(Icons.add),
            label: const Text('Confier une intention'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildIntentionCard(Intention intention) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: intention.isAnonyme ? Colors.grey.shade300 : Colors.purple.shade100,
                  child: Text(
                    intention.isAnonyme ? '🙏' : _getInitials(intention.nom),
                    style: TextStyle(
                      color: intention.isAnonyme ? Colors.grey : Colors.purple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        intention.isAnonyme ? 'Un fidèle' : intention.nom,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _formatDate(intention.dateSoumission),
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                intention.intention,
                style: const TextStyle(fontSize: 15, height: 1.5),
              ),
            ),
            
            const SizedBox(height: 16),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.pink.shade400, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      '${intention.nombreDePrieres} prière${intention.nombreDePrieres > 1 ? 's' : ''}',
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: _isOffline ? null : () => _prierPourIntention(intention),
                  icon: const Icon(Icons.church, size: 16),
                  label: const Text('Prier'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getInitials(String nom) {
    if (nom.isEmpty) return "🙏";
    try {
      final parts = nom.trim().split(' ');
      if (parts.length > 1) {
        return (parts[0][0] + parts[1][0]).toUpperCase();
      }
      return nom[0].toUpperCase();
    } catch (e) {
      return "🙏";
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date).inDays;
    if (diff == 0) return "Aujourd'hui";
    if (diff == 1) return "Hier";
    if (diff < 7) return "Il y a $diff jours";
    return "${date.day}/${date.month}/${date.year}";
  }
}