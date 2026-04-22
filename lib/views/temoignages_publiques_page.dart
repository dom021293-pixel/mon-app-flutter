// lib/views/temoignages_publiques_page.dart
import 'package:flutter/material.dart';
import 'package:joe/services/supabase_temoignage_service.dart';
import 'package:joe/models/temoignage_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:share_plus/share_plus.dart';

class TemoignagesPubliquesPage extends StatefulWidget {
  @override
  _TemoignagesPubliquesPageState createState() => _TemoignagesPubliquesPageState();
}

class _TemoignagesPubliquesPageState extends State<TemoignagesPubliquesPage> {
  String _selectedFilter = 'recent';
  bool _isOffline = false;
  List<Temoignage> _temoignages = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    _loadTemoignages();
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
          _loadTemoignages();
        }
      }
    });
  }

  Future<void> _loadTemoignages() async {
    setState(() => _isLoading = true);
    try {
      final data = await SupabaseTemoignageService.getTemoignages().first;
      setState(() {
        _temoignages = data.map((item) => Temoignage(
          id: item['id'].toString(),
          nom: item['nom'] ?? 'Anonyme',
          email: item['email'],
          titre: item['titre'] ?? 'Témoignage',
          contenu: item['contenu'] ?? '',
          dateSoumission: DateTime.parse(item['date_soumission']),
          isAnonyme: item['is_anonyme'] ?? false,
          estPublie: item['est_publie'] ?? true,
          nombreDePrieres: item['nombre_prieres'] ?? 0,
          nombreDeGratitudes: item['nombre_gratitudes'] ?? 0,
        )).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      debugPrint('Erreur chargement: $e');
    }
  }

  List<Temoignage> get _temoignagesFiltres {
    var list = List.of(_temoignages);
    
    if (_selectedFilter == 'populaires') {
      list.sort((a, b) => b.nombreDeGratitudes.compareTo(a.nombreDeGratitudes));
    } else if (_selectedFilter == 'pries') {
      list.sort((a, b) => b.nombreDePrieres.compareTo(a.nombreDePrieres));
    } else {
      list.sort((a, b) => b.dateSoumission.compareTo(a.dateSoumission));
    }
    
    return list;
  }

  Future<void> _remercier(Temoignage temoignage) async {
    if (_isOffline) return;
    
    try {
      await SupabaseTemoignageService.remercier(temoignage.id);
      
      setState(() {
        final index = _temoignages.indexWhere((t) => t.id == temoignage.id);
        if (index != -1) {
          _temoignages[index].nombreDeGratitudes++;
        }
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('🙏 Merci d\'avoir remercié !'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
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

  Future<void> _prier(Temoignage temoignage) async {
    if (_isOffline) return;
    
    try {
      await SupabaseTemoignageService.prier(temoignage.id);
      
      setState(() {
        final index = _temoignages.indexWhere((t) => t.id == temoignage.id);
        if (index != -1) {
          _temoignages[index].nombreDePrieres++;
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

  Future<void> _partager(Temoignage temoignage) async {
    final message = '''
✨ Témoignage : ${temoignage.titre}

"${temoignage.contenu}"

Partagé par ${temoignage.isAnonyme ? 'un fidèle' : temoignage.nom}
Le ${_formatDate(temoignage.dateSoumission)}

🙏 ${temoignage.nombreDeGratitudes} remerciements - ${temoignage.nombreDePrieres} prières

Partagé depuis l'application "Prière à Saint Joseph"
''';
    
    await Share.share(message);
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('📤 Témoignage partagé !'),
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
        title: const Text('Témoignages'),
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
                        DropdownMenuItem(value: 'recent', child: Text('Plus récents', style: TextStyle(color: Colors.white))),
                        DropdownMenuItem(value: 'populaires', child: Text('Les plus remerciés', style: TextStyle(color: Colors.white))),
                        DropdownMenuItem(value: 'pries', child: Text('Les plus priés', style: TextStyle(color: Colors.white))),
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

    if (_isOffline && _temoignages.isEmpty) {
      return _buildOfflineMode();
    }

    if (_temoignages.isEmpty) {
      return _buildEmptyState();
    }

    final temoignages = _temoignagesFiltres;
    
    if (temoignages.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: temoignages.length,
      itemBuilder: (context, index) {
        final temoignage = temoignages[index];
        return _buildTemoignageCard(temoignage);
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
              'Les témoignages seront disponibles dès que la connexion sera rétablie.',
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
                _loadTemoignages();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Réessayer'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
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
          Icon(Icons.celebration, size: 80, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            'Connectez vous pour lire les témoingages',
            style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
          ),
         
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => Navigator.pushNamed(context, '/temoignages'),
            icon: const Icon(Icons.add),
            label: const Text('Partager un témoignage'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          ),
        ],
      ),
    );
  }

  Widget _buildTemoignageCard(Temoignage temoignage) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // En-tête
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: temoignage.isAnonyme ? Colors.grey.shade300 : Colors.green.shade100,
                  child: Text(
                    temoignage.isAnonyme ? '🙏' : _getInitials(temoignage.nom),
                    style: TextStyle(
                      color: temoignage.isAnonyme ? Colors.grey : Colors.green,
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
                        temoignage.isAnonyme ? 'Un fidèle' : temoignage.nom,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _formatDate(temoignage.dateSoumission),
                        style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
                // Badge "Merci"
                if (temoignage.nombreDeGratitudes > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.favorite, color: Colors.green.shade400, size: 12),
                        const SizedBox(width: 4),
                        Text(
                          '${temoignage.nombreDeGratitudes}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 12),

            // Titre
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                temoignage.titre,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.amber.shade800,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Témoignage
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                temoignage.contenu,
                style: const TextStyle(fontSize: 15, height: 1.5),
              ),
            ),

            const SizedBox(height: 16),

            // Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  icon: Icons.favorite,
                  label: 'Remercier',
                  count: temoignage.nombreDeGratitudes,
                  color: Colors.pink,
                  onPressed: _isOffline ? null : () => _remercier(temoignage),
                ),
                _buildActionButton(
                  icon: Icons.church,
                  label: 'Prier',
                  count: temoignage.nombreDePrieres,
                  color: Colors.purple,
                  onPressed: _isOffline ? null : () => _prier(temoignage),
                ),
                _buildActionButton(
                  icon: Icons.share,
                  label: 'Partager',
                  count: null,
                  color: Colors.blue,
                  onPressed: _isOffline ? null : () => _partager(temoignage),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    int? count,
    required Color color,
    required VoidCallback? onPressed,
  }) {
    return Opacity(
      opacity: onPressed != null ? 1.0 : 0.5,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            if (count != null)
              Text(
                '$count',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
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