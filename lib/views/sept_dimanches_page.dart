// lib/views/sept_dimanches_page.dart
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';

class SeptDimanchesPage extends StatefulWidget {
  @override
  _SeptDimanchesPageState createState() => _SeptDimanchesPageState();
}

class _SeptDimanchesPageState extends State<SeptDimanchesPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _dimancheActuel = 1;
  
  // Structure des 7 dimanches
  final List<Map<String, dynamic>> _dimanches = [
    {
      'numero': 1,
      'titre': 'Le doute et l\'annonce',
      'douleur': 'Le doute de Joseph devant la grossesse de Marie (Mt 1,19)',
      'joie': 'Le message de l\'ange dissipant son doute (Mt 1,20)',
      'meditation': '''
Joseph, cet homme juste, est confronté au doute le plus déchirant. Marie, sa fiancée, est enceinte. Il ne comprend pas. Il ne sait pas que le Saint-Esprit est à l'œuvre. Son cœur est déchiré entre l'amour qu'il porte à Marie et ce que la loi semble exiger.

Mais l'ange du Seigneur lui apparaît en songe et dissipe son doute : "Joseph, fils de David, ne crains pas de prendre chez toi Marie ton épouse : ce qui a été engendré en elle vient de l'Esprit Saint." Quelle joie ineffable !

Dans nos vies aussi, nous traversons des nuits de doute. Apprenons de Joseph à rester justes, à attendre dans la confiance que Dieu manifeste sa lumière.''',
      'priere': '''
Saint Joseph, au nom de votre douleur,
quand par un sentiment de respect vous pensiez à vous éloigner de Marie,
et au nom de votre joie quand l'ange vous dit de la garder pour votre épouse
et vous annonça qu'elle serait la Mère du Sauveur,
daignez intercéder pour nous.

Obtenez-nous la grâce de faire confiance à Dieu
même quand nous ne comprenons pas ses desseins.
Amen.''',
      'couleur': Colors.purple.shade300,
      'verset': 'Matthieu 1, 19-20',
    },
    {
      'numero': 2,
      'titre': 'La pauvreté de la naissance',
      'douleur': 'La naissance de Jésus dans la pauvreté (Lc 2,7)',
      'joie': 'La naissance du Sauveur et les anges (Lc 2,10-11)',
      'meditation': '''
Quelle douleur pour un père de ne pouvoir offrir un lieu digne pour la naissance de son enfant ! Joseph cherche, frappe aux portes, mais toutes sont fermées. Le Fils de Dieu doit naître dans une étable, parmi les animaux.

Mais cette pauvreté se change soudain en joie céleste ! Les anges chantent : "Gloire à Dieu au plus haut des cieux", et les bergers viennent adorer l'Enfant. Joseph contemple le Sauveur du monde, couché dans une crèche.

Cette douleur nous apprend que Dieu se cache parfois dans la pauvreté et la simplicité. Apprenons à l'accueillir là où il est, dans les humbles circonstances de notre vie.''',
      'priere': '''
Saint Joseph, au nom de votre douleur,
quand vous cherchiez un asile dans les rues de Bethléem,
et au nom de votre joie quand vous adorâtes Jésus nouveau-né dans la crèche,
daignez intercéder pour nous.

Obtenez-nous la grâce de reconnaître la présence de Dieu
dans les situations les plus humbles de notre vie.
Amen.''',
      'couleur': Colors.blue.shade300,
      'verset': 'Luc 2, 6-11',
    },
    {
      'numero': 3,
      'titre': 'La circoncision et le Nom',
      'douleur': 'La circoncision et le premier sang versé (Lc 2,21)',
      'joie': 'Le don du Nom de Jésus (Mt 1,25)',
      'meditation': '''
La circoncision est le premier sang versé par Jésus. Joseph tient l'enfant, il voit la douleur sur son visage, il entend ses cris. Son cœur de père est transpercé. Il comprend que cet enfant n'est pas comme les autres.

Mais quelle joie quand il prononce pour la première fois le nom de "Jésus" ! Ce nom signifie "Dieu sauve". Joseph est le premier à l'appeler par ce nom qui sera un jour sur toutes les lèvres.

Le sang versé annonce déjà la croix, mais le nom de Jésus est notre espérance. C'est par ce nom que nous sommes sauvés.''',
      'priere': '''
Saint Joseph, au nom de votre douleur,
quand le sang du Divin Enfant coula pour la première fois,
et au nom de votre joie quand vous lui donnâtes, de la part du ciel,
le nom de Jésus, daignez intercéder pour nous.

Obtenez-nous de vivre éloignés de tout péché
et de mourir avec le saint Nom de Jésus dans le cœur.
Amen.''',
      'couleur': Colors.red.shade300,
      'verset': 'Luc 2, 21',
    },
    {
      'numero': 4,
      'titre': 'La prophétie de Siméon',
      'douleur': 'La prophétie de Siméon (Lc 2,34)',
      'joie': 'Les effets de la rédemption (Lc 2,38)',
      'meditation': '''
Au Temple, Siméon prend l'enfant dans ses bras et prophétise : "Cet enfant amènera la chute et le relèvement de beaucoup... et toi-même, une épée te transpercera l'âme." Joseph entend ces paroles et son cœur est transpercé.

Mais Siméon annonce aussi le salut et la résurrection pour une multitude innombrable d'âmes. Anne la prophétesse survient et se met à louer Dieu. Jésus est reconnu comme le Rédempteur d'Israël.

Cette prophétie nous rappelle que suivre Dieu n'est pas un chemin de facilité, mais que la souffrance porte du fruit pour le salut du monde.''',
      'priere': '''
Saint Joseph, au nom de votre douleur,
quand vous entendîtes annoncer que Jésus serait un signe de contradiction,
et au nom de votre joie quand vous le vîtes accueilli dans le temple,
daignez intercéder pour nous.

Obtenez-nous d'être du nombre de ceux qui, par les mérites de Jésus,
ressusciteront glorieusement.
Amen.''',
      'couleur': Colors.green.shade300,
      'verset': 'Luc 2, 25-35',
    },
    {
      'numero': 5,
      'titre': 'La fuite en Égypte',
      'douleur': 'La fuite en Égypte (Mt 2,14)',
      'joie': 'Le renversement des idoles (Is 19,1)',
      'meditation': '''
Un ange avertit Joseph en songe : "Lève-toi, prends l'enfant et sa mère, et fuis en Égypte." Joseph obéit sans tarder. Au milieu de la nuit, il réveille les siens, prépare l'âne, et part dans l'inconnu.

Quitter sa maison, sa terre, ses proches, tout abandonner pour sauver l'enfant. Joseph devient réfugié, étranger dans un pays inconnu.

Mais quelle joie d'avoir continuellement Dieu avec lui ! Et selon la tradition, les idoles d'Égypte tombent à l'entrée de la Sainte Famille. Le vrai Dieu triomphe des faux dieux.''',
      'priere': '''
Saint Joseph, au nom de votre douleur,
quand l'Ange vous dit de fuir en Égypte parce qu'Hérode voulait faire mourir Jésus,
et au nom de votre joie quand vous l'arrachiez à ce péril,
daignez intercéder pour nous.

Obtenez-nous d'éloigner de nous le tyran infernal
par la fuite des occasions dangereuses.
Amen.''',
      'couleur': Colors.orange.shade300,
      'verset': 'Matthieu 2, 13-15',
    },
    {
      'numero': 6,
      'titre': 'Le retour d\'Égypte',
      'douleur': 'La crainte d\'Archélaüs (Mt 2,22)',
      'joie': 'La vie à Nazareth (Lc 2,39)',
      'meditation': '''
Après la mort d'Hérode, un ange dit à Joseph de retourner en Israël. Mais Joseph apprend qu'Archélaüs règne en Judée. Il a peur pour la vie de l'enfant. Il hésite, il ne sait que faire.

Dieu lui parle de nouveau en songe et le guide vers la Galilée, à Nazareth. Joseph obéit encore. Son inquiétude se change en joie : il va pouvoir vivre en paix avec Jésus et Marie.

Pendant trente ans, Joseph vit à Nazareth avec Jésus et Marie. Trente ans de vie simple, de travail, de prière, d'amour. Trente ans à voir Jésus grandir en sagesse et en grâce.''',
      'priere': '''
Saint Joseph, au nom de votre douleur,
quand, au retour d'Égypte, vous étiez plein d'inquiétude pour Jésus,
et au nom de votre joie quand l'Ange vous dit d'aller à Nazareth,
daignez intercéder pour nous.

Obtenez-nous d'écarter de notre esprit toute crainte nuisible,
afin de jouir de la paix de la conscience.
Amen.''',
      'couleur': Colors.teal.shade300,
      'verset': 'Matthieu 2, 19-23',
    },
    {
      'numero': 7,
      'titre': 'La perte et le retour de Jésus',
      'douleur': 'La perte de Jésus pendant trois jours (Lc 2,45)',
      'joie': 'Jésus retrouvé dans le temple (Lc 2,46)',
      'meditation': '''
Quand Jésus a douze ans, Joseph et Marie le perdent pendant le retour de Jérusalem. Pendant trois jours, ils le cherchent, angoissés. Trois jours d'angoisse, de questions, de peur. Joseph se sent-il coupable ? A-t-il mal surveillé l'enfant ?

Après trois jours, ils retrouvent Jésus au Temple, au milieu des docteurs, paisible. "Pourquoi me cherchiez-vous ? Ne saviez-vous pas que je dois être aux affaires de mon Père ?" Joseph ne comprend pas tout, mais il accueille le mystère.

Cette douleur est celle de tous les parents qui souffrent pour leurs enfants. Mais la joie de retrouver Jésus nous rappelle que nous devons toujours le chercher jusqu'à ce que nous le trouvions.''',
      'priere': '''
Saint Joseph, au nom de votre douleur,
pendant les trois jours d'absence de Jésus,
et au nom de votre joie en le retrouvant dans le temple,
daignez intercéder pour nous.

Obtenez-nous de ne jamais perdre Jésus par le péché,
et si nous avons ce malheur, de le chercher
jusqu'à ce que nous ayons le bonheur de le retrouver.
Amen.''',
      'couleur': Colors.amber.shade300,
      'verset': 'Luc 2, 41-50',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
    // Calculer le dimanche actuel en fonction de la date
    _calculerDimancheActuel();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _calculerDimancheActuel() {
    final now = DateTime.now();
    final feteJoseph = DateTime(now.year, 3, 19);
    
    // Si on est après le 19 mars, on prend l'année prochaine
    if (now.isAfter(feteJoseph)) {
      // On est hors période, on prend le dimanche 1
      _dimancheActuel = 1;
      return;
    }
    
    // Calculer le nombre de dimanches avant le 19 mars
    final daysUntilFete = feteJoseph.difference(now).inDays;
    final weeksUntilFete = (daysUntilFete / 7).ceil();
    
    if (weeksUntilFete <= 7 && weeksUntilFete >= 1) {
      _dimancheActuel = 7 - weeksUntilFete + 1;
    } else {
      _dimancheActuel = 1;
    }
  }

  void _partagerDimanche(int index) {
    final d = _dimanches[index];
    Share.share('''
7 Dimanches de Saint Joseph - Dimanche ${d['numero']}
${d['titre']}

Douleur : ${d['douleur']}
Joie : ${d['joie']}

${d['meditation']}

${d['priere']}

Partagé depuis l'application "Prière à Saint Joseph" 🙏
''');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Les 7 Dimanches de Saint Joseph'),
        backgroundColor: Colors.brown,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: List.generate(7, (index) {
            return Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _dimanches[index]['couleur'],
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    'Dimanche ${index + 1}',
                    style:  TextStyle(fontSize: 11, color: _dimanches[index]['couleur']), 
                  ),
                ],
              ),
            );
          }),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              _showInfoDialog(context);
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(7, (index) {
          return _buildDimancheCard(index);
        }),
      ),
    );
  }

  Widget _buildDimancheCard(int index) {
    final d = _dimanches[index];
    
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
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // En-tête avec numéro
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [d['couleur'], d['couleur'].withOpacity(0.7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: d['couleur'].withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Dimanche ${d['numero']}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    d['titre'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Verset
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                d['verset'],
                style: TextStyle(
                  color: Colors.amber.shade800,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Douleur
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.red.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.water_drop, color: Colors.red.shade700, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Douleur',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      d['douleur'],
                      style: const TextStyle(fontSize: 15, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Joie
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.green.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.celebration, color: Colors.green.shade700, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Joie',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      d['joie'],
                      style: const TextStyle(fontSize: 15, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Méditation
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.auto_stories, color: Colors.brown.shade700, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Méditation',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown.shade700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      d['meditation'],
                      style: const TextStyle(fontSize: 14, height: 1.6),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Prière
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.purple.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.draw, color: Colors.purple.shade700, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Prière',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple.shade700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    d['priere'],
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Un Notre Père, un Je vous salue Marie, un Gloire au Père',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Bouton partager
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _partagerDimanche(index),
                  icon: const Icon(Icons.share),
                  label: const Text('Partager cette méditation'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('À propos des 7 dimanches'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Cette dévotion trouve ses origines dans l\'histoire de deux moines franciscains naufragés. Saint Joseph leur apparut et leur recommanda la dévotion à ses sept douleurs et sept allégresses, promettant sa protection à ceux qui embrasseraient cette pratique.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 12),
              const Text(
                'L\'Église a instauré cette dévotion particulière à saint Joseph en consacrant les sept dimanches précédant sa fête (le 19 mars) à la méditation de ses souffrances et de ses joies.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 12),
              const Text(
                'Chaque dimanche, sont méditées une douleur et une joie de saint Joseph, associées à un passage des Écritures.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pratique :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '1. Méditer la douleur et la joie du dimanche\n'
                      '2. Réciter la prière correspondante\n'
                      '3. Ajouter un Notre Père, un Je vous salue Marie, un Gloire au Père\n'
                      '4. Confier une intention particulière à saint Joseph',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Les 7 dimanches précèdent le 19 mars. Cette année, ils commencent le ${_getDateDebut()}',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  String _getDateDebut() {
    final now = DateTime.now();
    final feteJoseph = DateTime(now.year, 3, 19);
    final debut = feteJoseph.subtract(Duration(days: 7 * 7));
    return DateFormat('d MMMM').format(debut);
  }
}