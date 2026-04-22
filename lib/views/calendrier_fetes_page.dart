// lib/views/calendrier_fetes_page.dart
import 'package:flutter/material.dart';
import 'package:joe/models/fete_modele.dart';

class CalendrierFetesPage extends StatefulWidget {
  @override
  _CalendrierFetesPageState createState() => _CalendrierFetesPageState();
}

class _CalendrierFetesPageState extends State<CalendrierFetesPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  DateTime _dateSelectionnee = DateTime.now();
  int _moisSelectionne = DateTime.now().month;
  int _anneeSelectionnee = DateTime.now().year;
  
  // Variables pour la recherche
  final TextEditingController _searchController = TextEditingController();
  List<Fete> _resultatsRecherche = [];
  String _selectedFilter = 'Tous';
  bool _isSearching = false;
  
  final List<String> _filtres = [
    'Tous',
    'Solennités',
    'Fêtes',
    'Mémoires',
    'Saints',
    'Marie',
    'Joseph'
  ];
  
  final List<String> _moisNoms = [
    'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin',
    'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _rechercherFetes(_searchController.text);
  }

  void _rechercherFetes(String query) {
    setState(() {
      _isSearching = query.isNotEmpty;
      
      if (query.isEmpty) {
        _resultatsRecherche = [];
        return;
      }
      
      // Filtrer les fêtes
      _resultatsRecherche = CalendrierLiturgiqueData.toutesLesFetes.where((fete) {
        // Filtre par texte
        bool matchTexte = fete.nom.toLowerCase().contains(query.toLowerCase()) ||
                         fete.description.toLowerCase().contains(query.toLowerCase()) ||
                         (fete.saintDuJour?.toLowerCase().contains(query.toLowerCase()) ?? false);
        
        // Filtre par type sélectionné
        bool matchType = true;
        if (_selectedFilter != 'Tous') {
          switch (_selectedFilter) {
            case 'Solennités':
              matchType = fete.type == 'solennite';
              break;
            case 'Fêtes':
              matchType = fete.type == 'fete';
              break;
            case 'Mémoires':
              matchType = fete.type == 'memoire';
              break;
            case 'Saints':
              matchType = fete.saintDuJour != null;
              break;
            case 'Marie':
              matchType = fete.nom.contains('Marie') || fete.nom.contains('Vierge');
              break;
            case 'Joseph':
              matchType = fete.nom.contains('Joseph') || fete.saintDuJour == 'Joseph';
              break;
          }
        }
        
        return matchTexte && matchType;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Les Saints'),
        backgroundColor: Colors.brown,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.today, size: 16, color: Colors.white),
                  SizedBox(width: 4),
                  Text('Aujourd\'hui'),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.calendar_month, size: 16, color: Colors.white),
                  SizedBox(width: 4),
                  Text('Ce mois'),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 16, color: Colors.white),
                  SizedBox(width: 4),
                  Text('Rechercher'),
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAujourdhui(),
          _buildCeMois(),
          _buildRecherche(),
        ],
      ),
    );
  }

  Widget _buildAujourdhui() {
    final fetesDuJour = CalendrierLiturgiqueData.getFetesDuJour(_dateSelectionnee);
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.brown.shade50,
            Colors.white,
          ],
        ),
      ),
      child: Column(
        children: [
          // En-tête avec date
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.brown.shade300, Colors.brown.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  '${_moisNoms[_dateSelectionnee.month - 1]} ${_dateSelectionnee.day}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _getJourSemaine(_dateSelectionnee.weekday),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),

          // Liste des fêtes du jour
          Expanded(
            child: fetesDuJour.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 80,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Aucune fête aujourd\'hui',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'C\'est un jour ordinaire',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: fetesDuJour.length,
                    itemBuilder: (context, index) {
                      return _buildFeteCard(fetesDuJour[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCeMois() {
    final fetesDuMois = CalendrierLiturgiqueData.getFetesDuMois(_moisSelectionne);
    
    // Grouper par jour
    Map<int, List<Fete>> fetesParJour = {};
    for (var fete in fetesDuMois) {
      if (!fetesParJour.containsKey(fete.jour)) {
        fetesParJour[fete.jour] = [];
      }
      fetesParJour[fete.jour]!.add(fete);
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.brown.shade50,
            Colors.white,
          ],
        ),
      ),
      child: Column(
        children: [
          // Sélecteur de mois
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    setState(() {
                      if (_moisSelectionne == 1) {
                        _moisSelectionne = 12;
                        _anneeSelectionnee--;
                      } else {
                        _moisSelectionne--;
                      }
                    });
                  },
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${_moisNoms[_moisSelectionne - 1]} $_anneeSelectionnee',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade800,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    setState(() {
                      if (_moisSelectionne == 12) {
                        _moisSelectionne = 1;
                        _anneeSelectionnee++;
                      } else {
                        _moisSelectionne++;
                      }
                    });
                  },
                ),
              ],
            ),
          ),

          // Liste des fêtes du mois
          Expanded(
            child: fetesParJour.isEmpty
                ? Center(
                    child: Text('Aucune fête ce mois-ci'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: fetesParJour.length,
                    itemBuilder: (context, index) {
                      final jour = fetesParJour.keys.toList()[index];
                      final fetes = fetesParJour[jour]!;
                      
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 8, top: 8, bottom: 4),
                            child: Text(
                              'Jour $jour',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown.shade700,
                              ),
                            ),
                          ),
                          ...fetes.map((fete) => _buildFeteCard(fete)),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
Widget _buildSuggestionChip(String label) {
    return ActionChip(
      label: Text(label),
      onPressed: () {
        _searchController.text = label;
        _rechercherFetes(label);
      },
      backgroundColor: Colors.brown.shade100,
    );
  }

  Widget _buildFeteCard(Fete fete) {
    Color couleur = _getCouleurLiturgique(fete.couleur);
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          _showFeteDetail(context, fete);
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: couleur, width: 4),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Badge de type
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: couleur.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      _getTypeAbreviation(fete.type),
                      style: TextStyle(
                        color: couleur,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                
                // Informations
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fete.nom,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 12,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${fete.jour} ${_moisNoms[fete.mois - 1]}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(width: 12),
                          if (fete.saintDuJour != null)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.amber.shade50,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                fete.saintDuJour!,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.amber.shade800,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: couleur,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${fete.joursRestants} jours',
                            style: TextStyle(
                              fontSize: 11,
                              color: couleur,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                // Flèche
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
 Widget _buildRecherche() {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.brown.shade50,
          Colors.white,
        ],
      ),
    ),
    child: Column(
      children: [
        // Champ de recherche
        Container(
          margin: const EdgeInsets.all(16),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Rechercher une fête, un saint...',
              prefixIcon: const Icon(Icons.search, color: Colors.brown),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {
                          _resultatsRecherche = [];
                          _isSearching = false;
                        });
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.brown, width: 2),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            onChanged: (value) {
              setState(() {
                _isSearching = value.isNotEmpty;
                if (value.isNotEmpty) {
                  _rechercherFetes(value);
                } else {
                  _resultatsRecherche = [];
                }
              });
            },
          ),
        ),

        // Suggestions en HAUT (toujours visibles)
        Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 16),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _filtres.length,
            itemBuilder: (context, index) {
              final filtre = _filtres[index];
              return Container(
                margin: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(filtre),
                  selected: _selectedFilter == filtre,
                  onSelected: (selected) {
                    setState(() {
                      _selectedFilter = filtre;
                      if (_searchController.text.isNotEmpty) {
                        _rechercherFetes(_searchController.text);
                      }
                    });
                  },
                  backgroundColor: Colors.white,
                  selectedColor: Colors.brown.shade100,
                  checkmarkColor: Colors.brown,
                ),
              );
            },
          ),
        ),

        // Résultats ou message d'accueil
        Expanded(
          child: _isSearching
              ? _resultatsRecherche.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 80,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Aucun résultat trouvé',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Essayez avec d\'autres mots-clés',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: _resultatsRecherche.length,
                      itemBuilder: (context, index) {
                        return _buildFeteCard(_resultatsRecherche[index]);
                      },
                    )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search,
                        size: 100,
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Recherchez une fête',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Tapez un nom, un saint, un mois...',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ],
    ),
  );
}

  

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {},
        backgroundColor: Colors.white,
        selectedColor: Colors.brown.shade100,
        checkmarkColor: Colors.brown,
      ),
    );
  }

  void _showFeteDetail(BuildContext context, Fete fete) {
  Color couleur = _getCouleurLiturgique(fete.couleur);
  
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.6, // Commence à 60% de l'écran
        minChildSize: 0.4, // Minimum 40%
        maxChildSize: 0.9, // Maximum 90%
        expand: false,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Handle
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                
                // Contenu défilant
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    children: [
                      // En-tête
                      Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: couleur.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                _getTypeAbreviation(fete.type),
                                style: TextStyle(
                                  color: couleur,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  fete.nom,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${fete.jour} ${_moisNoms[fete.mois - 1]}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Description
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.brown.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Description',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(fete.description),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Informations complémentaires
                      Row(
                        children: [
                          _buildInfoChip(
                            icon: Icons.flag,
                            label: fete.type,
                            color: couleur,
                          ),
                          const SizedBox(width: 8),
                          _buildInfoChip(
                            icon: Icons.color_lens,
                            label: fete.couleur,
                            color: couleur,
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Bouton fermer
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close, color: Colors.white),
                              label: const Text('Fermer', style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.brown,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 20), // Espace supplémentaire
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  String _getJourSemaine(int weekday) {
    switch (weekday) {
      case 1: return 'Lundi';
      case 2: return 'Mardi';
      case 3: return 'Mercredi';
      case 4: return 'Jeudi';
      case 5: return 'Vendredi';
      case 6: return 'Samedi';
      case 7: return 'Dimanche';
      default: return '';
    }
  }

  String _getTypeAbreviation(String type) {
    switch (type) {
      case 'solennite': return 'SOL';
      case 'fete': return 'FÊT';
      case 'memoire': return 'MÉM';
      default: return '';
    }
  }

  Color _getCouleurLiturgique(String couleur) {
    switch (couleur) {
      case 'blanc': return Colors.white;
      case 'rouge': return Colors.red.shade600;
      case 'violet': return Colors.purple.shade600;
      case 'vert': return Colors.green.shade600;
      default: return Colors.grey;
    }
  }
}