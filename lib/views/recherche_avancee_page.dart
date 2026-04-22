// lib/views/recherche_avancee_page.dart
import 'package:flutter/material.dart';
import 'package:joe/services/recherche_service.dart';
import 'package:joe/models/priere_model.dart';
import 'package:joe/models/enseignement_model.dart';
import 'package:joe/models/oeuvre_modele.dart';
import 'package:joe/views/priere_detail_page.dart';
import 'package:joe/views/enseignement_detail_page.dart';

class RechercheAvanceePage extends StatefulWidget {
  @override
  _RechercheAvanceePageState createState() => _RechercheAvanceePageState();
}

class _RechercheAvanceePageState extends State<RechercheAvanceePage> 
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  
  // Filtres
  List<String> _categoriesPriere = ['Toutes'];
  List<String> _categoriesEnseignement = ['Tous'];
  List<String> _themesMeditation = ['Tous'];
  List<String> _typesOeuvre = ['Tous'];
  
  bool _recherchePrieres = true;
  bool _rechercheEnseignements = true;
  bool _rechercheMeditations = true;
  bool _rechercheOeuvres = true;
  
  bool _showFilters = false;
  ResultatsRecherche? _resultats;
  List<String> _popularTags = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _loadPopularTags();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _loadPopularTags() {
    setState(() {
      _popularTags = RechercheService.getAllTags().take(20).toList();
    });
  }

  void _effectuerRecherche() {
    if (_searchController.text.trim().isEmpty) return;

    setState(() {
      _resultats = RechercheService.rechercher(
        requete: _searchController.text,
        categoriesPriere: _categoriesPriere,
        categoriesEnseignement: _categoriesEnseignement,
        themesMeditation: _themesMeditation,
        typesOeuvre: _typesOeuvre,
        recherchePrieres: _recherchePrieres,
        rechercheEnseignements: _rechercheEnseignements,
        rechercheMeditations: _rechercheMeditations,
        rechercheOeuvres: _rechercheOeuvres,
      );
    });
  }

  void _rechercherParTag(String tag) {
    setState(() {
      _searchController.text = tag;
      _resultats = RechercheService.rechercherParTag(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recherche avancée'),
        backgroundColor: Colors.brown,
        bottom: _resultats != null
            ? TabBar(
                controller: _tabController,
                tabs: [
                  Tab(text: 'Prières (${_resultats!.prieres.length})'),
                  Tab(text: 'Enseignements (${_resultats!.enseignements.length})'),
                  Tab(text: 'Œuvres (${_resultats!.oeuvres.length})'),
                ],
              )
            : null,
        actions: [
          IconButton(
            icon: Icon(_showFilters ? Icons.filter_list_off : Icons.filter_list),
            onPressed: () {
              setState(() {
                _showFilters = !_showFilters;
              });
            },
          ),
        ],
      ),
      body: Container(
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
            // Barre de recherche
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Rechercher...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onSubmitted: (_) => _effectuerRecherche(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _effectuerRecherche,
                    child: const Text('OK'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    ),
                  ),
                ],
              ),
            ),

            // Filtres (défilants si trop longs)
            if (_showFilters) 
              Container(
                height: 250, // Hauteur fixe pour les filtres
                child: SingleChildScrollView(
                  child: _buildFilters(),
                ),
              ),

            // Tags populaires
            if (_resultats == null) 
              Expanded(child: _buildPopularTags()),

            // Résultats
            if (_resultats != null) 
              Expanded(
                child: _resultats!.isEmpty
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
                              'Essayez d\'autres mots-clés',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      )
                    : TabBarView(
                        controller: _tabController,
                        children: [
                          _buildPrieresList(_resultats!.prieres),
                          _buildEnseignementsList(_resultats!.enseignements),
                          _buildOeuvresList(_resultats!.oeuvres),
                        ],
                      ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Filtres',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          
          // Types de contenu
          const Text('Rechercher dans :'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              FilterChip(
                label: const Text('Prières'),
                selected: _recherchePrieres,
                onSelected: (value) {
                  setState(() {
                    _recherchePrieres = value;
                  });
                },
              ),
              FilterChip(
                label: const Text('Enseignements'),
                selected: _rechercheEnseignements,
                onSelected: (value) {
                  setState(() {
                    _rechercheEnseignements = value;
                  });
                },
              ),
              FilterChip(
                label: const Text('Méditations'),
                selected: _rechercheMeditations,
                onSelected: (value) {
                  setState(() {
                    _rechercheMeditations = value;
                  });
                },
              ),
              FilterChip(
                label: const Text('Œuvres'),
                selected: _rechercheOeuvres,
                onSelected: (value) {
                  setState(() {
                    _rechercheOeuvres = value;
                  });
                },
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Catégories de prières
          const Text('Catégories de prières :'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 4,
            children: RechercheService.categoriesPrieres.map((cat) {
              return FilterChip(
                label: Text(cat),
                selected: _categoriesPriere.contains(cat),
                onSelected: (selected) {
                  setState(() {
                    if (cat == 'Toutes') {
                      _categoriesPriere = ['Toutes'];
                    } else {
                      _categoriesPriere.remove('Toutes');
                      if (selected) {
                        _categoriesPriere.add(cat);
                      } else {
                        _categoriesPriere.remove(cat);
                      }
                      if (_categoriesPriere.isEmpty) {
                        _categoriesPriere = ['Toutes'];
                      }
                    }
                  });
                },
              );
            }).toList(),
          ),
          
          const SizedBox(height: 16),
          
          // Types d'œuvres
          const Text('Types d\'œuvres :'),
          const SizedBox(height: 8),
          Wrap(
            spacing: 4,
            children: RechercheService.typesOeuvres.map((type) {
              return FilterChip(
                label: Text(type),
                selected: _typesOeuvre.contains(type),
                onSelected: (selected) {
                  setState(() {
                    if (type == 'Tous') {
                      _typesOeuvre = ['Tous'];
                    } else {
                      _typesOeuvre.remove('Tous');
                      if (selected) {
                        _typesOeuvre.add(type);
                      } else {
                        _typesOeuvre.remove(type);
                      }
                      if (_typesOeuvre.isEmpty) {
                        _typesOeuvre = ['Tous'];
                      }
                    }
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularTags() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Tags populaires',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.brown.shade800,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 2,
            ),
            itemCount: _popularTags.length,
            itemBuilder: (context, index) {
              final tag = _popularTags[index];
              return InkWell(
                onTap: () => _rechercherParTag(tag),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.brown.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      tag,
                      style: TextStyle(
                        color: Colors.brown.shade800,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPrieresList(List<Priere> prieres) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: prieres.length,
      itemBuilder: (context, index) {
        final priere = prieres[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.brown.shade100,
              child: const Icon(Icons.menu_book, color: Colors.brown),
            ),
            title: Text(priere.titre),
            subtitle: Text(priere.sousTitre),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PriereDetailPage(priere: priere),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildEnseignementsList(List<Enseignement> enseignements) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: enseignements.length,
      itemBuilder: (context, index) {
        final ens = enseignements[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade100,
              child: const Icon(Icons.school, color: Colors.green),
            ),
            title: Text(ens.titre),
            subtitle: Text(ens.auteur),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EnseignementDetail(enseignement: ens),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildOeuvresList(List<OeuvreArt> oeuvres) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: oeuvres.length,
      itemBuilder: (context, index) {
        final oeuvre = oeuvres[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.image, color: Colors.amber),
            ),
            title: Text(oeuvre.titre),
            subtitle: Text('${oeuvre.artiste} - ${oeuvre.annee}'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Afficher le détail de l'œuvre
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(oeuvre.titre),
                  backgroundColor: Colors.amber.shade700,
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
        );
      },
    );
  }
}