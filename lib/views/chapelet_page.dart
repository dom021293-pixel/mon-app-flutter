// lib/views/chapelet_page.dart
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:joe/views/chants_page.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:joe/widgets/audio_player_widget.dart';

class ChapeletPage extends StatefulWidget {
  @override
  _ChapeletPageState createState() => _ChapeletPageState();
}

class _ChapeletPageState extends State<ChapeletPage> with SingleTickerProviderStateMixin {
  // Structure du chapelet de Saint Joseph
  // Cercle : 15 groupes de (1 blanc + 3 violets) = 60 grains
  // Préparation : médaille (-1), 1 blanc (0), 3 violets (1-3), 1 blanc (4)
  static const int GROUPES_VIOLETS = 15;        // 15 groupes dans le cercle
  static const int GRAINS_PAR_GROUPE = 4;       // 1 blanc + 3 violets
  static const int TOTAL_GRAINS_CERCLE = 60;    // 15 × 4 = 60
  static const int TOTAL_GRAINS = 60;           // Grains du cercle (indices 5 à 64 dans notre logique)
  static const int OFFSET_CERCLE = 5;           // Les grains 0-4 sont la préparation
bool _showMysterePanel = true; // Pour cacher/afficher le panneau des mystères
bool _useManualMystere = false; // Pour choisir manuellement le mystère
int _selectedMystereIndex = 0; // Index du mystère sélectionné manuellement
  // État du chapelet
  // grainActuel : -1 = médaille, 0 = 1er blanc prépa, 1-3 = violets prépa,
  // 4 = 2e blanc prépa, 5..64 = cercle
  static const int GRAIN_MAX = 64; // 5 + 60 - 1

  late List<bool> _grainsPries;
  int _grainActuel = -1;
  int _sousMystereActuel = 0;
  bool _chapeletTermine = false;
  bool _showTutorial = false;
  bool _afficherRose = true;
  bool _showAudioPlayer = false;

  // Animation
  late AnimationController _animationController;
  late Animation<double> animation;

  // Préférences
  late SharedPreferences _prefs;
  bool _tutorialVu = false;

  // -----------------------------------------------------------------------
  // LOGIQUE DU CERCLE
  // Dans le cercle (grainActuel >= 5), la position dans le cercle est :
  //   posCercle = grainActuel - 5   (0 à 59)
  // Le numéro du groupe (0-14) :
  //   groupe = posCercle ~/ 4
  // L'index dans le groupe (0 = blanc, 1-3 = violets) :
  //   indexGroupe = posCercle % 4
  //
  // Les 5 grains blancs importants (sous-mystères) sont les blancs des groupes
  // 0, 3, 6, 9, 12 → posCercle = 0, 12, 24, 36, 48
  // -----------------------------------------------------------------------

  final Map<int, String> _audioUrls = {
  // Médaille et préparation
  -1: 'audio/je_crois_en_dieu.aac',
  0: 'audio/notre_pere.aac',
  1: 'audio/je_vous_salue_marie.aac',
  2: 'audio/je_vous_salue_marie.aac',
  3: 'audio/je_vous_salue_marie.aac',
  4: 'audio/gloire_au_pere.aac',
  
  // Grains blancs du cercle (mystères)
  5: 'assets/audio/mystere_1.aac',   // 1er mystère
  9: 'assets/audio/mystere_2.aac',   // 2e mystère
  13: 'assets/audio/mystere_3.aac',  // 3e mystère
  17: 'assets/audio/mystere_4.aac',  // 4e mystère
  21: 'assets/audio/mystere_5.aac',  // 5e mystère
  // ... continuez pour les 5 mystères
  
  // Grains violets
  6: 'assets/audio/je_vous_salue_joseph.aac',
  7: 'assets/audio/je_vous_salue_joseph.aac',
  8: 'assets/audio/je_vous_salue_joseph.aac',
  // ... pour tous les grains violets
};

  final List<Map<String, dynamic>> _mysteresList = [
  {'nom': 'Mystères Joyeux', 'couleur': Colors.blue},
  {'nom': 'Mystères Douloureux', 'couleur': Colors.red},
  {'nom': 'Mystères Glorieux', 'couleur': Colors.green},
];
  static const List<int> _groupesMysteres = [0, 3, 6, 9, 12];

