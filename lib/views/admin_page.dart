// lib/views/admin_page.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:joe/data/prieres_data.dart';
import 'package:joe/data/neuvaines_data.dart';
import 'package:joe/data/enseignements_data.dart';
import 'package:joe/models/priere_model.dart';
import 'package:joe/models/neuvaine_model.dart';
import 'package:joe/models/enseignement_model.dart';
import 'package:joe/services/favoris_service.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'dart:io';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isAuthenticated = false;
  final TextEditingController _passwordController = TextEditingController();
  final String _adminPassword = 'admin123'; // À changer en production
  
  // Statistiques
  Map<String, int> _stats = {};
  
  // État des listes
  List<Priere> _prieres = [];
  List<Neuvaine> _neuvaines = [];
  List<Enseignement> _enseignements = [];
  
  // Contrôleurs pour les formulaires
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _sousTitreController = TextEditingController();
  final TextEditingController _auteurController = TextEditingController();
  final TextEditingController _extraitController = TextEditingController();
  final TextEditingController _contenuController = TextEditingController();
  final TextEditingController _categorieController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _versetController = TextEditingController();
  final TextEditingController _meditationController = TextEditingController();
  final TextEditingController _priereController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _couleurController = TextEditingController();
  
  // Listes pour les intentions/références
  List<String> _intentions = [];
  List<String> _references = [];
  final TextEditingController _intentionController = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();
  
  // Type d'édition en cours
  String _editMode = 'ajout'; // 'ajout' ou 'modification'
  String _currentType = ''; // 'priere', 'neuvaine', 'enseignement'
  dynamic _currentItem;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _chargerDonnees();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _passwordController.dispose();
    _idController.dispose();
    _titreController.dispose();
    _sousTitreController.dispose();
    _auteurController.dispose();
    _extraitController.dispose();
    _contenuController.dispose();
    _categorieController.dispose();
    _dateController.dispose();
    _versetController.dispose();
    _meditationController.dispose();
    _priereController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    _couleurController.dispose();
    _intentionController.dispose();
    _referenceController.dispose();
    super.dispose();
  }

  Future<void> _chargerDonnees() async {
    setState(() {
      _prieres = List.from(PrieresData.toutesLesPrieres);
      _neuvaines = List.from(NeuvainesData.toutesLesNeuvaines);
      _enseignements = List.from(EnseignementsData.tousLesEnseignements);
    });
    _calculerStats();
  }

  void _calculerStats() {
    setState(() {
      _stats = {
        'prieres': _prieres.length,
        'neuvaines': _neuvaines.length,
        'enseignements': _enseignements.length,
        'favoris': 0,
      };
    });
  }

