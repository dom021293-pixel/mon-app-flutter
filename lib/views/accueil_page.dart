// lib/views/accueil_page.dart
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:joe/models/priere_model.dart';
import 'package:joe/models/saint_joseph_model.dart';
import 'package:joe/services/rappel_premier_mercredi_service.dart';
import 'package:joe/views/a_propos_page.dart';
import 'package:joe/views/admin_page.dart';
//import 'package:joe/views/calendrier_meditations_page.dart';
import 'package:joe/views/chapelet_page.dart';
import 'package:joe/views/galerie_page.dart';
import 'package:joe/views/intentions_page.dart';
import 'package:joe/views/intentions_publiques_page.dart';
//import 'package:joe/views/meditation_du_jour_page.dart';
//import 'package:joe/views/menteau_page.dart';
import 'package:joe/views/neuvaines_page.dart';
import 'package:joe/views/parametres_rappels_page.dart';
import 'package:joe/views/prieres_page.dart';
import 'package:joe/views/enseignements_page.dart';
import 'package:joe/views/douleurs_joies_page.dart';
import 'package:joe/views/carte_lieux_page.dart';
import 'package:joe/views/recherche_avancee_page.dart';
import 'package:joe/views/favoris_page.dart';
import 'package:joe/views/calendrier_fetes_page.dart';
import 'package:joe/views/saints_joseph_page.dart';
import 'package:joe/views/sept_dimanches_page.dart';
import 'package:joe/views/temoignages_page.dart';
import 'package:joe/views/temoignages_publiques_page.dart';
import 'package:joe/widgets/priere_card.dart';
import 'package:joe/widgets/citation_aleatoire_widget.dart';
import 'package:joe/widgets/priere_manteau_joseph_widget.dart';
import 'package:joe/widgets/prochaines_fetes_widget.dart';
import 'package:joe/data/prieres_data.dart';
import 'package:joe/data/neuvaines_data.dart';

// Clé globale pour la navigation
final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

class AccueilPage extends StatefulWidget {
  @override
  _AccueilPageState createState() => _AccueilPageState();
}
// Dans accueil_page.dart, ajoutez ce widget après les actions rapides

// Widget pour la section "Saints dévots à Joseph"
class SaintsJosephWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final saints = SaintsJosephData.getSaintsAleatoires(4);
    
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Saints dévots à Saint Joseph',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  SaintsJosephPage(),
                    ),
                  );
                },
                child: const Text('Voir tous'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: saints.length,
              itemBuilder: (context, index) {
                final saint = saints[index];
                return Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 12),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  SaintsJosephPage(),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12),
                              ),
                              image: DecorationImage(
                                image: AssetImage(saint.imageUrl),
                                fit: BoxFit.cover,
                                onError: (_, __) {},
                              ),
                            ),
                          ),
                          // Nom
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              saint.nom,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
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
}
class _AccueilPageState extends State<AccueilPage> {
  int _selectedIndex = 0;
  
  final List<Widget> _pages = [
     AccueilContent(),
     ChapeletPage(),
     NeuvainesPage(),
     PrieresPage(),
    const MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.brown.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          _buildNavItem(
            index: 0,
            icon: Icons.home,
            label: 'Accueil',
            color: Colors.brown,
          ),
          _buildNavItem(
            index: 1,
            icon: Icons.adjust,
            label: 'Chapelet',
            color: Colors.amber,
          ),
          _buildNavItem(
            index: 2,
            icon: Icons.calendar_today,
            label: 'Neuvaines',
            color: Colors.green,
          ),
          _buildNavItem(
            index: 3,
            icon: Icons.book,
            label: 'Prières',
            color: Colors.blue,
          ),
          _buildNavItem(
            index: 4,
            icon: Icons.more_horiz,
            label: 'Plus',
            color: Colors.purple,
          ),
        ],
        selectedItemColor: Colors.brown.shade800,
        unselectedItemColor: Colors.grey.shade600,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? color.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: _selectedIndex == index ? Colors.brown[700] : Colors.grey.shade500,
        ),
      ),
      label: label,
    );
  }
}