  // Mystères selon les jours
  final Map<int, Map<String, dynamic>> _mysteresParJour = {
    DateTime.monday: {
      'nom': 'Mystères Joyeux',
      'couleur': Colors.blue,
      'sous_mysteres': [
        {
          'titre': "L'annonciation à Joseph",
          'verset': 'Matthieu 1, 20',
          'description': "Joseph, fils de David, ne crains pas de prendre chez toi Marie ton épouse.",
        },
        {
          'titre': 'La naissance de Jésus',
          'verset': 'Matthieu 2, 1-12',
          'description': "Joseph assiste à la naissance du Sauveur dans la pauvreté de Bethléem.",
        },
        {
          'titre': "La circoncision et l'attribution du nom",
          'verset': 'Matthieu 1, 20-21',
          'description': "Joseph donne le nom de Jésus à l'Enfant, signe de sa mission de Sauveur.",
        },
        {
          'titre': 'La présentation au temple',
          'verset': 'Luc 2, 22-38',
          'description': "Joseph présente Jésus au Temple et entend les prophéties de Siméon et Anne.",
        },
        {
          'titre': 'Le recouvrement au Temple',
          'verset': 'Luc 2, 40-51',
          'description': "Joseph retrouve Jésus au Temple après trois jours de recherche.",
        },
      ],
    },
    DateTime.tuesday: {
      'nom': 'Mystères Douloureux',
      'couleur': Colors.red,
      'sous_mysteres': [
        {
          'titre': 'Joseph veut répudier Marie dans le secret',
          'verset': 'Matthieu 1, 19',
          'description': "Joseph, parce qu'il était juste, voulait répudier Marie secrètement.",
        },
        {
          'titre': "Pas de place dans l'auberge",
          'verset': 'Luc 2, 7',
          'description': "Joseph cherche en vain un lieu pour la naissance de Jésus.",
        },
        {
          'titre': 'La fuite en Égypte',
          'verset': 'Matthieu 2, 13-15',
          'description': "Joseph fuit en Égypte avec l'Enfant et sa mère pour échapper à Hérode.",
        },
        {
          'titre': 'Jésus perdu à Jérusalem',
          'verset': 'Luc 2, 43-45',
          'description': "Joseph cherche Jésus pendant trois jours d'angoisse.",
        },
        {
          'titre': 'La mort de Joseph',
          'verset': 'Tradition',
          'description': "Joseph meurt dans les bras de Jésus et Marie, entouré d'amour.",
        },
      ],
    },
    DateTime.wednesday: {
      'nom': 'Mystères Glorieux',
      'couleur': Colors.green,
      'sous_mysteres': [
        {
          'titre': 'La glorification de Joseph',
          'verset': 'Tradition',
          'description': "Joseph est élevé à la gloire du ciel auprès de Jésus et Marie.",
        },
        {
          'titre': "Saint Joseph, Patron de l'Église universelle",
          'verset': 'Pie IX, 1870',
          'description': "Déclaré Patron de l'Église universelle par le Pape Pie IX.",
        },
        {
          'titre': 'Saint Joseph, Protecteur des familles',
          'verset': 'Tradition',
          'description': "Joseph protège toutes les familles comme il a protégé la Sainte Famille.",
        },
        {
          'titre': 'Saint Joseph, patron de la bonne mort',
          'verset': 'Tradition',
          'description': "Joseph intercède pour ceux qui s'approchent du passage éternel.",
        },
        {
          'titre': 'Saint Joseph, patron des mourants et des souffrants',
          'verset': 'Tradition',
          'description': "Joseph console et fortifie ceux qui souffrent.",
        },
      ],
    },
    DateTime.thursday: {
      'nom': 'Mystères Douloureux',
      'couleur': Colors.red,
      'sous_mysteres': [
        {
          'titre': 'Joseph veut répudier Marie dans le secret',
          'verset': 'Matthieu 1, 19',
          'description': "Joseph, parce qu'il était juste, voulait répudier Marie secrètement.",
        },
        {
          'titre': "Pas de place dans l'auberge",
          'verset': 'Luc 2, 7',
          'description': "Joseph cherche en vain un lieu pour la naissance de Jésus.",
        },
        {
          'titre': 'La fuite en Égypte',
          'verset': 'Matthieu 2, 13-15',
          'description': "Joseph fuit en Égypte avec l'Enfant et sa mère pour échapper à Hérode.",
        },
        {
          'titre': 'Jésus perdu à Jérusalem',
          'verset': 'Luc 2, 43-45',
          'description': "Joseph cherche Jésus pendant trois jours d'angoisse.",
        },
        {
          'titre': 'La mort de Joseph',
          'verset': 'Tradition',
          'description': "Joseph meurt dans les bras de Jésus et Marie, entouré d'amour.",
        },
      ],
    },
    DateTime.friday: {
      'nom': 'Mystères Douloureux',
      'couleur': Colors.red,
      'sous_mysteres': [
        {
          'titre': 'Joseph veut répudier Marie dans le secret',
          'verset': 'Matthieu 1, 19',
          'description': "Joseph, parce qu'il était juste, voulait répudier Marie secrètement.",
        },
        {
          'titre': "Pas de place dans l'auberge",
          'verset': 'Luc 2, 7',
          'description': "Joseph cherche en vain un lieu pour la naissance de Jésus.",
        },
        {
          'titre': 'La fuite en Égypte',
          'verset': 'Matthieu 2, 13-15',
          'description': "Joseph fuit en Égypte avec l'Enfant et sa mère pour échapper à Hérode.",
        },
        {
          'titre': 'Jésus perdu à Jérusalem',
          'verset': 'Luc 2, 43-45',
          'description': "Joseph cherche Jésus pendant trois jours d'angoisse.",
        },
        {
          'titre': 'La mort de Joseph',
          'verset': 'Tradition',
          'description': "Joseph meurt dans les bras de Jésus et Marie, entouré d'amour.",
        },
      ],
    },
    DateTime.saturday: {
      'nom': 'Mystères Joyeux',
      'couleur': Colors.blue,
      'sous_mysteres': [
        {
          'titre': "L'annonciation à Joseph",
          'verset': 'Matthieu 1, 20',
          'description': "Joseph, fils de David, ne crains pas de prendre chez toi Marie ton épouse.",
        },
        {
          'titre': 'La naissance de Jésus',
          'verset': 'Matthieu 2, 1-12',
          'description': "Joseph assiste à la naissance du Sauveur dans la pauvreté de Bethléem.",
        },
        {
          'titre': "La circoncision et l'attribution du nom",
          'verset': 'Matthieu 1, 20-21',
          'description': "Joseph donne le nom de Jésus à l'Enfant, signe de sa mission de Sauveur.",
        },
        {
          'titre': 'La présentation au temple',
          'verset': 'Luc 2, 22-38',
          'description': "Joseph présente Jésus au Temple et entend les prophéties de Siméon et Anne.",
        },
        {
          'titre': 'Le recouvrement au Temple',
          'verset': 'Luc 2, 40-51',
          'description': "Joseph retrouve Jésus au Temple après trois jours de recherche.",
        },
      ],
    },
    DateTime.sunday: {
      'nom': 'Mystères Glorieux',
      'couleur': Colors.green,
      'sous_mysteres': [
        {
          'titre': 'La glorification de Joseph',
          'verset': 'Tradition',
          'description': "Joseph est élevé à la gloire du ciel auprès de Jésus et Marie.",
        },
        {
          'titre': "Saint Joseph, Patron de l'Église universelle",
          'verset': 'Pie IX, 1870',
          'description': "Déclaré Patron de l'Église universelle par le Pape Pie IX.",
        },
        {
          'titre': 'Saint Joseph, Protecteur des familles',
          'verset': 'Tradition',
          'description': "Joseph protège toutes les familles comme il a protégé la Sainte Famille.",
        },
        {
          'titre': 'Saint Joseph, patron de la bonne mort',
          'verset': 'Tradition',
          'description': "Joseph intercède pour ceux qui s'approchent du passage éternel.",
        },
        {
          'titre': 'Saint Joseph, patron des mourants et des souffrants',
          'verset': 'Tradition',
          'description': "Joseph console et fortifie ceux qui souffrent.",
        },
      ],
    },
  };