Future<void> _resetApplication() async {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('⚠️ Réinitialisation'),
      content: const Text(
        'Êtes-vous sûr de vouloir réinitialiser toute l\'application ?\n'
        'Cette action est irréversible et supprimera toutes les données.'
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () async {
            // Réinitialiser SharedPreferences
            final prefs = await SharedPreferences.getInstance();
            await prefs.clear();
            
            // Réinitialiser les listes
            setState(() {
              _prieres.clear();
              _neuvaines.clear();
              _enseignements.clear();
              PrieresData.toutesLesPrieres.clear();
              NeuvainesData.toutesLesNeuvaines.clear();
              EnseignementsData.tousLesEnseignements.clear();
            });
            
            _calculerStats();
            Navigator.pop(context);
            
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('✅ Application réinitialisée'),
                backgroundColor: Colors.green,
              ),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text('Réinitialiser'),
        ),
      ],
    ),
  );
}
  void _resetForm() {
    _idController.clear();
    _titreController.clear();
    _sousTitreController.clear();
    _auteurController.clear();
    _extraitController.clear();
    _contenuController.clear();
    _categorieController.clear();
    _dateController.clear();
    _versetController.clear();
    _meditationController.clear();
    _priereController.clear();
    _descriptionController.clear();
    _imageUrlController.clear();
    _couleurController.clear();
    _intentions.clear();
    _references.clear();
    _intentionController.clear();
    _referenceController.clear();
  }

  void _login() {
    if (_passwordController.text == _adminPassword) {
      setState(() {
        _isAuthenticated = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Mot de passe incorrect'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _logout() {
    setState(() {
      _isAuthenticated = false;
      _passwordController.clear();
    });
  }

  // ==================== PRIÈRES ====================

  void _ajouterPriere() {
    if (_titreController.text.isEmpty || _contenuController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir les champs obligatoires')),
      );
      return;
    }

    final nouvellePriere = Priere(
      id: _idController.text.isNotEmpty ? _idController.text : 'priere_${DateTime.now().millisecondsSinceEpoch}',
      titre: _titreController.text,
      sousTitre: _sousTitreController.text,
      categorie: _categorieController.text.isNotEmpty ? _categorieController.text : 'autres',
      texte: _contenuController.text,
      intentions: _intentions.isNotEmpty ? _intentions : null,
      audioUrl: null,
      estFavori: false,
    );

    setState(() {
      _prieres.add(nouvellePriere);
      // Mettre à jour les données statiques (dans une vraie app, ce serait une base de données)
      PrieresData.toutesLesPrieres.add(nouvellePriere);
    });

    _resetForm();
    Navigator.pop(context);
    _calculerStats();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('✅ Prière ajoutée : ${nouvellePriere.titre}')),
    );
  }

  void _modifierPriere(Priere priere) {
    setState(() {
      priere.titre = _titreController.text;
      priere.sousTitre = _sousTitreController.text;
      priere.categorie = _categorieController.text;
      priere.texte = _contenuController.text;
      priere.intentions = _intentions.isNotEmpty ? _intentions : null;
    });

    _resetForm();
    Navigator.pop(context);
    _calculerStats();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('✅ Prière modifiée : ${priere.titre}')),
    );
  }

  void _supprimerPriere(Priere priere) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmation'),
        content: Text('Supprimer la prière "${priere.titre}" ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _prieres.remove(priere);
                PrieresData.toutesLesPrieres.remove(priere);
              });
              Navigator.pop(context);
              _calculerStats();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('✅ Prière supprimée')),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }

  // ==================== NEUVAINES ====================

  void _ajouterNeuvaine() {
    if (_titreController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez entrer un titre')),
      );
      return;
    }

    // Créer une neuvaine simple (pour une vraie app, il faudrait un formulaire plus complexe)
    final nouvelleNeuvaine = Neuvaine(
      id: 'neuvaine_${DateTime.now().millisecondsSinceEpoch}',
      titre: _titreController.text,
      description: _descriptionController.text.isNotEmpty ? _descriptionController.text : 'Nouvelle neuvaine',
      imageUrl: _imageUrlController.text.isNotEmpty ? _imageUrlController.text : 'assets/images/neuvaine_default.jpg',
      couleurHex: _couleurController.text.isNotEmpty ? _couleurController.text : '0xFF4A6FA5',
      jours: [], // À compléter
    );

    setState(() {
      _neuvaines.add(nouvelleNeuvaine);
      NeuvainesData.toutesLesNeuvaines.add(nouvelleNeuvaine);
    });

    _resetForm();
    Navigator.pop(context);
    _calculerStats();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('✅ Neuvaine ajoutée : ${nouvelleNeuvaine.titre}')),
    );
  }

  void _supprimerNeuvaine(Neuvaine neuvaine) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmation'),
        content: Text('Supprimer la neuvaine "${neuvaine.titre}" ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _neuvaines.remove(neuvaine);
                NeuvainesData.toutesLesNeuvaines.remove(neuvaine);
              });
              Navigator.pop(context);
              _calculerStats();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('✅ Neuvaine supprimée')),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }

  // ==================== ENSEIGNEMENTS ====================

  void _ajouterEnseignement() {
    if (_titreController.text.isEmpty || _auteurController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir les champs obligatoires')),
      );
      return;
    }

    final nouvelEnseignement = Enseignement(
      id: 'ens_${DateTime.now().millisecondsSinceEpoch}',
      titre: _titreController.text,
      auteur: _auteurController.text,
      extrait: _extraitController.text.isNotEmpty ? _extraitController.text : _contenuController.text.substring(0, min(100, _contenuController.text.length)) + '...',
      contenu: _contenuController.text.isNotEmpty ? _contenuController.text : 'Contenu à venir',
      categorie: _categorieController.text.isNotEmpty ? _categorieController.text : 'Divers',
      date: _dateController.text.isNotEmpty ? _dateController.text : DateTime.now().year.toString(),
      imageUrl: _imageUrlController.text.isNotEmpty ? _imageUrlController.text : 'assets/images/default.jpg',
      references: _references,
    );

    setState(() {
      _enseignements.add(nouvelEnseignement);
      EnseignementsData.tousLesEnseignements.add(nouvelEnseignement);
    });

    _resetForm();
    Navigator.pop(context);
    _calculerStats();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('✅ Enseignement ajouté : ${nouvelEnseignement.titre}')),
    );
  }

  void _modifierEnseignement(Enseignement ens) {
    setState(() {
      ens.titre = _titreController.text;
      ens.auteur = _auteurController.text;
      ens.extrait = _extraitController.text;
      ens.contenu = _contenuController.text;
      ens.categorie = _categorieController.text;
      ens.date = _dateController.text;
      ens.references = _references;
    });

    _resetForm();
    Navigator.pop(context);
    _calculerStats();
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('✅ Enseignement modifié : ${ens.titre}')),
    );
  }

  void _supprimerEnseignement(Enseignement ens) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmation'),
        content: Text('Supprimer "${ens.titre}" ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _enseignements.remove(ens);
                EnseignementsData.tousLesEnseignements.remove(ens);
              });
              Navigator.pop(context);
              _calculerStats();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('✅ Enseignement supprimé')),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );
  }

  // ==================== FORMULAIRES ====================

  void _showPriereForm({Priere? priere}) {
    if (priere != null) {
      _titreController.text = priere.titre;
      _sousTitreController.text = priere.sousTitre;
      _categorieController.text = priere.categorie;
      _contenuController.text = priere.texte;
      _intentions = priere.intentions ?? [];
    } else {
      _resetForm();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(priere == null ? 'Ajouter une prière' : 'Modifier la prière'),
        content: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titreController,
                  decoration: const InputDecoration(labelText: 'Titre *', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _sousTitreController,
                  decoration: const InputDecoration(labelText: 'Sous-titre', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _categorieController,
                  decoration: const InputDecoration(labelText: 'Catégorie', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _contenuController,
                  maxLines: 8,
                  decoration: const InputDecoration(labelText: 'Texte de la prière *', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 8),
                const Text('Intentions (optionnel) :'),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _intentionController,
                        decoration: const InputDecoration(
                          hintText: 'Ajouter une intention',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.green),
                      onPressed: () {
                        if (_intentionController.text.isNotEmpty) {
                          setState(() {
                            _intentions.add(_intentionController.text);
                            _intentionController.clear();
                          });
                        }
                      },
                    ),
                  ],
                ),
                Wrap(
                  spacing: 4,
                  children: _intentions.map((i) => Chip(
                    label: Text(i),
                    onDeleted: () {
                      setState(() {
                        _intentions.remove(i);
                      });
                    },
                  )).toList(),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _resetForm();
              Navigator.pop(context);
            },
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              if (priere == null) {
                _ajouterPriere();
              } else {
                _modifierPriere(priere);
              }
            },
            child: Text(priere == null ? 'Ajouter' : 'Modifier'),
          ),
        ],
      ),
    );
  }

  void _showNeuvaineForm({Neuvaine? neuvaine}) {
    if (neuvaine != null) {
      _titreController.text = neuvaine.titre;
      _descriptionController.text = neuvaine.description;
      _imageUrlController.text = neuvaine.imageUrl;
      _couleurController.text = neuvaine.couleurHex;
    } else {
      _resetForm();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(neuvaine == null ? 'Ajouter une neuvaine' : 'Modifier la neuvaine'),
        content: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titreController,
                  decoration: const InputDecoration(labelText: 'Titre *', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: const InputDecoration(labelText: 'Description', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _imageUrlController,
                  decoration: const InputDecoration(labelText: 'Image URL', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _couleurController,
                  decoration: const InputDecoration(labelText: 'Couleur hex (ex: 0xFF4A6FA5)', border: OutlineInputBorder()),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _resetForm();
              Navigator.pop(context);
            },
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: _ajouterNeuvaine,
            child: Text(neuvaine == null ? 'Ajouter' : 'Modifier'),
          ),
        ],
      ),
    );
  }

  void _showEnseignementForm({Enseignement? enseignement}) {
    if (enseignement != null) {
      _titreController.text = enseignement.titre;
      _auteurController.text = enseignement.auteur;
      _extraitController.text = enseignement.extrait;
      _contenuController.text = enseignement.contenu;
      _categorieController.text = enseignement.categorie;
      _dateController.text = enseignement.date;
      _imageUrlController.text = enseignement.imageUrl;
      _references = List.from(enseignement.references);
    } else {
      _resetForm();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(enseignement == null ? 'Ajouter un enseignement' : 'Modifier l\'enseignement'),
        content: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titreController,
                  decoration: const InputDecoration(labelText: 'Titre *', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _auteurController,
                  decoration: const InputDecoration(labelText: 'Auteur *', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _extraitController,
                  maxLines: 2,
                  decoration: const InputDecoration(labelText: 'Extrait', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _contenuController,
                  maxLines: 5,
                  decoration: const InputDecoration(labelText: 'Contenu', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _categorieController,
                  decoration: const InputDecoration(labelText: 'Catégorie', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(labelText: 'Date', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 8),
                const Text('Références :'),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _referenceController,
                        decoration: const InputDecoration(
                          hintText: 'Ajouter une référence',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.green),
                      onPressed: () {
                        if (_referenceController.text.isNotEmpty) {
                          setState(() {
                            _references.add(_referenceController.text);
                            _referenceController.clear();
                          });
                        }
                      },
                    ),
                  ],
                ),
                Wrap(
                  spacing: 4,
                  children: _references.map((r) => Chip(
                    label: Text(r),
                    onDeleted: () {
                      setState(() {
                        _references.remove(r);
                      });
                    },
                  )).toList(),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _resetForm();
              Navigator.pop(context);
            },
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              if (enseignement == null) {
                _ajouterEnseignement();
              } else {
                _modifierEnseignement(enseignement);
              }
            },
            child: Text(enseignement == null ? 'Ajouter' : 'Modifier'),
          ),
        ],
      ),
    );
  }

  // ==================== EXPORT/IMPORT ====================

  Future<void> _exporterDonnees() async {
    try {
      Map<String, dynamic> exportData = {
        'prieres': _prieres.map((p) => p.toJson()).toList(),
        'neuvaines': _neuvaines.map((n) => n.toJson()).toList(),
        'enseignements': _enseignements.map((e) => e.toJson()).toList(),
        'stats': _stats,
        'exportDate': DateTime.now().toIso8601String(),
      };

      String jsonString = jsonEncode(exportData);
      
      String? filePath = await FilePicker.platform.saveFile(
        dialogTitle: 'Exporter les données',
        fileName: 'saint_joseph_backup_${DateTime.now().millisecondsSinceEpoch}.json',
      );

      if (filePath != null) {
        File file = File(filePath);
        await file.writeAsString(jsonString);
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ Données exportées vers $filePath'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('❌ Erreur export: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _importerDonnees() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result != null) {
        String filePath = result.files.single.path!;
        File file = File(filePath);
        String jsonString = await file.readAsString();
        Map<String, dynamic> importData = jsonDecode(jsonString);

        if (importData.containsKey('prieres')) {
          final importedPrieres = (importData['prieres'] as List)
              .map((j) => Priere.fromJson(j))
              .toList();
          setState(() {
            _prieres = importedPrieres;
            PrieresData.toutesLesPrieres.clear();
            PrieresData.toutesLesPrieres.addAll(importedPrieres);
          });
        }

        if (importData.containsKey('neuvaines')) {
          final importedNeuvaines = (importData['neuvaines'] as List)
              .map((j) => Neuvaine.fromJson(j))
              .toList();
          setState(() {
            _neuvaines = importedNeuvaines;
            NeuvainesData.toutesLesNeuvaines.clear();
            NeuvainesData.toutesLesNeuvaines.addAll(importedNeuvaines);
          });
        }

        if (importData.containsKey('enseignements')) {
          final importedEnseignements = (importData['enseignements'] as List)
              .map((j) => Enseignement.fromJson(j))
              .toList();
          setState(() {
            _enseignements = importedEnseignements;
            EnseignementsData.tousLesEnseignements.clear();
            EnseignementsData.tousLesEnseignements.addAll(importedEnseignements);
          });
        }

        _calculerStats();
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('✅ Données importées avec succès'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('❌ Erreur import: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // ==================== INTERFACE ====================

  @override
  Widget build(BuildContext context) {
    if (!_isAuthenticated) {
      return _buildLoginScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Administration'),
        backgroundColor: Colors.brown,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Tableau de bord'),
            Tab(text: 'Prières'),
            Tab(text: 'Neuvaines'),
            Tab(text: 'Enseignements'),
            Tab(text: 'Utilisateurs'),
            Tab(text: 'Sauvegarde'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDashboard(),
          _buildPrieresManager(),
          _buildNeuvainesManager(),
          _buildEnseignementsManager(),
          _buildUsersManager(),
          _buildBackupManager(),
        ],
      ),
    );
  }

// Écran de connexion corrigé
Widget _buildLoginScreen() {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Administration - Connexion'),
      backgroundColor: Colors.brown,
    ),
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.brown.shade50, Colors.white],
        ),
      ),
      child: Center(
        child: SingleChildScrollView( // Permet le défilement si nécessaire
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Important !
                  children: [
                    const Icon(
                      Icons.admin_panel_settings,
                      size: 80,
                      color: Colors.brown,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Accès Administrateur',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onSubmitted: (_) => _login(),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Se connecter',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

  Widget _buildDashboard() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.brown.shade50, Colors.white],
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tableau de bord',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.0,
              children: [
                _buildStatCard('Prières', '${_stats['prieres'] ?? 0}', Icons.menu_book, Colors.blue),
                _buildStatCard('Neuvaines', '${_stats['neuvaines'] ?? 0}', Icons.calendar_today, Colors.green),
                _buildStatCard('Enseignements', '${_stats['enseignements'] ?? 0}', Icons.school, Colors.purple),
                _buildStatCard('Total', '${_stats['prieres']! + _stats['neuvaines']! + _stats['enseignements']!}', Icons.storage, Colors.orange),
              ],
            ),
            
            const SizedBox(height: 30),
            
            const Text(
              'Actions rapides',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildQuickAction('Ajouter une prière', Icons.add, Colors.blue, () => _showPriereForm()),
                _buildQuickAction('Ajouter une neuvaine', Icons.add, Colors.green, () => _showNeuvaineForm()),
                _buildQuickAction('Ajouter un enseignement', Icons.add, Colors.purple, () => _showEnseignementForm()),
                _buildQuickAction('Exporter données', Icons.download, Colors.teal, _exporterDonnees),
                _buildQuickAction('Importer données', Icons.upload, Colors.orange, _importerDonnees),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Text(title, style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickAction(String label, IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(label, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }

  Widget _buildPrieresManager() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.brown.shade50, Colors.white],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Text(
                  'Gestion des prières',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () => _showPriereForm(),
                  icon: const Icon(Icons.add),
                  label: const Text('Ajouter'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            ),
          ),
          // ... (suite du code précédent)

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _prieres.length,
              itemBuilder: (context, index) {
                final priere = _prieres[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue.shade100,
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                      priere.titre,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(priere.sousTitre),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            priere.categorie,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.blue.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _showPriereForm(priere: priere),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _supprimerPriere(priere),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNeuvainesManager() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.brown.shade50, Colors.white],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Text(
                  'Gestion des neuvaines',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () => _showNeuvaineForm(),
                  icon: const Icon(Icons.add),
                  label: const Text('Ajouter'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _neuvaines.length,
              itemBuilder: (context, index) {
                final neuvaine = _neuvaines[index];
                Color couleur;
                try {
                  couleur = Color(int.parse(neuvaine.couleurHex));
                } catch (e) {
                  couleur = Colors.brown;
                }
                
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: couleur.withOpacity(0.2),
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                      neuvaine.titre,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${neuvaine.jours.length} jours'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _showNeuvaineForm(neuvaine: neuvaine),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _supprimerNeuvaine(neuvaine),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnseignementsManager() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.brown.shade50, Colors.white],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Text(
                  'Gestion des enseignements',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () => _showEnseignementForm(),
                  icon: const Icon(Icons.add),
                  label: const Text('Ajouter'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _enseignements.length,
              itemBuilder: (context, index) {
                final enseignement = _enseignements[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple.shade100,
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                      enseignement.titre,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(enseignement.auteur),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.purple.shade50,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            enseignement.categorie,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.purple.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _showEnseignementForm(enseignement: enseignement),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _supprimerEnseignement(enseignement),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUsersManager() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.brown.shade50, Colors.white],
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const ListTile(
                      leading: CircleAvatar(child: Icon(Icons.person, color: Colors.brown)),
                      title: Text('Utilisateur par défaut'),
                      subtitle: Text('ID: user_001'),
                    ),
                    const Divider(),
                    const ListTile(
                      leading: CircleAvatar(child: Icon(Icons.settings, color: Colors.blue)),
                      title: Text('Préférences utilisateur'),
                      subtitle: Text('Thème, rappels, notifications'),
                    ),
                    const Divider(),
                    const ListTile(
                      leading: CircleAvatar(child: Icon(Icons.notifications, color: Colors.orange)),
                      title: Text('Statut des rappels'),
                      subtitle: Text('Actifs: 2 - Inactifs: 1'),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Préférences réinitialisées')),
                              );
                            },
                            icon: const Icon(Icons.settings_backup_restore),
                            label: const Text('Réinitialiser'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Tous les rappels désactivés')),
                              );
                            },
                            icon: const Icon(Icons.notifications_off),
                            label: const Text('Désactiver tout'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Statistiques utilisateurs',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    _buildStatRow('Utilisateurs actifs', '1', Icons.person, Colors.green),
                    _buildStatRow('Neuvaines en cours', '3', Icons.calendar_today, Colors.blue),
                    _buildStatRow('Rappels actifs', '5', Icons.notifications_active, Colors.orange),
                    _buildStatRow('Favoris total', '12', Icons.favorite, Colors.red),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(fontSize: 14)),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackupManager() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.brown.shade50, Colors.white],
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Icon(Icons.cloud_upload, size: 80, color: Colors.blue),
                    const SizedBox(height: 16),
                    const Text(
                      'Sauvegarde des données',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Exportez toutes les données pour les sauvegarder',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _exporterDonnees,
                            icon: const Icon(Icons.download),
                            label: const Text('Exporter'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _importerDonnees,
                            icon: const Icon(Icons.upload),
                            label: const Text('Importer'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Icon(Icons.info, size: 60, color: Colors.blue),
                    const SizedBox(height: 16),
                    const Text(
                      'Informations de sauvegarde',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow('Prières', '${_prieres.length}'),
                    _buildInfoRow('Neuvaines', '${_neuvaines.length}'),
                    _buildInfoRow('Enseignements', '${_enseignements.length}'),
                    _buildInfoRow('Dernière sauvegarde', 'Jamais'),
                    _buildInfoRow('Taille estimée', '~${_prieres.length * 2 + _neuvaines.length * 5 + _enseignements.length * 3} Ko'),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Icon(Icons.warning, size: 60, color: Colors.red),
                    const SizedBox(height: 16),
                    const Text(
                      'Zone de danger',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Réinitialiser complètement l\'application',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Cette action supprimera toutes les données utilisateur et réinitialisera les préférences.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _resetApplication,
                        icon: const Icon(Icons.refresh),
                        label: const Text('RÉINITIALISER L\'APPLICATION'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  // Fonction utilitaire min pour l'extrait
  int min(int a, int b) => a < b ? a : b;
}