// lib/views/neuvaine_detail_page.dart
import 'package:flutter/material.dart';
import 'package:joe/models/neuvaine_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:joe/services/rappel_neuvaine_service.dart';
import 'package:share_plus/share_plus.dart';

class NeuvaineDetailPage extends StatefulWidget {
  final Neuvaine neuvaine;

  const NeuvaineDetailPage({Key? key, required this.neuvaine}) : super(key: key);

  @override
  _NeuvaineDetailPageState createState() => _NeuvaineDetailPageState();
}

class _NeuvaineDetailPageState extends State<NeuvaineDetailPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late int _jourActuel;
  bool _isLoading = false;
  final TextEditingController _notesController = TextEditingController();
  late Neuvaine _neuvaine;
  DateTime _derniereSauvegarde = DateTime.now();
  bool _rappelActif = false;

  // Clés pour SharedPreferences
  static const String NOTES_PREFIX = 'neuvaine_notes_';
  static const String JOUR_PREFIX = 'neuvaine_jour_';
  static const String EN_COURS_PREFIX = 'neuvaine_en_cours_';
  static const String RAPPEL_PREFIX = 'neuvaine_rappel_';

  @override
  void initState() {
    super.initState();
    _neuvaine = widget.neuvaine;
    _jourActuel = _neuvaine.jourActuel;
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    _chargerNotes();
    _chargerProgression().then((_) {
      _initialiserEtatEnCours();
      _verifierEtatRappel();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  // Charger les notes sauvegardées
  Future<void> _chargerNotes() async {
    final prefs = await SharedPreferences.getInstance();
    String savedNotes = prefs.getString('$NOTES_PREFIX${_neuvaine.id}_${_jourActuel}') ?? '';
    int savedTimestamp = prefs.getInt('${NOTES_PREFIX}timestamp_${_neuvaine.id}_${_jourActuel}') ?? 0;
    
    setState(() {
      _notesController.text = savedNotes;
      if (savedTimestamp > 0) {
        _derniereSauvegarde = DateTime.fromMillisecondsSinceEpoch(savedTimestamp);
      }
    });
  }

  // Sauvegarder les notes
  Future<void> _sauvegarderNotes() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      '$NOTES_PREFIX${_neuvaine.id}_${_jourActuel}',
      _notesController.text,
    );
    await prefs.setInt(
      '${NOTES_PREFIX}timestamp_${_neuvaine.id}_${_jourActuel}',
      DateTime.now().millisecondsSinceEpoch,
    );
    
    setState(() {
      _derniereSauvegarde = DateTime.now();
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            const Expanded(
              child: Text(
                'Notes sauvegardées',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  // Charger la progression
  Future<void> _chargerProgression() async {
    final prefs = await SharedPreferences.getInstance();
    int savedJour = prefs.getInt('$JOUR_PREFIX${_neuvaine.id}') ?? _neuvaine.jourActuel;
    bool enCours = prefs.getBool('$EN_COURS_PREFIX${_neuvaine.id}') ?? _neuvaine.enCours;
    
    setState(() {
      _jourActuel = savedJour;
      _neuvaine.jourActuel = savedJour;
      _neuvaine.enCours = enCours;
    });
  }

  // Initialiser l'état enCours au chargement
  Future<void> _initialiserEtatEnCours() async {
    final prefs = await SharedPreferences.getInstance();
    bool enCours = prefs.getBool('$EN_COURS_PREFIX${_neuvaine.id}') ?? false;
    
    if (_jourActuel > 0 && !enCours) {
      enCours = true;
      await prefs.setBool('$EN_COURS_PREFIX${_neuvaine.id}', true);
    }
    
    setState(() {
      _neuvaine.enCours = enCours;
    });
  }

  // Sauvegarder la progression
  Future<void> _sauvegarderProgression() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('$JOUR_PREFIX${_neuvaine.id}', _jourActuel);
    await prefs.setBool('$EN_COURS_PREFIX${_neuvaine.id}', _neuvaine.enCours);
  }

  // Sauvegarder l'état enCours
  Future<void> _sauvegarderEtatEnCours(bool enCours) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('$EN_COURS_PREFIX${_neuvaine.id}', enCours);
  }

  // Marquer le jour comme complété
  Future<void> _marquerJourComplete() async {
    setState(() {
      if (_jourActuel < _neuvaine.jours.length - 1) {
        _jourActuel++;
        _neuvaine.jourActuel = _jourActuel;
        _neuvaine.enCours = true;
        _tabController.animateTo(0);
        _chargerNotes();
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text('Jour $_jourActuel complété !'),
                ),
              ],
            ),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(16),
          ),
        );
      } else if (_jourActuel == _neuvaine.jours.length - 1) {
        _neuvaine.enCours = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.celebration, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text('Félicitations ! Neuvaine terminée ! 🎉'),
                ),
              ],
            ),
            backgroundColor: Colors.purple,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 3),
            margin: const EdgeInsets.all(16),
          ),
        );
      }
    });
    
    await _sauvegarderProgression();
    await _sauvegarderEtatEnCours(_neuvaine.enCours);
  }

  // Vérifier l'état du rappel
  Future<void> _verifierEtatRappel() async {
    final actif = await RappelNeuvaineService.estRappelActif(_neuvaine.id);
    setState(() {
      _rappelActif = actif;
    });
  }

  // Activer/désactiver le rappel
  Future<void> _toggleRappel() async {
    final bool actif = await RappelNeuvaineService.estRappelActif(_neuvaine.id);
    
    if (!actif) {
      // Activer le rappel
      await RappelNeuvaineService.activerRappelNeuvaine(
        neuvaineId: _neuvaine.id,
        neuvaineTitre: _neuvaine.titre,
        jour: _jourActuel + 1,
        heure: const TimeOfDay(hour: 20, minute: 0),
      );
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('🔔 Rappel quotidien activé pour 20h'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      // Désactiver le rappel
      await RappelNeuvaineService.desactiverRappelNeuvaine(_neuvaine.id);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('🔕 Rappel désactivé'),
          backgroundColor: Colors.grey,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
    
    setState(() {
      _rappelActif = !actif;
    });
  }

  // Partager la neuvaine
  Future<void> _partagerNeuvaine() async {
    final jour = _neuvaine.jours[_jourActuel];
    final message = '''
Neuvaine "${_neuvaine.titre}"
Jour ${_jourActuel + 1}/${_neuvaine.jours.length}
${jour.titre}

${jour.priere}

Partagé depuis l'application "Prière à Saint Joseph" 🙏
''';
    
    await Share.share(message);
  }

  @override
  Widget build(BuildContext context) {
    if (_neuvaine.jours.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(_neuvaine.titre),
          backgroundColor: Colors.brown,
        ),
        body: const Center(
          child: Text('Aucun jour disponible pour cette neuvaine'),
        ),
      );
    }

    Color couleurPrincipale;
    try {
      couleurPrincipale = Color(int.parse(_neuvaine.couleurHex));
    } catch (e) {
      couleurPrincipale = Colors.brown;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _neuvaine.titre,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: couleurPrincipale,
        elevation: 0,
        actions: [
          // Icône de rappel dynamique
          IconButton(
            icon: Icon(
              _rappelActif ? Icons.notifications_active : Icons.notifications_none,
              color: _rappelActif ? Colors.amber : Colors.white,
            ),
            onPressed: _toggleRappel,
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _partagerNeuvaine,
          ),
        ],
      ),
      body: Column(
        children: [
          _buildProgressBar(couleurPrincipale),
          _buildTabBar(couleurPrincipale),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPriereTab(couleurPrincipale),
                _buildMeditationTab(couleurPrincipale),
                _buildEcritureTab(couleurPrincipale),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFloatingButton(couleurPrincipale),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: _buildNavigationBar(couleurPrincipale),
    );
  }

  Widget _buildProgressBar(Color couleur) {
    return Container(
      color: couleur.withOpacity(0.1),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Progression',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: couleur,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: couleur.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Jour ${_jourActuel + 1}/${_neuvaine.jours.length}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: couleur,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: (_jourActuel + 1) / _neuvaine.jours.length,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(couleur),
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(Color couleur) {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        labelColor: couleur,
        unselectedLabelColor: Colors.grey,
        indicatorColor: couleur,
        indicatorWeight: 3,
        tabs: const [
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.menu_book, size: 18),
                SizedBox(width: 4),
                Text('Prière'),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lightbulb_outline, size: 18),
                SizedBox(width: 1),
                Text('Méditation'),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.edit_note, size: 18),
                SizedBox(width: 4),
                Text('Écriture'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingButton(Color couleur) {
    return FloatingActionButton.extended(
      onPressed: _marquerJourComplete,
      icon: const Icon(Icons.check_circle, color: Colors.white,),
      label: Text(
        _jourActuel == _neuvaine.jours.length - 1
            ? 'Terminer'
            : 'Jour ${_jourActuel + 1}',style: TextStyle(color: Colors.white),
      ),
      backgroundColor: couleur,
    );
  }

  Widget _buildNavigationBar(Color couleurPrincipale) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Bouton précédent
          Expanded(
            child: InkWell(
              onTap: _jourActuel > 0
                  ? () {
                      setState(() {
                        _jourActuel--;
                        _tabController.animateTo(0);
                        _chargerNotes();
                      });
                    }
                  : null,
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Précédent',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Indicateur du jour
          Container(
            width: 80,
            height: 36,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: couleurPrincipale.withOpacity(0.1),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: couleurPrincipale.withOpacity(0.3)),
            ),
            child: Center(
              child: Text(
                '${_jourActuel + 1}/${_neuvaine.jours.length}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: couleurPrincipale,
                ),
              ),
            ),
          ),

          // Bouton suivant
          Expanded(
            child: InkWell(
              onTap: _jourActuel < _neuvaine.jours.length - 1
                  ? () {
                      setState(() {
                        _jourActuel++;
                        _tabController.animateTo(0);
                        _chargerNotes();
                      });
                    }
                  : null,
              child: Container(
                height: double.infinity,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Suivant',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriereTab(Color couleurPrincipale) {
    if (_jourActuel < 0 || _jourActuel >= _neuvaine.jours.length) {
      return const Center(child: Text('Jour non disponible'));
    }

    final jour = _neuvaine.jours[_jourActuel];

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 60),
     
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [couleurPrincipale, couleurPrincipale.withOpacity(0.7)],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text('Jour ${_jourActuel + 1}',
                    style: const TextStyle(color: Colors.white, fontSize: 14)),
                const SizedBox(height: 4),
                Text(jour.titre,
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ],
            ),
          ),
          const SizedBox(height: 16),
          if (jour.verset != null && jour.verset!.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.format_quote, color: Colors.amber.shade700, size: 24),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(jour.verset!,
                        style: TextStyle(fontStyle: FontStyle.italic, color: Colors.amber.shade800)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 19),
          ],
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10)],
            ),
            child: Column(
              children: [
                Text('Prière',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: couleurPrincipale)),
                const SizedBox(height: 19),
                Text(jour.priere, style: const TextStyle(fontSize: 15, height: 1.6), textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMeditationTab(Color couleurPrincipale) {
    if (_jourActuel < 0 || _jourActuel >= _neuvaine.jours.length) {
      return const Center(child: Text('Méditation non disponible'));
    }

    final jour = _neuvaine.jours[_jourActuel];

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 60),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.amber.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.amber.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.lightbulb_outline, color: Colors.amber.shade700, size: 24),
              const SizedBox(width: 8),
              Text('Méditation',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.amber.shade800)),
            ]),
            const SizedBox(height: 16),
            Text(jour.meditation, style: const TextStyle(fontSize: 15, height: 1.3)),//overfl
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Text('Pistes de réflexion',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber.shade800)),
                  const SizedBox(height: 12),
                  _buildPisteReflexion(Icons.question_answer, 'Que m\'inspire cette méditation ?'),
                  _buildPisteReflexion(Icons.favorite, 'Comment l\'appliquer dans ma vie ?'),
                  _buildPisteReflexion(Icons.church, 'Que me dit Dieu ?'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPisteReflexion(IconData icon, String texte) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: Colors.amber.shade600),
          const SizedBox(width: 8),
          Expanded(
            child: Text(texte,
                style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey)),
          ),
        ],
      ),
    );
  }

  Widget _buildEcritureTab(Color couleurPrincipale) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: couleurPrincipale.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Row(children: [
              Icon(Icons.edit_note, color: couleurPrincipale, size: 24),
              const SizedBox(width: 8),
              Text('Mes notes - Jour ${_jourActuel + 1}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: couleurPrincipale)),
            ]),
            const SizedBox(height: 1),
            TextField(
              controller: _notesController,
              maxLines: 12,
              decoration: InputDecoration(
                hintText: 'Écrivez vos réflexions...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: couleurPrincipale, width: 2),
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('🕐 ${_derniereSauvegarde.hour.toString().padLeft(2, '0')}:${_derniereSauvegarde.minute.toString().padLeft(2, '0')}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ElevatedButton.icon(
                  onPressed: _sauvegarderNotes,
                  icon: const Icon(Icons.save),
                  label: const Text('Sauvegarder'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: couleurPrincipale,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}