// Page "Plus" réorganisée
class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plus'),
        backgroundColor: Colors.brown,
        elevation: 0,
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
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Section Dévotion
            _buildSectionHeader('Dévotion', Icons.favorite),
            _buildMenuItem(
              context,
              icon: Icons.water_drop,
              color: Colors.blue,
              title: '7 Douleurs et 7 Joies',
              subtitle: 'Méditer sur les mystères de Saint Joseph',
              page:  DouleursJoiesPage(),
            ),
            _buildMenuItem(
              context,
              icon: Icons.calendar_month,
              color: Colors.purple,
              title: 'Les 7 Dimanches',
              subtitle: 'Préparation à la fête de Saint Joseph',
              page:  SeptDimanchesPage(),
            ),
            _buildMenuItem(
              context,
              icon: Icons.calendar_month,
              color: Colors.orange,
              title: 'Calendrier liturgique',
              subtitle: 'Toutes les fêtes de l\'année',
              page:  CalendrierFetesPage(),
            ),
            _buildMenuItem(
              context,
              icon: Icons.map,
              color: Colors.green,
              title: 'Lieux dédiés',
              subtitle: 'Sanctuaires et églises',
              page:  CarteLieuxPage(),
            ),
            _buildMenuItem(
            context,
            icon: Icons.church_sharp,
            color: Colors.purple,
            title: 'Confier une intention',
            subtitle: 'Premier mercredi du mois',
            page:  IntentionsPage(),
          ),
                    _buildMenuItem(
            context,
            icon: Icons.celebration,
            color: Colors.green,
            title: 'Témoignages',
            subtitle: 'Partagez les grâces reçues',
            page:  TemoignagesPage(),
          ),

            const SizedBox(height: 16),

          
            _buildMenuItem(
              context,
              icon: Icons.photo_library,
              color: Colors.indigo,
              title: 'Galerie d\'art sacré',
              subtitle: 'Icônes, tableaux, sculptures',
              page:  GaleriePage(),
            ),

            const SizedBox(height: 16),

            // Section Outils
            _buildSectionHeader('Outils', Icons.build),
            _buildMenuItem(
              context,
              icon: Icons.search,
              color: Colors.teal,
              title: 'Recherche avancée',
              subtitle: 'Filtres, tags, recherche globale',
              page:  RechercheAvanceePage(),
            ),
            // Dans accueil_page.dart, ajoutez dans MorePage :

            _buildMenuItem(
              context,
              icon: Icons.settings,
              color: Colors.grey,
              title: 'Paramètres des rappels',
              subtitle: 'Gérer vos rappels de prières',
              page:  ParametresRappelsPage(),
            ),
            _buildMenuItem(
              context,
              icon: Icons.favorite,
              color: const Color.fromARGB(255, 0, 0, 0),
              title: 'Mes favoris',
              subtitle: 'Tous vos éléments sauvegardés',
              page:  FavorisPage(),
            ),
            _buildNotificationTile(context),

            const SizedBox(height: 16),

            // Section Application
            _buildSectionHeader('Application', Icons.info),
            _buildMenuItem(
              context,
              icon: Icons.share,
              color: Colors.purple,
              title: 'Partager',
              subtitle: 'Parler de Saint Joseph',
              isShare: true,
            ),
            _buildMenuItem(
              context,
              icon: Icons.star,
              color: Colors.amber,
              title: 'Noter',
              subtitle: 'Soutenir le développement',
              isRate: true,
            ),
            _buildMenuItem(
              context,
              icon: Icons.info,
              color: Colors.teal,
              title: 'À propos',
              subtitle: 'Version 1.0.0 et coordonnées',
              page:  AProposPage(),
            ),
            _buildMenuItem(
            context,
            icon: Icons.admin_panel_settings,
            color: Colors.grey.shade800,
            title: 'Administration',
            subtitle: 'Gérer le contenu de l\'application',
            page:  AdminPage(),
          ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.brown.shade600),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.brown.shade600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    Widget? page,
    bool isShare = false,
    bool isRate = false,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 2,
      shadowColor: color.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          if (isShare) {
            _partagerApplication(context);
          } else if (isRate) {
            _noterApplication(context);
          } else if (page != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 14, color: color),
            ],
          ),
        ),
      ),
    );
  }

