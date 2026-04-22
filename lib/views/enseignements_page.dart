// lib/views/enseignements_page.dart
import 'package:flutter/material.dart';
import 'package:joe/models/enseignement_model.dart';
//import 'package:joe/views/enseignement_detail_page.dart';

class EnseignementsPage extends StatelessWidget {
  final List<Enseignement> enseignements = [
    Enseignement(
      id: '1',
      titre: 'La vie cachée de Saint Joseph',
      auteur: 'Pape François',
      extrait: 'Joseph est l\'homme qui passe inaperçu, l\'homme du quotidien, l\'homme de la présence discrète.',
      contenu: '''Saint Joseph est le modèle de la vie cachée. Pendant trente ans, il a vécu à Nazareth dans le silence et l'obscurité, accomplissant humblement son devoir d'époux et de père. Sa vie nous enseigne que la sainteté se trouve souvent dans la fidélité aux petites choses du quotidien.

Dans un monde qui recherche la visibilité et la reconnaissance, Joseph nous rappelle la valeur de l'humilité et du service discret. Il n'a pas cherché à paraître, mais à être pleinement présent à ceux qui lui étaient confiés.

Le pape François, dans sa lettre apostolique "Patris corde", souligne que Joseph est un père aimé, un père tendre et obéissant, un père accueillant. C'est dans l'ombre de Nazareth qu'il a protégé et éduqué le Fils de Dieu.

Que Saint Joseph nous apprenne à valoriser les moments cachés de notre vie, ceux que personne ne voit mais qui construisent silencieusement notre sainteté.''',
      categorie: 'Papes',
      date: '8 décembre 2020',
      imageUrl: 'assets/images/pape_francois.jpg',
      references: ['Lettre apostolique "Patris corde"'],
    ),
    Enseignement(
      id: '2',
      titre: 'Joseph, l\'homme juste',
      auteur: 'Benoît XVI',
      extrait: 'Joseph est appelé "juste" dans l\'Évangile, ce qui indique sa parfaite harmonie avec la volonté de Dieu.',
      contenu: '''Le titre de "juste" donné à Joseph dans l'Évangile indique sa parfaite observance de la Loi et sa droiture de cœur. Sa justice n'est pas une simple observance extérieure, mais une adhésion profonde à la volonté de Dieu, même quand celle-ci dépasse l'entendement humain.

Joseph est juste parce qu'il est totalement ouvert à Dieu. Quand l'ange lui révèle le mystère de l'incarnation, il ne doute pas, il obéit. Sa justice est une justice de foi, qui accueille le plan de Dieu sans le comprendre pleinement.

Cette justice se manifeste aussi dans sa délicatesse envers Marie. Voulant la protéger, il décide de la répudier secrètement. C'est un homme bon, qui ne veut pas nuire, même quand il est dans l'incompréhension.

Benoît XVI nous invite à contempler en Joseph le modèle de l'homme qui vit en communion avec Dieu et qui, par sa justice, prépare les voies du Seigneur.''',
      categorie: 'Papes',
      date: '18 décembre 2005',
      imageUrl: 'assets/images/benoit16.jpg',
      references: ['Angélus du 18 décembre 2005'],
    ),
    Enseignement(
      id: '3',
      titre: 'Le silence de Joseph',
      auteur: 'Saint Jean-Paul II',
      extrait: 'Par son silence, Joseph nous parle et nous enseigne l\'art de l\'écoute intérieure.',
      contenu: '''Le silence de Joseph est particulièrement éloquent. Dans les Évangiles, il ne prononce pas une seule parole. Pourtant, son silence n'est pas un vide, mais une plénitude. C'est le silence de l'écoute, de la contemplation, de l'obéissance.

Dans le silence, Joseph accueille la parole de Dieu. Dans le silence, il protège Marie et l'Enfant. Dans le silence, il travaille et éduque Jésus. Son silence est habité par la présence de Dieu.

Notre époque a besoin de redécouvrir la valeur du silence. Nous sommes submergés de paroles, de bruit, d'images. Le silence nous fait peur. Pourtant, c'est dans le silence que Dieu parle au cœur de l'homme. C'est dans le silence que nous pouvons vraiment écouter et comprendre.

Joseph nous apprend l'art du silence intérieur. Il nous montre comment, dans le silence, nous pouvons être pleinement présents à Dieu et aux autres. Son silence n'est pas une absence, mais une présence profonde et aimante.''',
      categorie: 'Papes',
      date: '19 mars 1989',
      imageUrl: 'assets/images/jean_paul2.jpg',
      references: ['Exhortation "Redemptoris Custos"'],
    ),
    Enseignement(
      id: '4',
      titre: 'Saint Joseph, modèle des travailleurs',
      auteur: 'Saint Jean-Paul II',
      extrait: 'Le travail a été la manifestation quotidienne de l\'amour de Joseph pour Jésus et Marie.',
      contenu: '''L'Évangile ne conserve aucune parole de Joseph, mais il garde le témoignage de sa vie et de son travail. Le travail humain, en particulier le travail manuel, trouve dans la Sainte Famille de Nazareth une exaltation particulière. Joseph était un travailleur, il a appris son métier à Jésus, et ensemble ils ont partagé la fatigue et la joie du travail quotidien.

Le travail n'est pas seulement une activité humaine, mais il participe à l'œuvre créatrice de Dieu. En travaillant, l'homme imite son Créateur et collabore à la transformation du monde. Joseph nous apprend que le travail, même le plus humble, a une dignité et une valeur spirituelle.

Dans le contexte actuel de chômage et de précarité, saint Joseph est un modèle pour tous ceux qui cherchent un emploi ou qui peinent dans leur travail. Il nous rappelle que le travail est un droit et un devoir, et qu'il doit être organisé de manière à respecter la dignité de la personne humaine.

Que saint Joseph, le travailleur de Nazareth, intercède pour tous ceux qui sont sans emploi, pour ceux qui sont exploités, pour ceux qui peinent dans des conditions difficiles.''',
      categorie: 'Papes',
      date: '1er mai 1995',
      imageUrl: 'assets/images/jean_paul2_travail.jpg',
      references: ['Encyclique "Laborem exercens"', 'Homélie du 1er mai 1995'],
    ),
    Enseignement(
      id: '5',
      titre: 'La confiance absolue de Joseph',
      auteur: 'Saint Josémaria Escriva',
      extrait: 'Joseph a cru sans voir, il a obéi sans comprendre, il a fait confiance sans réserve.',
      contenu: '''Saint Joseph a été un homme d'une foi et d'une confiance absolues. Quand l'ange lui annonce en songe que Marie est enceinte par l'œuvre du Saint-Esprit, il obéit sans hésiter. Il ne demande pas de signes, ne pose pas de conditions. Il fait confiance.

Quand l'ange lui dit de fuir en Égypte, il se lève la nuit même et part. Il ne demande pas où il va, ni pour combien de temps. Il fait confiance. Quand l'ange lui dit de revenir, il revient. Toujours cette même confiance totale.

Cette confiance de Joseph est d'autant plus admirable que les situations dans lesquelles il se trouve sont humainement incompréhensibles. Une vierge qui enfante, un Dieu qui devient enfant, une fuite précipitée... Tout cela dépasse la raison humaine. Mais Joseph ne raisonne pas, il fait confiance.

Nous avons tant besoin de cette confiance aujourd'hui. Face aux difficultés de la vie, face aux situations que nous ne comprenons pas, nous sommes appelés à imiter Joseph : faire confiance à Dieu, même quand nous ne voyons pas le chemin.''',
      categorie: 'Saints',
      date: '19 mars 1956',
      imageUrl: 'assets/images/josemaria.jpg',
      references: ['Homélie "En la solennité de saint Joseph"'],
    ),
    Enseignement(
      id: '6',
      titre: 'Saint Joseph dans la vie de Sainte Thérèse',
      auteur: 'Sainte Thérèse de Lisieux',
      extrait: 'Je n\'ai jamais rien demandé à saint Joseph sans être exaucée.',
      contenu: '''Dès son plus jeune âge, Thérèse a eu une dévotion particulière pour saint Joseph. Elle raconte dans ses écrits comment, à l'âge de cinq ou six ans, elle avait déjà une grande confiance en lui.

Mais c'est surtout lors d'une grave maladie qu'elle expérimente sa protection. Alors qu'elle est gravement malade et que les médecins désespèrent de la guérir, sa sœur Pauline place une statue de saint Joseph près de son lit. Thérèse se tourne vers lui avec une foi simple et confiante. Soudain, elle voit la statue s'animer, saint Joseph lui sourit et elle est guérie instantanément.

Plus tard, devenue carmélite, Thérèse continue de confier à saint Joseph toutes ses intentions. Elle écrit : "Je n'ai jamais rien demandé à saint Joseph sans être exaucée. Il est vraiment le père des âmes intérieures, celui qui sait protéger dans les difficultés et obtenir les grâces nécessaires."

Pour Thérèse, saint Joseph est le modèle de la vie cachée, celui qui a vécu dans l'intimité de Jésus et Marie sans chercher à paraître.''',
      categorie: 'Saints',
      date: 'De "Histoire d\'une âme"',
      imageUrl: 'assets/images/therese.jpg',
      references: ['Histoire d\'une âme', 'Poésies de Sainte Thérèse'],
    ),
    Enseignement(
      id: '7',
      titre: 'Saint Joseph, Patron de l\'Église universelle',
      auteur: 'Pape Léon XIII',
      extrait: 'Joseph a été constitué par Dieu comme le protecteur de la Sainte Famille et de l\'Église.',
      contenu: '''C'est le pape Léon XIII qui, en 1889, a déclaré saint Joseph Patron de l'Église universelle. Dans son encyclique "Quamquam pluries", il explique pourquoi l'Église confie à Joseph sa protection.

"Joseph a été constitué par Dieu comme le protecteur de la Sainte Famille de Nazareth, comme le père virginal de Jésus. Il est juste et naturel que, comme il a protégé la Sainte Famille pendant sa vie terrestre, il protège maintenant l'Église, qui est la famille spirituelle de Jésus."

Léon XIII souligne que Joseph partage avec Marie une intimité unique avec Jésus. Personne après Marie n'a été aussi proche du Sauveur. Personne n'a mieux connu son cœur, ses besoins, ses désirs. Joseph est donc l'intercesseur le plus puissant après Marie.

Le pape invite tous les fidèles à recourir à saint Joseph dans leurs nécessités, particulièrement dans les moments difficiles pour l'Église. Il promet que ceux qui l'invoquent avec confiance seront exaucés, car Joseph, qui a protégé Jésus sur terre, ne peut rien refuser à ceux qui appartiennent à Jésus.''',
      categorie: 'Papes',
      date: '15 août 1889',
      imageUrl: 'assets/images/leon13.jpg',
      references: ['Encyclique "Quamquam pluries"'],
    ),
    Enseignement(
      id: '8',
      titre: 'La paternité de Joseph',
      auteur: 'Pape François',
      extrait: 'Joseph a exercé la paternité de manière créative, entre tendresse et fermeté.',
      contenu: '''La paternité de Joseph est unique. Il n'est pas le père biologique de Jésus, mais il exerce pleinement sa paternité par l'accueil, la protection et l'éducation. Le pape François, dans "Patris corde", développe cette dimension :

"Joseph a exercé la paternité de manière créative, entre tendresse et fermeté. Il a su être présent de manière discrète, sans imposer sa volonté, mais en accompagnant la croissance de l'enfant avec sagesse et amour."

Cette paternité est aussi une paternité qui accepte l'ombre. Joseph accepte de ne pas tout comprendre, de ne pas être au premier plan. Il laisse Dieu agir et se contente de servir le mystère qui le dépasse.

Aujourd'hui, dans un monde où la figure paternelle est souvent fragilisée, Joseph est un modèle pour tous les pères. Il leur apprend à aimer sans posséder, à guider sans contraindre, à protéger sans étouffer.''',
      categorie: 'Papes',
      date: '8 décembre 2020',
      imageUrl: 'assets/images/pape_francois_paternite.jpg',
      references: ['Lettre apostolique "Patris corde"'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enseignements sur Saint Joseph'),
        backgroundColor: Colors.brown,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _showSearchDialog(context);
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
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: enseignements.length,
          itemBuilder: (context, index) {
            return _buildEnseignementCard(context, enseignements[index], index);
          },
        ),
      ),
    );
  }

  Widget _buildEnseignementCard(BuildContext context, Enseignement enseignement, int index) {
    // Couleurs alternées pour les cartes
    final Color backgroundColor = index.isEven 
        ? Colors.white 
        : Colors.brown.shade50;
    
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 4,
      shadowColor: Colors.brown.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/enseignement_detail',
            arguments: enseignement,
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // En-tête avec catégorie
              Container(
                padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        enseignement.categorie,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.menu_book,
                      color: Colors.white.withOpacity(0.5),
                      size: 16,
                    ),
                  ],
                ),
              ),
              
              // Contenu de la carte
              Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icône ou image
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.brown.shade300,
                            Colors.brown.shade600,
                          ],
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.brown.withOpacity(0.3),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          '📖',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    
                    // Texte
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            enseignement.titre,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown.shade800,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'par ${enseignement.auteur}',
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: Colors.brown.shade600,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.amber.shade50,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.amber.shade200,
                                width: 1,
                              ),
                            ),
                            child: Text(
                              '"${enseignement.extrait}"',
                              style: TextStyle(
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                                color: Colors.amber.shade800,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 12),
                          
                          // Métadonnées
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                size: 12,
                                color: Colors.grey.shade500,
                              ),
                              SizedBox(width: 4),
                              Text(
                                enseignement.date,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              SizedBox(width: 20),//overf
                              Icon(
                                Icons.bookmark,
                                size: 12,
                                color: Colors.grey.shade500,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '${enseignement.references.length} réf.',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    // Flèche
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.brown.shade400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Rechercher un enseignement'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Titre, auteur, mot-clé...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.brown),
                ),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    Navigator.pop(dialogContext); // Ferme le dialogue
                    _showSearchResults(context, value); // Utilise le contexte original
                  }
                },
              ),
              SizedBox(height: 16),
              // Suggestions rapides
              Wrap(
                spacing: 8,
                children: [
                  _buildSuggestionChip(context, 'Pape François'),
                  _buildSuggestionChip(context, 'Silence'),
                  _buildSuggestionChip(context, 'Travail'),
                  _buildSuggestionChip(context, 'Confiance'),
                  _buildSuggestionChip(context, 'Famille'),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                if (searchController.text.isNotEmpty) {
                  Navigator.pop(dialogContext); // Ferme le dialogue
                  _showSearchResults(context, searchController.text); // Utilise le contexte original
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
              ),
              child: Text('Rechercher'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSuggestionChip(BuildContext originalContext, String label) {
    return FilterChip(
      label: Text(label),
      onSelected: (selected) {
        Navigator.pop(originalContext); // Ferme le dialogue
        _showSearchResults(originalContext, label); // Utilise le contexte original
      },
      backgroundColor: Colors.brown.shade50,
      selectedColor: Colors.brown.shade200,
      labelStyle: TextStyle(color: Colors.brown.shade800),
    );
  }

  void _showSearchResults(BuildContext context, String query) {
    // Filtrer les enseignements
    List<Enseignement> results = enseignements.where((e) {
      return e.titre.toLowerCase().contains(query.toLowerCase()) ||
             e.auteur.toLowerCase().contains(query.toLowerCase()) ||
             e.extrait.toLowerCase().contains(query.toLowerCase()) ||
             e.contenu.toLowerCase().contains(query.toLowerCase());
    }).toList();
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext bottomSheetContext) {
        return DraggableScrollableSheet(
          initialChildSize: 0.9,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (BuildContext scrollContext, ScrollController scrollController) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  // Handle
                  Container(
                    width: 40,
                    height: 4,
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Text(
                    'Résultats pour "$query"',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade800,
                    ),
                  ),
                  Text(
                    '${results.length} enseignement(s) trouvé(s)',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: 16),
                  Divider(),
                  Expanded(
                    child: results.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search_off,
                                  size: 64,
                                  color: Colors.grey.shade400,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Aucun résultat trouvé',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            controller: scrollController,
                            itemCount: results.length,
                            itemBuilder: (BuildContext listContext, int index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.brown.shade100,
                                  child: Text(
                                    '📖',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                title: Text(
                                  results[index].titre,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(results[index].auteur),
                                onTap: () {
                                  Navigator.pop(bottomSheetContext); // Ferme le bottom sheet
                                  Navigator.pushNamed(
                                    context, // Utilise le contexte original
                                    '/enseignement_detail',
                                    arguments: results[index],
                                  );
                                },
                              );
                            },
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
}