  // Prières du chapelet
  final Map<String, String> _prieres = {
    'je_crois_en_dieu': '''Je crois en Dieu, le Père tout-puissant,
créateur du ciel et de la terre.
Et en Jésus Christ, son Fils unique, notre Seigneur,
qui a été conçu du Saint-Esprit,
est né de la Vierge Marie,
a souffert sous Ponce Pilate,
a été crucifié, est mort et a été enseveli,
est descendu aux enfers,
le troisième jour est ressuscité des morts,
est monté aux cieux,
est assis à la droite de Dieu le Père tout-puissant,
d'où il viendra juger les vivants et les morts.
Je crois en l'Esprit Saint,
à la sainte Église catholique,
à la communion des saints,
à la rémission des péchés,
à la résurrection de la chair,
à la vie éternelle. Amen.''',

    'notre_pere': '''Notre Père, qui es aux cieux,
que ton nom soit sanctifié,
que ton règne vienne,
que ta volonté soit faite sur la terre comme au ciel.
Donne-nous aujourd'hui notre pain de ce jour.
Pardonne-nous nos offenses,
comme nous pardonnons aussi à ceux qui nous ont offensés.
Et ne nous soumets pas à la tentation,
mais délivre-nous du mal. Amen.''',

    'je_vous_salue_marie': '''Je vous salue, Marie, pleine de grâce,
le Seigneur est avec vous.
Vous êtes bénie entre toutes les femmes,
et Jésus, le fruit de vos entrailles, est béni.
Sainte Marie, Mère de Dieu,
priez pour nous, pauvres pécheurs,
maintenant et à l'heure de notre mort. Amen.''',

    'gloire_au_pere': '''Gloire au Père, et au Fils, et au Saint-Esprit,
comme il était au commencement, maintenant et toujours,
et dans les siècles des siècles. Amen.''',

    'saint_joseph_garde': 'Saint Joseph, gardien de la sainte famille, bénissez nos familles',

    'je_vous_salue_joseph': '''Je vous salue Joseph,
vous que la grâce divine a comblé.
Le sauveur a reposé dans vos bras et grandi sous vos yeux.
Vous êtes béni entre tous les hommes et Jésus,
l'Enfant divin de votre virginale épouse, est béni.
Saint Joseph, donné pour père au Fils de Dieu,
priez pour nous dans nos soucis de famille,
de santé et de travail,
jusqu'à nos derniers jours,
et daignez nous secourir à l'heure de notre mort.
Amen.''',

    'saint_joseph_3fois': 'Saint Joseph, priez pour nous',

    'conclusion': '''Jésus, Marie, Joseph,
je vous donne mon cœur et mon âme.

Jésus, Marie, Joseph,
assistez-moi maintenant et à l'heure de ma dernière agonie.

Jésus, Marie, Joseph,
que mon âme soit en paix avec vous.

Amen !

Prière au saint frère André

Saint frère André,
nous célébrons ta présence
parmi nous.
Ton amitié envers Jésus,
Marie et Joseph
fait de toi un intercesseur puissant auprès du Père.
La compassion relie tes paroles
au cœur de Dieu,
tes prières sont exaucées
et apportent réconfort et guérison.

Avec toi, notre bouche s’approche de l’oreille de Dieu
pour lui présenter notre demande…

Qu’il nous soit donné
de participer comme toi à l’œuvre de Dieu
dans un esprit de prière, de compassion et d’humilité.

Saint frère André, prie pour nous. Amen.''',
  };