Widget _buildNotificationTile(BuildContext context) {
  return StatefulBuilder(
    builder: (context, setState) {
      return FutureBuilder<bool>(
        future: RappelPremierMercrediService.estRappelActif(),
        builder: (context, snapshot) {
          bool rappelActif = snapshot.data ?? false;
          
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            elevation: 2,
            shadowColor: Colors.orange.withOpacity(0.3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.notifications, color: Colors.orange, size: 20),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rappel premier mercredi',
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Recevez un rappel chaque premier mercredi à 9h',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: rappelActif,
                    onChanged: (value) async {
                      // 1. Changer l'état LOCALEMENT d'abord pour un feedback immédiat
                      setState(() {
                        rappelActif = value;
                      });
                      
                      // 2. Appeler le service pour sauvegarder l'état
                      await RappelPremierMercrediService.setRappelActif(value);
                      
                      // 3. Forcer un rafraîchissement complet du FutureBuilder
                      setState(() {});
                      
                      // 4. Afficher un message de confirmation
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            value 
                              ? '🔔 Rappel activé - Vérifiez vos notifications'
                              : '🔕 Rappel désactivé',
                          ),
                          backgroundColor: value ? Colors.green : Colors.grey,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    activeColor: Colors.orange,
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

  void _partagerApplication(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fonctionnalité de partage à venir'),
        backgroundColor: Colors.brown,
      ),
    );
  }

  void _noterApplication(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Lien vers le store à venir'),
        backgroundColor: Colors.brown,
      ),
    );
  }
}

// Contenu de l'accueil avec image de Saint Joseph
class AccueilContent extends StatelessWidget {
   AccueilContent({super.key});

  final List<Map<String, dynamic>> _categories = [
    const {
      'icon': Icons.adjust,
      'title': 'Chapelet',
      'color': Colors.amber,
    },
    
    const {
      'icon': Icons.calendar_today,
      'title': 'Neuvaines',
      'color': Colors.green,
    },
    const {
      'icon': Icons.book,
      'title': 'Prières',
      'color': Colors.blue,
    },
    const {
      'icon': Icons.school,
      'title': 'Enseignements',
      'color': Colors.purple,
    },
    const {
      'icon': Icons.water_drop,
      'title': '7 Douleurs',
      'color': Colors.indigo,
    },
    const {
      'icon': Icons.map,
      'title': 'Lieux',
      'color': Colors.teal,
    },
    {
       'icon': Icons.favorite,
  'title': 'Intentions',
  'color': Colors.purple,
  //'gradient': [Colors.purple.shade400, Colors.purple.shade700],
  'page': IntentionsPubliquesPage(),
    },
      {
       'icon': Icons.celebration,
  'title': 'Témoignages',
  'color': Colors.lightGreen,
  //'gradient': [Colors.purple.shade400, Colors.purple.shade700],
  'page': TemoignagesPubliquesPage(),
    },
    const {
      'icon': Icons.photo_library,
      'title': 'Galerie',
      'color': Colors.pink,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // App Bar avec image de Saint Joseph
        SliverAppBar(
          expandedHeight: 280,
          floating: false,
          pinned: true,
          
        flexibleSpace: FlexibleSpaceBar(
  centerTitle: true,
  title: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    mainAxisSize: MainAxisSize.min,
    children: [
      const Text(
        'Saint Joseph',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
          shadows: [Shadow(blurRadius: 10, color: Colors.black45)],
        ),
      ),
      const SizedBox(height: 4),
      Text(
        'ite ad Joseph',
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          fontSize: 14,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w400,
          shadows: [Shadow(blurRadius: 8, color: Colors.black38)],
        ),
      ),
    ],
  ),
  titlePadding: const EdgeInsets.only(bottom: 16),

            background: Stack(
              fit: StackFit.expand,
              children: [
                // Image de Saint Joseph
                Image.asset(
                  'images/joseph.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.brown,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.image_not_supported, color: Colors.white54, size: 50),
                          const SizedBox(height: 10),
                          Text(
                            'Saint Joseph',
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                // Dégradé pour meilleure lisibilité du texte
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
                // Motif décoratif
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Opacity(
                    opacity: 0.2,
                    //child: Icon(Icons.cruelty_free, color: Colors.white, size: 60),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Message de bienvenue
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.amber.shade100, Colors.amber.shade50],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.amber.shade200),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.amber.shade200,
                  child: Icon(Icons.church, color: Colors.amber.shade700),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Génèse 41, 55', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(' "Allez à Joseph et présentez lui vos besoins." '),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Menu horizontal
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Découvrir',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown.shade800),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) => _buildCategoryItem(_categories[index], context),
                ),
              ),
            ],
          ),
        ),

        // Widgets de contenu
        
        SliverToBoxAdapter(child: _buildPriereDuJour(context)),
        
        if (NeuvainesData.toutesLesNeuvaines.any((n) {
  // Vérifier si une neuvaine est en cours (soit enCours true, soit jourActuel > 0)
  return n.enCours || n.jourActuel > 0;
}))
  SliverToBoxAdapter(child: _buildNeuvaineEnCours(context)),
