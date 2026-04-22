import 'package:flutter/material.dart';
import 'package:joe/models/priere_model.dart';
import 'package:joe/data/prieres_data.dart';
import 'package:joe/views/priere_detail_page.dart';

class PrieresPage extends StatefulWidget {
  @override
  _PrieresPageState createState() => _PrieresPageState();
}

class _PrieresPageState extends State<PrieresPage> {
  final TextEditingController _searchController = TextEditingController();
  String _recherche = '';
  String _categorieSelectionnee = 'Toutes';
  bool _isSearching = false;
  
  List<String> _categories = [
    'Toutes',
    'quotidiennes',
    'intentions',
    'traditionnelles',
    'litanies'
  ];

  Map<String, String> _categorieIcons = {
    'Toutes': '📖',
    'quotidiennes': '🌅',
    'intentions': '🙏',
    'traditionnelles': '📜',
    'litanies': '✨',
  };

  Map<String, String> _categorieTitres = {
    'Toutes': 'Toutes les prières',
    'quotidiennes': 'Prières quotidiennes',
    'intentions': 'Intentions spéciales',
    'traditionnelles': 'Prières traditionnelles',
    'litanies': 'Litanies',
  };

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _recherche = _searchController.text;
      _isSearching = _recherche.isNotEmpty;
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _recherche = '';
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Priere> prieresFiltrees = _getPrieresFiltrees();

    return Scaffold(
      appBar: AppBar(
        title: Text('Prières à Saint Joseph'),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          // Barre de recherche intégrée
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Rechercher une prière...',
                prefixIcon: const Icon(Icons.search, color: Colors.brown),
                suffixIcon: _isSearching
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: _clearSearch,
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
                fillColor: Colors.grey.shade50,
              ),
            ),
          ),

          // Barre des catégories
          Container(
            height: 50,
            color: Colors.white,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                String categorie = _categories[index];
                bool isSelected = _categorieSelectionnee == categorie;
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: FilterChip(
                    label: Text(
                      '${_categorieIcons[categorie]} ${_categorieTitres[categorie]}',
                      style: TextStyle(
                        fontSize: 12,
                        color: isSelected ? Colors.white : Colors.brown[800],
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _categorieSelectionnee = categorie;
                      });
                    },
                    backgroundColor: Colors.brown[50],
                    selectedColor: Colors.brown,
                    checkmarkColor: Colors.white,
                  ),
                );
              },
            ),
          ),

          // Indicateur de recherche
          if (_isSearching)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.amber.shade50,
              child: Row(
                children: [
                  Text(
                    'Résultats pour : "${_recherche}"',
                    style: TextStyle(
                      color: Colors.amber.shade800,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${prieresFiltrees.length} trouvée(s)',
                    style: TextStyle(
                      color: Colors.amber.shade800,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

          // Liste des prières
          Expanded(
            child: prieresFiltrees.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _isSearching ? Icons.search_off : Icons.menu_book,
                          size: 80,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _isSearching
                              ? 'Aucune prière trouvée'
                              : 'Aucune prière disponible',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        if (_isSearching) ...[
                          const SizedBox(height: 8),
                          Text(
                            'Essayez avec d\'autres mots-clés',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: prieresFiltrees.length,
                    itemBuilder: (context, index) {
                      return _buildPriereCard(prieresFiltrees[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriereCard(Priere priere) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PriereDetailPage(priere: priere),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Icône ou image
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.brown[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    _getIconForPriere(priere),
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              
              // Contenu
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Titre avec surlignage si recherche
                    _buildHighlightedText(
                      priere.titre,
                      _recherche,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown[800],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      priere.sousTitre,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    if (priere.intentions != null) ...[
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        children: priere.intentions!.take(2).map((intention) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.amber[50],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.amber[200]!),
                            ),
                            child: _buildHighlightedText(
                              intention,
                              _recherche,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.amber[800],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ],
                ),
              ),
              
              // Audio et favori
              Column(
                children: [
                  if (priere.audioUrl != null)
                  /*  const Icon(
                      Icons.volume_up,
                      color: Colors.brown,
                      size: 20,
                    ),*/
                  const SizedBox(height: 8),
                  IconButton(
                    icon: Icon(
                      priere.estFavori
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: priere.estFavori ? Colors.red : Colors.grey,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        priere.estFavori = !priere.estFavori;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            priere.estFavori
                                ? 'Ajouté aux favoris ❤️'
                                : 'Retiré des favoris',
                          ),
                          backgroundColor: priere.estFavori ? Colors.red : Colors.grey,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget pour surligner les termes recherchés
  Widget _buildHighlightedText(String text, String query, {required TextStyle style}) {
    if (query.isEmpty || !text.toLowerCase().contains(query.toLowerCase())) {
      return Text(text, style: style);
    }
    
    List<TextSpan> spans = [];
    int start = 0;
    int indexOfHighlight;
    
    do {
      indexOfHighlight = text.toLowerCase().indexOf(query.toLowerCase(), start);
      if (indexOfHighlight == -1) {
        spans.add(TextSpan(text: text.substring(start), style: style));
        break;
      }
      
      if (indexOfHighlight > start) {
        spans.add(TextSpan(
          text: text.substring(start, indexOfHighlight),
          style: style,
        ));
      }
      
      spans.add(TextSpan(
        text: text.substring(indexOfHighlight, indexOfHighlight + query.length),
        style: style.copyWith(
          backgroundColor: Colors.amber.shade200,
          fontWeight: FontWeight.bold,
        ),
      ));
      
      start = indexOfHighlight + query.length;
    } while (indexOfHighlight != -1);
    
    return RichText(
      text: TextSpan(children: spans),
    );
  }

  String _getIconForPriere(Priere priere) {
    switch (priere.categorie) {
      case 'quotidiennes':
        return '🌅';
      case 'intentions':
        return '🙏';
      case 'traditionnelles':
        return '📜';
      case 'litanies':
        return '✨';
      default:
        return '📖';
    }
  }

  List<Priere> _getPrieresFiltrees() {
    List<Priere> prieres = PrieresData.toutesLesPrieres;

    // Filtre par catégorie
    if (_categorieSelectionnee != 'Toutes') {
      prieres = prieres
          .where((p) => p.categorie == _categorieSelectionnee)
          .toList();
    }

    // Filtre par recherche
    if (_recherche.isNotEmpty) {
      prieres = prieres.where((p) {
        return p.titre.toLowerCase().contains(_recherche.toLowerCase()) ||
            p.texte.toLowerCase().contains(_recherche.toLowerCase()) ||
            (p.intentions?.any((i) => i.toLowerCase().contains(_recherche.toLowerCase())) ?? false);
      }).toList();
    }

    return prieres;
  }
}