  // Instructions pour le tutoriel
  final List<Map<String, String>> _tutorialSteps = [
    {
      'title': 'Le Chapelet de Saint Joseph',
      'description': 'Un chapelet unique avec une médaille, 2 grains blancs, 3 grains violets, puis un cercle de 60 grains (15 groupes de 3 violets séparés par 15 blancs).',
      'icon': '📿',
    },
    {
      'title': 'La préparation',
      'description': '• Sur la médaille : "Je crois en Dieu"\n• 1er grain blanc : "Notre Père"\n• 3 grains violets : "Je vous salue Marie"\n• 2ème grain blanc : "Gloire au Père"',
      'icon': '⚪🟣',
    },
    {
      'title': 'Le cercle - Structure',
      'description': '15 groupes de (1 blanc + 3 violets). Au total : 60 grains. Les sous-mystères tombent sur les blancs des groupes 1, 4, 7, 10 et 13.',
      'icon': '⭕',
    },
    {
      'title': 'Avant chaque sous-mystère',
      'description': 'Sur les 5 grains blancs importants (groupes 1, 4, 7, 10, 13), on dit d\'abord "Saint Joseph, priez pour nous" (3 fois), puis on annonce le mystère.',
      'icon': '🙏',
    },
    {
      'title': 'Sur les grains blancs ordinaires',
      'description': '"Saint Joseph, gardien de la sainte famille, bénissez nos familles"',
      'icon': '⚪',
    },
    {
      'title': 'Sur les 3 grains violets',
      'description': '"Je vous salue Joseph" (sur chaque grain violet)',
      'icon': '🟣',
    },
    {
      'title': 'Les 5 mystères',
      'description': 'Sur les 5 grains blancs importants, on médite le mystère puis on récite "Je vous salue Joseph" 3 fois.',
      'icon': '📖',
    },
    {
      'title': 'La conclusion',
      'description': 'Après le dernier grain, on récite la prière "Jésus, Marie, Joseph..."',
      'icon': '✨',
    },
  ];

  @override
  void initState() {
    super.initState();
    _resetChapelet();
    _initPreferences();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  Future<void> _initPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _tutorialVu = _prefs.getBool('chapelet_tutorial_vu') ?? false;
      _showTutorial = !_tutorialVu;
    });
  }

  // Obtenir les mystères du jour
 Map<String, dynamic> _getMysteresDuJour() {
  if (_useManualMystere) {
    // Retourner le mystère sélectionné manuellement
    switch (_selectedMystereIndex) {
      case 0:
        return _mysteresParJour[DateTime.monday]!; // Joyeux
      case 1:
        return _mysteresParJour[DateTime.tuesday]!; // Douloureux
      case 2:
        return _mysteresParJour[DateTime.wednesday]!; // Glorieux
      default:
        return _mysteresParJour[DateTime.monday]!;
    }
  } else {
    // Comportement normal basé sur le jour
    int today = DateTime.now().weekday;
    return _mysteresParJour[today] ?? _mysteresParJour[DateTime.sunday]!;
  }
}

  // -----------------------------------------------------------------------
  // Helpers cercle
  // -----------------------------------------------------------------------

  /// Retourne la position dans le cercle (0-59), ou -1 si hors cercle.
  int _posCercle() {
    if (_grainActuel < OFFSET_CERCLE) return -1;
    return _grainActuel - OFFSET_CERCLE;
  }

  /// Numéro du groupe (0-14) dans le cercle pour le grain actuel.
  int _groupeActuel() {
    int pos = _posCercle();
    if (pos < 0) return -1;
    return pos ~/ GRAINS_PAR_GROUPE;
  }

  /// Index dans le groupe : 0 = blanc, 1-3 = violets.
  int _indexDansGroupe() {
    int pos = _posCercle();
    if (pos < 0) return -1;
    return pos % GRAINS_PAR_GROUPE;
  }

  /// Vrai si le grain actuel est un grain blanc de mystère.
  bool _estGrainBlancMystere() {
    if (_indexDansGroupe() != 0) return false;
    return _groupesMysteres.contains(_groupeActuel());
  }

  /// Numéro du sous-mystère (0-4) pour le groupe actuel, ou -1 si non applicable.
  int _indexSousMystere() {
    int groupe = _groupeActuel();
    return _groupesMysteres.indexOf(groupe);
  }

  // -----------------------------------------------------------------------

void _toggleMysterePanel() {
  setState(() {
    _showMysterePanel = !_showMysterePanel;
  });
}