SliverToBoxAdapter(
  child: SaintsJosephWidget(),
),
        
         SliverToBoxAdapter(child: CitationAleatoireWidget()),
        // Dans AccueilContent, après CitationAleatoireWidget ou avant Prières recommandées
SliverToBoxAdapter(
  child: PriereManteauJosephWidget(
    onVoirPlus: () {
      Navigator.pushNamed(context, '/priere_detail', arguments: 
        Priere(
          id: 'priere_manteau_joseph',
          titre: 'Prière du Saint Manteau de Saint Joseph',
          sousTitre: 'Une puissante prière de dévotion',
          categorie: 'traditionnelles',
          texte: '''
Au nom du Père, du Fils et du Saint Esprit. Amen.

Jésus, Marie, Joseph, je vous donne mon cœur et mon âme.
(Réciter 3 Gloire au Père à notre Père céleste, en action de grâces pour avoir conféré à Saint Joseph une dignité si exceptionnelle.)

Ô glorieux Patriarche Saint Joseph, je me prosterne humblement devant vous. Je prie le Seigneur Jésus, le Cœur Immaculé de la Vierge Marie et tous les anges et les saints de la cour céleste de se joindre à moi dans cette prière. J'offre cette prière à votre manteau précieux et je promets mon dévouement et une foi sincère. Je m'engage à faire tout ce qui est en mon pouvoir pour vous honorer toute ma vie et vous prouver mon amour.

Aidez-moi, Saint Joseph. Aidez-moi maintenant et tout au long de ma vie, mais surtout à l'heure de ma mort, comme vous avez été aidé par Jésus et Marie, afin que je sois un jour uni à vous au Ciel, pour vous honorer pour toute l'éternité. Amen.

Ô glorieux Patriarche Saint Joseph, prosterné devant vous et votre divin Fils Jésus, je vous offre, avec une dévotion sincère, ce précieux trésor de prière. Vous avez non seulement été entouré de la splendeur lumineuse des rayons du soleil divin de Jésus, mais vous avez aussi été magnifiquement éclairé par le clair de lune mystique de la Bienheureuse Vierge Marie. Ô glorieux Patriarche, je vous présente ce manteau précieux en votre honneur. Accordez-moi, ô grand Saint Joseph, votre regard bienveillant. Je vous supplie, ô glorieux Patriarche, afin que par votre intercession, le Seigneur ne me laisse jamais en exil dans cette vallée de larmes.

Je veux être considéré comme l'un de vos fidèles serviteurs qui vivent avec sérénité sous votre patronage et votre Saint manteau. Faites que je vive toujours sous votre protection, tous les jours de ma vie et surtout au moment de mon dernier souffle. Amen.

Ô glorieux Saint Joseph, vous êtes, après Marie, le Saint le plus digne de notre amour et de notre dévotion. Vous êtes seul, au-dessus de tous les Saints, à avoir été choisi pour avoir l'honneur suprême d'élever, de nourrir et même d'embrasser le Messie, que tant de rois et de prophètes auraient aimé rencontrer.

Saint Joseph, sauvez mon âme et obtenez de la Miséricorde de Dieu un soulagement pour les âmes du Purgatoire.
(3 Gloire au Père)

Ô puissant Saint Joseph, vous avez été proclamé patron de l'Eglise universelle ; par conséquent, je demande l'aide de votre Cœur généreux, toujours prêt pour nous aider. Vers vous, ô glorieux Saint Joseph, les veuves, les orphelins, les abandonnés, les affligés, les opprimés, se tournent tous. Il n'existe pas de douleur, de détresse ou de souffrance que vous n'ayez pas consolée. Daignez, je vous prie, présenter ma requête devant Dieu, jusqu'à ce que j'obtienne la grâce dont j'ai besoin, et n'oubliez pas non plus les âmes du Purgatoire. Saint Joseph, écoutez-moi !
(3 Gloire au Père)

Ô puissant Saint Joseph, innombrables sont ceux qui vous ont prié et qui ont reçu la paix, les grâces et vos faveurs. Mon cœur, si triste et douloureux, n'arrive pas à trouver le repos. Saint Joseph, vous connaissez tous mes besoins, même avant que je ne les exprime dans ma prière. Vous savez combien cette demande est importante pour moi. Je m'incline devant vous. Vous seul pouvez m'aider dans mon chagrin. Saint Joseph, je vous en prie, entendez mon cri ! Sainte Thérèse a dit : "Tout ce que vous demandez à Saint Joseph, il vous l'accordera". Ô Saint Joseph, consolateur des affligés, ayez pitié de ma tristesse et des pauvres âmes qui ont mis tellement d'espoir en vous.
(3 Gloire au Père)

Ô Sublime Patriarche Saint Joseph, par votre obéissance parfaite à Dieu, intercédez pour moi. Par votre vie sainte pleine de grâce et de mérite, entendez ma prière. Par votre nom suave, aidez-moi. Par vos larmes saintes, soutenez-moi. Par vos sept douleurs, intercédez pour moi. Par vos sept joies, consolez-moi. De tous les maux du corps et de l'âme, délivrez-moi. De tous les dangers et les catastrophes, sauvez-moi. Aidez-moi par votre puissante intercession et obtenez pour moi tout ce qui est nécessaire pour le salut, et en particulier pour cette grâce dont j'ai tant besoin (nommer cette grâce).
(3 Gloire au Père)

Ô glorieux Saint Joseph, innombrables sont les grâces et les faveurs que vous avez obtenues pour les âmes troublées, l'assistance aux malades, l'aide aux opprimés, aux persécutés, aux trahis, aux dépouillés de tout confort humain, aux affamés... ; tous ont imploré votre puissante intercession et ont été réconfortés dans leurs afflictions. Ô Saint Joseph, ne permettez pas que je sois le seul à ne pas ressentir votre aide. Montrez-moi votre gentillesse et votre générosité, de sorte que je puisse m'écrier : "Gloire éternelle à notre Saint Patriarche Saint Joseph, mon grand protecteur de la Terre et le défenseur des âmes du Purgatoire."
(3 Gloire au Père)

Père Eternel, qui êtes aux Cieux, par les mérites de Jésus et de Marie, je vous prie d'exaucer ma demande. Au nom de Jésus et de Marie, je m'incline devant votre divine présence et je vous prie d'accepter ma demande, plein d'espoir, afin d'être compté parmi la multitude de ceux qui vivent sous le patronage de Saint Joseph. Etendez votre bénédiction sur ma prière, que je vous offre aujourd'hui comme un gage de mon dévouement.
(3 Gloire au Père)

Invocations en l'honneur de la vie cachée de Saint Joseph avec Jésus et Marie :
Saint Joseph, priez pour que Jésus vienne dans mon âme et me sanctifie.
Saint Joseph, priez pour que Jésus vienne dans mon cœur et m'inspire la charité.
Saint Joseph, priez pour que Jésus vienne dans mon esprit et m'instruise.
Saint Joseph, priez pour que Jésus me guide et renforce ma volonté.
Saint Joseph, priez pour que Jésus dirige mes pensées et les purifie.
Saint Joseph, priez pour que Jésus m'oriente et dirige mes désirs.
Saint Joseph, priez pour que Jésus regarde mes actions et étende ses bénédictions sur moi.
Saint Joseph, priez pour que Jésus me comble d'amour pour lui.
Saint Joseph, demandez à Jésus pour moi l'imitation de vos vertus.
Saint Joseph, demandez à Jésus pour moi un véritable esprit d'humilité.
Saint Joseph, demandez à Jésus pour moi la douceur de son cœur.
Saint Joseph, demandez à Jésus pour moi la paix de l'esprit.
Saint Joseph, demandez à Jésus pour moi la sainte crainte du Seigneur.
Saint Joseph, demandez à Jésus pour moi un désir de perfection.
Saint Joseph, demandez à Jésus pour moi la douceur de cœur.
Saint Joseph, demandez à Jésus pour moi un cœur pur et bienfaisant.
Saint Joseph, demandez à Jésus pour moi la sagesse de la foi.
Saint Joseph, demandez à Jésus pour moi la bénédiction et la persévérance dans les bonnes œuvres.
Saint Joseph, demandez à Jésus pour moi la force de porter mes croix.
Saint Joseph, demandez à Jésus pour moi le mépris pour les biens matériels de ce monde.
Saint Joseph, demandez à Jésus pour moi la grâce de toujours marcher sur la route étroite vers le Ciel.
Saint Joseph, demandez à Jésus pour moi la grâce d'éviter toutes les occasions de pécher.
Saint Joseph, demandez à Jésus pour moi un saint désir de la béatitude éternelle.
Saint Joseph, demandez à Jésus pour moi la grâce de la persévérance finale.
Saint Joseph, ne m'abandonnez pas.
Saint Joseph, priez pour que mon cœur ne cesse jamais de vous aimer et de vous louer.
Saint Joseph, par l'amour que vous avez pour Jésus, faites que je puisse apprendre à l'aimer.
Saint Joseph, acceptez-moi comme votre dévot fidèle.
Saint Joseph, je me donne à vous, acceptez mes prières et entendez-les.
Saint Joseph, ne m'abandonnez pas à l'heure de ma mort.
Jésus, Marie et Joseph, je vous donne mon cœur et mon âme.
(3 Gloire au Père)

Souvenez-vous, ô très chaste époux de la Vierge Marie, mon aimable protecteur, Saint Joseph, qu'on n'a jamais entendu dire que quelqu'un a invoqué votre protection et demandé votre secours sans avoir été consolé. Animé d'une pareille confiance, je viens à vous et me recommande à vous de toute la ferveur de mon âme. Ne rejetez pas ma prière, ô père virginal du Rédempteur, mais daignez l'accueillir avec bonté. Amen.

Glorieux Saint Joseph, époux de la Bienheureuse Vierge Marie et père virginal de Jésus, sauvez-moi et prêtez attention à mes besoins urgents. Enlevez les obstacles et les difficultés rencontrés dans ma prière et accordez-moi une réponse heureuse à ma demande, pour la plus grande gloire de Dieu et mon salut éternel. En signe de ma gratitude, je vous promets de diffuser les merveilles de votre gloire, tout en remerciant le Seigneur.

Prière finale au Saint manteau de Saint Joseph :
Ô glorieux Patriarche Saint Joseph, vous qui avez été choisi par Dieu pardessus tous les hommes de la terre, je vous prie de m'accepter dans les plis de votre Saint manteau, et d'être le gardien de mon âme. Je vous choisis comme mon père, mon protecteur, mon conseiller, mon saint patron. Regardez-moi comme l'un de vos enfants, sauvez-moi de la trahison de mes ennemis, visibles ou invisibles, aidez-moi à tout moment dans tous mes besoins, réconfortez-moi dans l'amertume de ma vie, et surtout au moment de ma mort. Dites seulement un mot pour moi au divin Rédempteur qui vous a jugé digne de le tenir dans vos bras et d'être le digne époux de la Bienheureuse Vierge Marie. Demandez pour moi les bénédictions qui me mèneront au salut. Veuillez inclure mon nom parmi ceux qui vous sont les plus chers et je me montrerai digne de votre protection toute spéciale.
Amen.
''',
          intentions: ['Protection', 'Famille', 'Salut éternel'],
        )
      );
    },
  ),
),
        SliverToBoxAdapter(child: _buildPrieresRecommendees(context)),
        SliverToBoxAdapter(child: ProchainesFetesWidget()),
      ],
    );
  }



  // lib/views/accueil_page.dart
