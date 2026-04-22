// lib/models/chant_model.dart
class Chant {
  final String id;
  final String titre;
  final String auteur;
  final String paroles;
  final String audioUrl; // URL en ligne
  final String? imageUrl;
  final String categorie;
  final int dureeSecondes;
  final bool estFavori;

  Chant({
    required this.id,
    required this.titre,
    required this.auteur,
    required this.paroles,
    required this.audioUrl,
    this.imageUrl,
    required this.categorie,
    required this.dureeSecondes,
    this.estFavori = false,
  });

  String get dureeFormatted {
    final minutes = dureeSecondes ~/ 60;
    final secondes = dureeSecondes % 60;
    return '$minutes:${secondes.toString().padLeft(2, '0')}';
  }
}

class ChantsData {
  static List<Chant> tousLesChants = [
    Chant(
      id: 'chant1',
      titre: 'Avec un coeur de père',
      auteur: 'Traditionnel',
      paroles: '''
Avec un coeur de père, tu as aimé Jésus.
Tu connais la prière de tes enfants perdus.
Oui, tu es comme un père quand tu regardes, ému,
Les hommes de la terre te chanter, toi, l'élu.

Avec un coeur de père, toi l'humble charpentier,
Tu portes le mystère dans ton humanité.
Veillant dans la nuit claire, Joseph, tu es comblé,
Servant Marie, la mère de l'enfant nouveau-né.

2
Avec un coeur de père, sorti de ton sommeil,
Dans ta maison de pierres, tu gardes le Soleil.
Jésus le Christ, le frère, qui fera des merveilles,
Il est la vraie lumière et n'a pas de pareil.

Avec un coeur de père, tu es là si discret,
Tu fais le nécessaire quand nous sommes inquiets.
Dans nos vies ordinaires, tu es comme un reflet,
De ce Dieu qui éclaire ton visage muet.

3
Avec un coeur de père, tu pars dans le désert,
Tu as fui la colère d'Hérode, ce roi amer.
Et par les vents contraires, tu souffres dans ta chair,
Ton amour est sincère, en Jésus tu espères.

Avec un coeur de père, tu accueilles à toute heure,
Venu des sanctuaires, l'écho de nos clameurs.
Joie d'une nouvelle ère, gardien du Rédempteur,
Saint Joseph notre père, sois loué de tout coeur.
      ''',
      audioUrl: 'https://www.chantonseneglise.fr/index.php/catalogue/mp3/37981',
      imageUrl: 'assets/images/st_joseph_chant.jpg',
      categorie: 'Traditionnel',
      dureeSecondes: 240,
    ),
    Chant(
      id: 'chant2',
      titre: 'Joseph, artisan de paix',
      auteur: 'Communauté de l\'Emmanuel',
      paroles: '''
Joseph, artisan de paix,
Toi qui as su te faire tout petit,
Apprends-nous l'humilité
Dans le silence de nos vies.

Refrain :
Joseph, Joseph, prie pour nous,
Joseph, Joseph, garde-nous.
Joseph, Joseph, montre-nous
Le chemin vers Jésus.

Dans l'atelier de Nazareth,
Tu apprenais à Jésus
Le travail de tes mains
Et la beauté du don de soi.

Refrain

Tu as protégé la Sainte Famille
Des dangers et des méchants,
Veille sur l'Église aujourd'hui,
Protège tous les croyants.

Refrain
      ''',
      audioUrl: 'https://www.example.com/audio/joseph_artisan_de_paix.mp3',
      categorie: 'Contemporain',
      dureeSecondes: 195,
    ),
    Chant(
      id: 'chant3',
      titre: 'Gloire à toi, Joseph',
      auteur: 'Chants de l\'Emmanuel',
      paroles: '''
Gloire à toi, Joseph, homme juste et fidèle,
Toi qui as cru sans voir,
Toi qui as aimé sans mesure,
Toi qui as servi sans compter.

Refrain :
Saint Joseph, notre père,
Saint Joseph, notre guide,
Montre-nous le chemin
Qui mène à Jésus.

Dans l'ombre de Nazareth,
Tu as vécu dans le silence,
Mais ton cœur était tout brûlant
De l'amour du Sauveur.

Refrain

Toi qui es le patron de l'Église,
Protège le peuple de Dieu,
Que tous les hommes soient unis
Dans l'amour du même Père.

Refrain

À l'heure de notre mort,
Sois près de nous, Joseph,
Et conduis-nous vers Jésus
Et Marie, ta bien-aimée.
      ''',
      audioUrl: 'https://www.example.com/audio/gloire_a_toi_joseph.mp3',
      categorie: 'Louange',
      dureeSecondes: 285,
    ),
    Chant(
      id: 'chant4',
      titre: 'Souvenez-vous, ô Joseph',
      auteur: 'Chant grégorien',
      paroles: '''
Souvenez-vous, ô très chaste époux de la Vierge Marie,
Ô mon aimable protecteur, Saint Joseph,
Qu'on n'a jamais entendu dire
Que quelqu'un ait invoqué votre protection,
Demandé votre secours,
Et n'ait pas été consolé.

Animé d'une pareille confiance,
Je viens à vous et je me recommande à vous avec ferveur.
Ah ! ne méprisez pas ma prière,
Mais daignez l'accueillir avec bonté. Amen.
      ''',
      audioUrl: 'https://www.example.com/audio/souvenez_vous_joseph.mp3',
      categorie: 'Traditionnel',
      dureeSecondes: 180,
    ),
    Chant(
      id: 'chant5',
      titre: 'Joseph, gardien du Rédempteur',
      auteur: 'Père Aimé Duval',
      paroles: '''
Joseph, gardien du Rédempteur,
Toi qui as tenu dans tes bras
Celui que le ciel et la terre
Adorent et ne comprennent pas.

Refrain :
Garde-nous, Joseph, garde-nous,
Garde l'Église, garde-nous tous.
Garde nos vies, garde nos cœurs,
Garde-nous près du Sauveur.

Tu as marché dans la nuit
Portant l'Enfant et sa Mère,
Guidé par la voix de Dieu
Vers une terre étrangère.

Refrain

Tu as vécu dans l'atelier
À l'ombre de Jésus et Marie,
Apprenant à l'Enfant-Dieu
Le travail et le don de la vie.

Refrain
      ''',
      audioUrl: 'https://www.example.com/audio/joseph_gardien_du_redempteur.mp3',
      categorie: 'Contemporain',
      dureeSecondes: 260,
    ),
    Chant(
      id: 'chant6',
      titre: 'Ô Joseph, époux de Marie',
      auteur: 'Traditionnel',
      paroles: '''
Ô Joseph, époux de Marie,
Toi qui fus choisi par le Père
Pour être sur terre le père
De Jésus, le Fils bien-aimé.

Refrain :
Saint Joseph, priez pour nous,
Saint Joseph, veillez sur nous,
Maintenant et à l'heure
De notre mort. Amen.

Tu as connu l'inquiétude
Devant le mystère de Dieu,
Mais ta foi fut sans limites,
Ton cœur généreux et joyeux.

Refrain

Toi qui es le modèle des pères,
Apprends-nous à aimer sans fin,
À protéger ceux qui nous sont chers,
À les guider vers le chemin.

Refrain
      ''',
      audioUrl: 'https://www.example.com/audio/o_joseph_epoux_de_marie.mp3',
      categorie: 'Traditionnel',
      dureeSecondes: 225,
    ),
    Chant(
      id: 'chant7',
      titre: 'Viens avec nous, Joseph',
      auteur: 'Communauté de Taizé',
      paroles: '''
Viens avec nous, Joseph,
Viens avec nous, Joseph,
Sur le chemin de la vie,
Viens avec nous, Joseph.

Toi qui as marché dans la foi,
Toi qui as cru sans voir,
Apprends-nous la confiance,
Apprends-nous l'espérance.

Viens avec nous, Joseph,
Viens avec nous, Joseph,
Sur le chemin de la vie,
Viens avec nous, Joseph.

Toi qui as protégé l'Enfant,
Toi qui as aimé Marie,
Veille sur notre famille,
Garde-nous dans l'unité.

Viens avec nous, Joseph,
Viens avec nous, Joseph,
Sur le chemin de la vie,
Viens avec nous, Joseph.
      ''',
      audioUrl: 'https://www.example.com/audio/viens_avec_nous_joseph.mp3',
      categorie: 'Taizé',
      dureeSecondes: 210,
    ),
    Chant(
      id: 'chant8',
      titre: 'Litanie de Saint Joseph',
      auteur: 'Chant liturgique',
      paroles: '''
Saint Joseph, priez pour nous.
Noble rejeton de David, priez pour nous.
Lumière des Patriarches, priez pour nous.
Époux de la Mère de Dieu, priez pour nous.
Chaste gardien de la Vierge, priez pour nous.
Père nourricier du Fils de Dieu, priez pour nous.
Défenseur du Christ, priez pour nous.
Chef de la Sainte Famille, priez pour nous.
Joseph très juste, priez pour nous.
Joseph très chaste, priez pour nous.
Joseph très prudent, priez pour nous.
Joseph très fort, priez pour nous.
Joseph très obéissant, priez pour nous.
Joseph très fidèle, priez pour nous.
Miroir de patience, priez pour nous.
Amateur de la pauvreté, priez pour nous.
Modèle des travailleurs, priez pour nous.
Gloire de la vie domestique, priez pour nous.
Gardien des vierges, priez pour nous.
Soutien des familles, priez pour nous.
Consolation des malheureux, priez pour nous.
Espérance des malades, priez pour nous.
Patron des mourants, priez pour nous.
Terreur des démons, priez pour nous.
Protecteur de la Sainte Église, priez pour nous.
      ''',
      audioUrl: 'https://www.example.com/audio/litanie_saint_joseph.mp3',
      categorie: 'Liturgique',
      dureeSecondes: 300,
    ),
    // lib/models/chant_model.dart (ajout du chant complet)

Chant(
  id: 'chant9',
  titre: 'Saint-Joseph, écoute ma prière',
  auteur: 'Père Patrick Gorce',
  paroles: '''
Saint-Joseph, écoute ma prière
Guide-moi vers Lui comme un enfant
Saint-Joseph, obtiens moi sa lumière
Pour rester en Lui toujours présent.

Refrain :
Saint-Joseph, écoute ma prière
Guide-moi vers Lui comme un enfant
Saint-Joseph, obtiens moi sa lumière
Pour rester en Lui toujours présent.

1.- Bienheureux l’humble époux de Marie
Protecteur et père nourricier,
Accueillant chastement dans sa vie
Un PROJET - SON PROJET.

Refrain

2.- Bienheureux qui peut permettre à l’autre
De grandir, de naître et devenir,
Le témoin silencieux et l’apôtre
D’UN DÉSIR - SON DÉSIR.

Refrain

3.- Bienheureux serviteur d’un mystère
Recensé aux livres des vivants,
Pour rester simple dépositaire
DE L’ENFANT - SON ENFANT.

Refrain

4.- Bienheureux qui vit à mains ouvertes
Et choisit la pureté du cœur,
Pour permettre en soi la découverte
DU BONHEUR - SON BONHEUR.

Saint-Joseph, écoute ma prière
Guide-moi vers Lui comme un enfant
Saint-Joseph, obtiens moi sa lumière
Pour rester en Lui toujours présent.
''',
  audioUrl: 'https://www.example.com/audio/saint_joseph_ecoute_ma_priere.mp3',
  imageUrl: 'assets/images/st_joseph_priere.jpg',
  categorie: 'Contemporain',
  dureeSecondes: 280, // 4 minutes 40 secondes
),
  ];

  static List<Chant> getChantsParCategorie(String categorie) {
    return tousLesChants.where((c) => c.categorie == categorie).toList();
  }

  static List<String> getCategories() {
    return tousLesChants.map((c) => c.categorie).toSet().toList();
  }
}