void _showMystereSelector() {
  // Variables locales pour gérer l'état dans le bottom sheet
  bool localUseManual = _useManualMystere;
  int localSelectedIndex = _selectedMystereIndex;
  
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setStateSheet) {
          return DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.3,
            maxChildSize: 0.8,
            expand: false,
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Handle
                    Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    
                    // Titre
                    const Text(
                      'Choisir les mystères',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Par défaut, les mystères suivent le jour de la semaine.',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    
                    // Contenu défilant
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        children: [
                          // Option pour suivre le jour
                          Card(
                            color: !localUseManual ? Colors.purple.shade50 : null,
                            child: RadioListTile<bool>(
                              title: const Text('Suivre le jour de la semaine'),
                              subtitle: const Text('Automatique selon le calendrier'),
                              value: false,
                              groupValue: localUseManual,
                              onChanged: (value) {
                                setStateSheet(() {
                                  localUseManual = false;
                                });
                                setState(() {
                                  _useManualMystere = false;
                                });
                                Navigator.pop(context);
                              },
                              activeColor: Colors.purple,
                            ),
                          ),
                          
                          const SizedBox(height: 8),
                          
                          // Option pour choisir manuellement
                          Card(
                            color: localUseManual ? Colors.purple.shade50 : null,
                            child: Column(
                              children: [
                                RadioListTile<bool>(
                                  title: const Text('Choisir manuellement'),
                                  subtitle: const Text('Sélectionner un type de mystère'),
                                  value: true,
                                  groupValue: localUseManual,
                                  onChanged: (value) {
                                    setStateSheet(() {
                                      localUseManual = true;
                                    });
                                  },
                                  activeColor: Colors.purple,
                                ),
                                
                                // Les sous-options s'affichent immédiatement
                                if (localUseManual) ...[
                                  const Divider(indent: 56),
                                  ...List.generate(_mysteresList.length, (index) {
                                    return RadioListTile<int>(
                                      title: Text(
                                        _mysteresList[index]['nom'],
                                        style: TextStyle(color: _mysteresList[index]['couleur']),
                                      ),
                                      value: index,
                                      groupValue: localSelectedIndex,
                                      onChanged: (value) {
                                        setStateSheet(() {
                                          localSelectedIndex = value!;
                                        });
                                        setState(() {
                                          _useManualMystere = true;
                                          _selectedMystereIndex = value!;
                                        });
                                        Navigator.pop(context);
                                      },
                                      activeColor: _mysteresList[index]['couleur'],
                                    );
                                  }),
                                ],
                              ],
                            ),
                          ),
                          
                          const SizedBox(height: 12),
                          
                          if (!localUseManual)
                            ElevatedButton.icon(
                              onPressed: () {
                                setStateSheet(() {
                                  localUseManual = true;
                                  localSelectedIndex = 0;
                                });
                              },
                              icon: const Icon(Icons.edit),
                              label: const Text('Choisir un mystère'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                minimumSize: const Size(double.infinity, 48),
                              ),
                            ),
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
    },
  );
}

  void _resetChapelet() {
    setState(() {
      _grainsPries = List.filled(GRAIN_MAX + 2, false);
      _grainActuel = -1;
      _sousMystereActuel = 0;
      _chapeletTermine = false;
    });
  }

  void _avancerGrain() {
    setState(() {
      if (_grainActuel < GRAIN_MAX) {
        _grainActuel++;
        if (_grainActuel >= 0) {
          _grainsPries[_grainActuel] = true;
        }
        _animationController.forward(from: 0);

        // Mettre à jour _sousMystereActuel si on entre sur un grain blanc de mystère
        if (_estGrainBlancMystere()) {
          _sousMystereActuel = _indexSousMystere();
        }
      } else if (!_chapeletTermine) {
        _chapeletTermine = true;
      }
    });

    HapticFeedback.lightImpact();
  }

  void _reculerGrain() {
    setState(() {
      if (_grainActuel > -1) {
        if (_grainActuel >= 0) {
          _grainsPries[_grainActuel] = false;
        }
        _grainActuel--;
        _chapeletTermine = false;

        // Recalcul du sous-mystère
        if (_grainActuel >= OFFSET_CERCLE && _estGrainBlancMystere()) {
          _sousMystereActuel = _indexSousMystere();
        } else if (_grainActuel < OFFSET_CERCLE) {
          _sousMystereActuel = 0;
        }
      }
    });
  }

  // -----------------------------------------------------------------------
  // Textes affichés
  // -----------------------------------------------------------------------

  String _getPriereEnCours() {
    if (_chapeletTermine) return _prieres['conclusion']!;

    // Médaille
    if (_grainActuel == -1) return _prieres['je_crois_en_dieu']!;

    // Préparation
    if (_grainActuel == 0) return _prieres['notre_pere']!;
    if (_grainActuel >= 1 && _grainActuel <= 3) return _prieres['je_vous_salue_marie']!;
    if (_grainActuel == 4) return _prieres['gloire_au_pere']!;

    // Cercle
    int idx = _indexDansGroupe();
    if (idx == 0) {
      // Grain blanc
      if (_estGrainBlancMystere()) {
        // D'abord "Saint Joseph priez pour nous" (3 fois) puis le mystère
        var mysteres = _getMysteresDuJour();
        var sousMystere = mysteres['sous_mysteres'][_indexSousMystere()] as Map<String, String>;
        return '${_prieres['saint_joseph_3fois']} (3 fois)\n\n'
            '━━━━━━━━━━━━━━━\n\n'
            '${sousMystere['titre']}\n\n'
            '${sousMystere['verset']}\n\n'
            '${sousMystere['description']}';
      } else {
        return _prieres['saint_joseph_garde']!;
      }
    } else {
      // Grains violets
      return _prieres['je_vous_salue_joseph']!;
    }
  }

  String _getTitrePriereEnCours() {
    if (_chapeletTermine) return 'Prière de conclusion';
    if (_grainActuel == -1) return 'Médaille — Je crois en Dieu';
    if (_grainActuel == 0) return '1er grain blanc — Notre Père';
    if (_grainActuel >= 1 && _grainActuel <= 3) return 'Grain violet — Je vous salue Marie';
    if (_grainActuel == 4) return '2ème grain blanc — Gloire au Père';

    int groupe = _groupeActuel();   // 0-14
    int idx = _indexDansGroupe();   // 0-3

    if (idx == 0) {
      if (_estGrainBlancMystere()) {
        var mysteres = _getMysteresDuJour();
        int numMystere = _indexSousMystere() + 1;
        return '${mysteres['nom']} — Mystère $numMystere/5';
      } else {
        return 'Groupe ${groupe + 1} — Saint Joseph, gardien...';
      }
    } else {
      return 'Groupe ${groupe + 1} — Je vous salue Joseph ($idx/3)';
    }
  }

  // -----------------------------------------------------------------------
  // Couleurs et état des grains
  // -----------------------------------------------------------------------

  Color _getGrainColor(int index) {
    if (index == -1) return Colors.amber.shade700;       // Médaille
    if (index == 0 || index == 4) return Colors.white;  // Blancs préparation
    if (index >= 1 && index <= 3) return Colors.purple.shade300; // Violets préparation

    // Cercle
    int pos = index - OFFSET_CERCLE;
    return (pos % GRAINS_PAR_GROUPE == 0) ? Colors.white : Colors.purple.shade300;
  }

  bool _estGrainPrie(int index) {
    if (index == -1) return _grainActuel >= -1;
    return index <= _grainActuel;
  }

  /*String _getAudioUrlForCurrentGrain() {
    return 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';
  }*/