// Correction de la méthode _buildCategoryItem

Widget _buildCategoryItem(Map<String, dynamic> category, BuildContext context) {
  return Container(
    width: 90,
    margin: const EdgeInsets.only(right: 10),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Navigation vers la page correspondante
          switch (category['title']) {
            case 'Chapelet':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  ChapeletPage()),
              );
              break;
                case 'Neuvaines':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  NeuvainesPage()),
              );
            
              break;
            case 'Prières':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  PrieresPage()),
              );
              break;
            case 'Enseignements':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  EnseignementsPage()),
              );
              break;
            case '7 Douleurs':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  DouleursJoiesPage()),
              );
              break;
            case 'Lieux':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  CarteLieuxPage()),
              );
                break;
             case 'Intentions':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IntentionsPubliquesPage()),
      );
      break;
            case 'Témoignages':
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TemoignagesPubliquesPage()),
      );
      break;
            case 'Galerie':
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  GaleriePage()),
              );
              break;
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: category['color'].withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: category['color'].withOpacity(0.3)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(category['icon'], color: category['color'], size: 28),
              const SizedBox(height: 4),
              Text(
                category['title'],
                style: TextStyle(fontSize: 11, color: category['color'], fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

  Widget _buildPriereDuJour(BuildContext context) {
    final priere = PrieresData.toutesLesPrieres[DateTime.now().day % PrieresData.toutesLesPrieres.length];

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.brown.shade300, Colors.brown.shade600]),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.brown.withOpacity(0.3), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: Colors.amber.shade200, child: Icon(Icons.wb_sunny, color: Colors.amber.shade700)),
              const SizedBox(width: 12),
              const Text('Prière du jour', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
          const SizedBox(height: 16),
          Text(priere.titre, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
            child: Text(
              '${priere.texte.substring(0, min(150, priere.texte.length))}...',
              style: const TextStyle(fontSize: 14, color: Colors.white, fontStyle: FontStyle.italic),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, '/priere_detail', arguments: priere),
              style: TextButton.styleFrom(backgroundColor: Colors.white24, foregroundColor: Colors.white),
              child: const Text('Lire la suite'),
            ),
          ),
        ],
      ),
    );
  }

 // Méthode _buildNeuvaineEnCours à jour