String _getAudioUrlForCurrentGrain() {
  // Utilisez des URLs SoundHelix qui fonctionnent
  final Map<int, String> urls = {
    -1: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
    0: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3',
    1: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3',
    2: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3',
    3: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3',
    4: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3',
  };
  
  return urls[_grainActuel] ?? urls[0]!;
}

  int _getProgression() {
    if (_chapeletTermine) return 100;
    int total = GRAIN_MAX + 2; // médaille + prépa + cercle
    return ((_grainActuel + 1) * 100 ~/ total).clamp(0, 100);
  }

  void _partagerProgression() {
    String message = _chapeletTermine
        ? 'Je viens de terminer le Chapelet de Saint Joseph ! 🙏 Saint Joseph, priez pour nous.'
        : 'Je prie le Chapelet de Saint Joseph (${_getProgression()}%) 🙏';
    Share.share(message);
  }

  Future<void> _marquerTutorialVu() async {
    await _prefs.setBool('chapelet_tutorial_vu', true);
    setState(() {
      _tutorialVu = true;
      _showTutorial = false;
    });
  }

  void _toggleTutorial() => setState(() => _showTutorial = !_showTutorial);
  void _toggleRose() => setState(() => _afficherRose = !_afficherRose);
  void _toggleAudioPlayer() => setState(() => _showAudioPlayer = !_showAudioPlayer);

  // -----------------------------------------------------------------------
  // BUILD
  // -----------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapelet de Saint Joseph'),
        backgroundColor: Colors.purple.shade800,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(_showAudioPlayer ? Icons.volume_up : Icons.volume_off),
            onPressed: _toggleAudioPlayer,
            color: _showAudioPlayer ? Colors.amber : Colors.white,
          ),
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetChapelet),
          IconButton(icon: Icon(Icons.share), onPressed: _partagerProgression),
          IconButton(
            icon: Icon(Icons.local_florist),
            onPressed: _toggleRose,
            color: _afficherRose ? Colors.pink : Colors.white,
          ),
            IconButton(
    icon: const Icon(Icons.music_note),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  ChantsPage()),
      );
    },
  ),
  /*IconButton(
  icon: const Icon(Icons.filter_center_focus),
  onPressed: _showMystereSelector,
  tooltip: 'Choisir les mystères',
),

IconButton(
  icon: Icon(_showMysterePanel ? Icons.fullscreen : Icons.fullscreen_exit),
  onPressed: _toggleMysterePanel,
  tooltip: _showMysterePanel ? 'Mode plein écran' : 'Afficher la méditation',
),*/
          IconButton(
            icon: Icon(_showTutorial ? Icons.menu_book : Icons.help_outline),
            onPressed: _toggleTutorial,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple.shade100, Colors.white],
          ),
        ),
        child: _showTutorial ? _buildTutorial() : _buildChapelet(),
      ),
    );
  }

  Widget _buildTutorial() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.purple.shade800,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          ),
          child: Column(
            children: [
              if (_afficherRose)
                Icon(Icons.local_florist, color: Colors.pink.shade200, size: 40)
              else
                Icon(Icons.menu_book, color: Colors.white, size: 40),
              SizedBox(height: 5),
              Text(
                'Comment prier le Chapelet de Saint Joseph',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: _tutorialSteps.length,
            itemBuilder: (context, index) {
              final step = _tutorialSteps[index];
              return Card(
                margin: EdgeInsets.only(bottom: 12),
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.purple.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: Center(child: Text(step['icon']!, style: TextStyle(fontSize: 24))),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(step['title']!,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple.shade800)),
                            SizedBox(height: 4),
                            Text(step['description']!,
                                style: TextStyle(fontSize: 14, color: Colors.grey.shade700)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: _marquerTutorialVu,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: Text('Commencer le chapelet', style: TextStyle(fontSize: 16)),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple.shade800,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ),
      ],
    );
  }

 Widget _buildChapelet() {
  var mysteres = _getMysteresDuJour();
  // Afficher le bon sous-mystère selon la position courante
  int smIdx = (_grainActuel >= OFFSET_CERCLE && _indexSousMystere() >= 0)
      ? _indexSousMystere()
      : _sousMystereActuel;
  var sousMystere = mysteres['sous_mysteres'][smIdx] as Map<String, dynamic>;
  Color couleurMystere = mysteres['couleur'];

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          // Barre de progression
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            color: Colors.purple.shade800.withOpacity(0.1),
            child: Row(
              children: [
                if (_afficherRose)
                  Icon(Icons.local_florist, color: Colors.pink.shade600, size: 20)
                else
                  Icon(Icons.adjust, color: Colors.purple.shade700, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Progression',
                          style: TextStyle(fontSize: 12, color: Colors.purple.shade700)),
                      const SizedBox(height: 4),
                      LinearProgressIndicator(
                        value: (_grainActuel + 1) / (GRAIN_MAX + 2),
                        backgroundColor: Colors.purple.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            _afficherRose ? Colors.pink.shade600 : Colors.purple.shade700),
                        minHeight: 8,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Text('${_getProgression()}%',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _afficherRose ? Colors.pink.shade600 : Colors.purple.shade700)),
              ],
            ),
          ),

          // En-tête des mystères
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Méditation du jour',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple.shade800,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit_note),
                  onPressed: _showMystereSelector,
                  color: Colors.purple.shade700,
                  tooltip: 'Choisir les mystères',
                ),
                IconButton(
                  icon: Icon(_showMysterePanel ? Icons.visibility : Icons.visibility_off),
                  onPressed: _toggleMysterePanel,
                  color: Colors.purple.shade700,
                  tooltip: _showMysterePanel ? 'Cacher la méditation' : 'Afficher la méditation',
                ),
              ],
            ),
          ),

          // Panneau des mystères (optionnel)
          if (_showMysterePanel) ...[
            Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: couleurMystere.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: couleurMystere.withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(color: couleurMystere, shape: BoxShape.circle),
                        child: Icon(_getIconForMysteres(mysteres['nom']), color: Colors.white, size: 14),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              mysteres['nom'],
                              style: TextStyle(fontWeight: FontWeight.bold, color: couleurMystere),
                            ),
                            if (_useManualMystere) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.amber.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'manuel',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.amber.shade800,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sousMystere['titre'],
                              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              sousMystere['verset'],
                              style: TextStyle(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                color: couleurMystere,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: couleurMystere, borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          '${smIdx + 1}/5',
                          style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],

          // Lecteur audio (optionnel)
          if (_showAudioPlayer) ...[
            Padding(
              padding: const EdgeInsets.all(16),
              child: AudioPlayerWidget(
                audioUrl: _getAudioUrlForCurrentGrain(),
                titre: _getTitrePriereEnCours(),
              ),
            ),
          ],

          // Légende
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.purple.shade700))),
                const SizedBox(width: 4),
                const Text('Blanc', style: TextStyle(fontSize: 12)),
                const SizedBox(width: 16),
                Container(
                    width: 12,
                    height: 12,
                    decoration:
                        BoxDecoration(color: Colors.purple.shade300, shape: BoxShape.circle)),
                const SizedBox(width: 4),
                const Text('Violet', style: TextStyle(fontSize: 12)),
                const SizedBox(width: 16),
                Container(
                    width: 12,
                    height: 12,
                    decoration:
                        BoxDecoration(color: Colors.amber.shade700, shape: BoxShape.circle)),
                const SizedBox(width: 1),
                const Text('Médaille', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),

          // Chapelet
          Center(
            child: CustomPaint(
              size: const Size(400, 400), // Taille réduite pour s'adapter
              painter: ChapeletPainter(
                grainActuel: _grainActuel,
                getGrainColor: _getGrainColor,
                estGrainPrie: _estGrainPrie,
                afficherRose: _afficherRose,
              ),
            ),
          ),

          const SizedBox(height: 1),

          // Panneau de prière
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -5))
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        _getTitrePriereEnCours(),
                        style: TextStyle(
                            fontSize: 14, // Réduit pour gagner de l'espace
                            fontWeight: FontWeight.bold,
                            color: _afficherRose ? Colors.pink.shade800 : Colors.purple.shade800),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                          color: (_afficherRose ? Colors.pink : Colors.purple).shade100,
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        _grainActuel == -1 ? 'Médaille' : '${_grainActuel + 1}/${GRAIN_MAX + 1}',
                        style: TextStyle(
                            fontSize: 12, // Réduit
                            fontWeight: FontWeight.bold,
                            color:
                                _afficherRose ? Colors.pink.shade800 : Colors.purple.shade800),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Container(
                  height: 150, // Hauteur encore réduite
                  child: SingleChildScrollView(
                    child: Text(
                      _getPriereEnCours(),
                      style: const TextStyle(fontSize: 13, height: 1.4, color: Colors.black87),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                if (!_chapeletTermine)
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40, // Hauteur réduite
                          child: ElevatedButton.icon(
                            onPressed: _grainActuel > -1 ? _reculerGrain : null,
                            icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                            label: const Text('Précédent',
                                style: TextStyle(fontSize: 13)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _grainActuel > -1
                                  ? Colors.grey.shade200
                                  : Colors.grey.shade100,
                              foregroundColor: _grainActuel > -1
                                  ? Colors.grey.shade800
                                  : Colors.grey.shade400,
                              elevation: _grainActuel > -1 ? 2 : 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 44,
                          child: ElevatedButton.icon(
                            onPressed: _avancerGrain,
                            icon: const Icon(Icons.arrow_forward_ios, size: 16),
                            label: const Text('Suivant',
                                style: TextStyle(fontSize: 13)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  _afficherRose ? Colors.pink.shade600 : Colors.purple.shade700,
                              foregroundColor: Colors.white,
                              elevation: 3,
                              shadowColor: (_afficherRose ? Colors.pink : Colors.purple)
                                  .withOpacity(0.4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (_chapeletTermine) ...[
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: _afficherRose
                            ? [Colors.pink.shade50, Colors.pink.shade100]
                            : [Colors.purple.shade50, Colors.purple.shade100],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: _afficherRose
                              ? Colors.pink.shade300
                              : Colors.purple.shade300),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Chapelet terminé !\nQue Saint Joseph vous bénisse ! 🙏',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _afficherRose
                                ? Colors.pink.shade800
                                : Colors.purple.shade800,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _afficherRose
                                  ? Colors.pink.shade600
                                  : Colors.purple.shade700,
                              foregroundColor: Colors.white,
                              elevation: 3,
                              shadowColor: (_afficherRose ? Colors.pink : Colors.purple)
                                  .withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.volunteer_activism, size: 18),
                                const SizedBox(width: 6),
                                const Text('Amen',
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w800,
                                        letterSpacing: 1.0)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 15), // Espace supplémentaire en bas
        ],
      ),
    ),
  );
}

  IconData _getIconForMysteres(String nomMystere) {
    if (nomMystere.contains('Joyeux')) return Icons.celebration;
    if (nomMystere.contains('Douloureux')) return Icons.water_drop;
    if (nomMystere.contains('Glorieux')) return Icons.star;
    return Icons.menu_book;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

// ---------------------------------------------------------------------------
// CustomPainter – forme cœur
// ---------------------------------------------------------------------------
class ChapeletPainter extends CustomPainter {
  final int grainActuel;
  final Color Function(int) getGrainColor;
  final bool Function(int) estGrainPrie;
  final bool afficherRose;

  ChapeletPainter({
    required this.grainActuel,
    required this.getGrainColor,
    required this.estGrainPrie,
    required this.afficherRose,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2 - 20);
    final double espacement = 16;
    final double startY = center.dy - 120 - 40;

    // --- Préparation ---
    _drawGrain(canvas, Offset(center.dx, startY), 16, -1, Colors.amber.shade700, true, 'M');
    _drawGrain(canvas, Offset(center.dx, startY + 22), 8, 0, Colors.white, estGrainPrie(0));
    for (int i = 1; i <= 3; i++) {
      _drawGrain(canvas, Offset(center.dx, startY + 22 + i * espacement), 6, i,
          Colors.purple.shade300, estGrainPrie(i));
    }
    _drawGrain(canvas, Offset(center.dx, startY + 22 + 4 * espacement), 8, 4, Colors.white,
        estGrainPrie(4));

    // --- Cercle en forme de cœur (60 grains, indices 5-64) ---
    final heartPath = Path();
    for (double t = 0; t <= 2 * pi; t += 0.01) {
      double x = 16 * pow(sin(t), 3).toDouble();
      double y = 13 * cos(t) - 5 * cos(2 * t) - 2 * cos(3 * t) - cos(4 * t);
      double px = center.dx + x * 8.5;
      double py = center.dy - y * 8.5;
      if (t == 0) heartPath.moveTo(px, py);
      else heartPath.lineTo(px, py);
    }
    heartPath.close();

    final heartMetrics = heartPath.computeMetrics().first;
    for (int i = 5; i <= 64; i++) {
      double progress = (i - 5) / 59.0; // 60 grains → 0..1
      Tangent? tangent = heartMetrics.getTangentForOffset(heartMetrics.length * progress);
      if (tangent != null) {
        int pos = i - 5; // 0-59
        bool isGrainBlanc = (pos % 4 == 0);
        double grainSize = isGrainBlanc ? 8.0 : 6.0;
        _drawGrain(canvas, tangent.position, grainSize, i, getGrainColor(i), estGrainPrie(i));
      }
    }

    // --- Rose centrale ---
    if (afficherRose) {
      final paintRose = Paint()
        ..color = Colors.pink.shade300
        ..style = PaintingStyle.fill;
      canvas.drawCircle(center, 15, paintRose);
      for (int i = 0; i < 5; i++) {
        double angle = i * 72 * pi / 180;
        Offset petalCenter = Offset(center.dx + 12 * cos(angle), center.dy + 12 * sin(angle));
        canvas.drawCircle(petalCenter, 8, paintRose);
      }
      canvas.drawCircle(center, 8, Paint()..color = Colors.pink.shade600);
    }
  }

  void _drawGrain(Canvas canvas, Offset position, double size, int index, Color color,
      bool isPrie, [String? label]) {
    final paint = Paint()
      ..color = isPrie ? color : const Color.fromARGB(255, 245, 183, 234)
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 1);
      canvas.drawCircle(position, size, paint);
      canvas.drawCircle(
          position,
          size,
          Paint()
            ..color = const Color.fromARGB(255, 177, 51, 145)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2);

    if (color == Colors.white) {
      paint.color = isPrie ? Colors.white : const Color.fromARGB(255, 224, 224, 224);
      canvas.drawCircle(position, size, paint);
      canvas.drawCircle(
          position,
          size,
          Paint()
            ..color = Colors.white
            ..style = PaintingStyle.stroke
            ..strokeWidth = 4);
    } else {
      canvas.drawCircle(position, size, paint);
    }

    if (isPrie && index == grainActuel) {
      canvas.drawCircle(
          position,
          size + 4,
          Paint()
            ..color = Colors.white.withOpacity(0.5)
            ..maskFilter = MaskFilter.blur(BlurStyle.normal, 8));
    }

    if (label != null) {
      final textPainter = TextPainter(
        text: TextSpan(
            text: label,
            style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
          canvas, position - Offset(textPainter.width / 2, textPainter.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}