Widget _buildNeuvaineEnCours(BuildContext context) {
  // Chercher d'abord une neuvaine avec enCours = true
  var neuvaine = NeuvainesData.toutesLesNeuvaines.firstWhere(
    (n) => n.enCours,
    orElse: () {
      // Sinon, chercher celle qui a le plus grand jourActuel
      return NeuvainesData.toutesLesNeuvaines.reduce(
        (curr, next) => curr.jourActuel > next.jourActuel ? curr : next
      );
    },
  );

  // Si aucune neuvaine n'a de progression, ne rien afficher
  if (neuvaine.jourActuel == 0 && !neuvaine.enCours) {
    return const SizedBox.shrink();
  }

  Color couleur;
  try {
    couleur = Color(int.parse(neuvaine.couleurHex));
  } catch (e) {
    couleur = Colors.brown;
  }

  return Container(
    margin: const EdgeInsets.all(16),
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/neuvaine_detail', arguments: neuvaine),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: couleur.withOpacity(0.1),
                child: Icon(Icons.calendar_today, color: couleur),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      neuvaine.titre,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Jour ${neuvaine.jourActuel + 1}/${neuvaine.jours.length}',
                      style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: neuvaine.progression / 100,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: AlwaysStoppedAnimation<Color>(couleur),
                      minHeight: 6,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: couleur, size: 16),
            ],
          ),
        ),
      ),
    ),
  );
}

  Widget _buildPrieresRecommendees(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Prières recommandées', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown.shade800)),
              TextButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  PrieresPage())),
                child: const Text('Voir toutes'),
              ),
            ],
          ),
          ...PrieresData.toutesLesPrieres.take(2).map((p) => PriereCard(priere: p, showActions: false)),
        ],
      ),
    );
  }
}