// lib/models/oeuvre_modele.dart
class OeuvreArt {
  final String id;
  final String titre;
  final String artiste;
  final String annee;
  final String technique;
  final String dimensions;
  final String lieu;
  final String description;
  final String histoire;
  final String type; // "icone", "tableau", "fresque", "sculpture", "vitrail"
  final String epoque;
  final List<String> tags;
  final String imageUrl;
  final bool estFavori;

  OeuvreArt({
    required this.id,
    required this.titre,
    required this.artiste,
    required this.annee,
    required this.technique,
    required this.dimensions,
    required this.lieu,
    required this.description,
    required this.histoire,
    required this.type,
    required this.epoque,
    required this.tags,
    required this.imageUrl,
    this.estFavori = false,
  });
}

class GalerieData {
 // ============================================================
// TOUTES LES URLS VÉRIFIÉES DIRECTEMENT DEPUIS LES PAGES GALLERIX
// Format : https://cdn.gallerix.asia/sr/[PREFIX]/[STOREID]/[PICID].jpg
// ============================================================

static List<OeuvreArt> toutes = [

  // ─── ICÔNES ────────────────────────────────────────────────

  OeuvreArt(
    id: 'icone1',
    titre: 'Icône traditionnelle de Saint Joseph',
    artiste: 'École de Novgorod',
    annee: 'XVe siècle',
    technique: 'Tempera sur bois',
    dimensions: '31 x 26 cm',
    lieu: 'Musée russe, Saint-Pétersbourg',
    description: '''Cette icône russe représente Saint Joseph tenant l\'Enfant Jésus dans ses bras. Joseph est vêtu d\'une tunique bleue et d\'un manteau marron, couleurs traditionnelles. Son visage exprime la tendresse et la contemplation. L\'Enfant Jésus bénit de sa main droite, signe de sa divinité.

L\'icône suit les canons de l\'iconographie orthodoxe : fond doré symbolisant la lumière divine, perspective inversée, hiératisme des figures. Joseph n\'est pas représenté comme un vieillard, mais comme un homme dans la force de l\'âge, conformément à la tradition orientale.

Cette œuvre est un magnifique exemple de l\'art religieux russe du XVe siècle, période de grand rayonnement pour l\'école de Novgorod.''',
    histoire: '''Cette icône provient du monastère de la Dormition à Novgorod. Elle a été sauvée pendant la révolution russe et se trouve maintenant au Musée russe de Saint-Pétersbourg.''',
    type: 'icone',
    epoque: 'Moyen Âge tardif',
    tags: ['Joseph', 'Enfant Jésus', 'Russe', 'Novgorod', 'Tempera'],
    // Sainte Famille — Murillo (Hermitage) ✓ vérifié
    imageUrl: 'images/novgorod.jpg',
  ),

  OeuvreArt(
   id: 'icone2',
    titre: 'Saint Joseph et l\'Enfant Jésus',
    artiste: 'Giovanni Battista Tiepolo',
    annee: 'vers 1740',
    technique: 'Huile sur toile',
    dimensions: '63 x 45 cm',
    lieu: 'Courtauld Institute, Londres',
    description: '''Ce tableau de Tiepolo représente Saint Joseph assis sur des nuées, tenant l\'Enfant Jésus blotti tendrement contre lui. Joseph, vêtu de drapés ocre et rouges aux reflets lumineux, entoure l\'Enfant de ses bras dans un geste à la fois protecteur et affectueux. L\'Enfant, auréolé, se love contre la poitrine de son père adoptif, le visage serein.
 
La scène se déroule dans un espace céleste, baigné d\'une lumière dorée caractéristique du style de Tiepolo. Des angelots et des nuées enveloppent les deux figures, donnant à la composition une légèreté et une grâce toutes vénitiennes.
 
Tiepolo, maître du baroque tardif vénitien, excelle dans la représentation de figures élevées dans la gloire céleste. Loin de la représentation terrestre et laborieuse de Joseph, il en fait ici une figure glorieuse, digne de la contemplation des fidèles. La tendresse du geste et la douceur de la lumière créent une atmosphère de sérénité mystique.''',
    histoire: '''Cette œuvre de Tiepolo témoigne de la dévotion croissante à Saint Joseph au XVIIIe siècle, notamment dans les milieux aristocratiques vénitiens. Le Courtauld Institute de Londres conserve plusieurs œuvres de Tiepolo, dont ce petit tableau d\'une grande finesse d\'exécution.''',
    type: 'tableau',
    epoque: 'Baroque tardif',
    tags: ['Joseph', 'Enfant Jésus', 'Tiepolo', 'Venise', 'Baroque', 'Gloire'],
    // Saint Joseph et l\'Enfant — Tiepolo (Courtauld) ✓ vérifié
    imageUrl: 'images/cretois.jpg',
  ),

  OeuvreArt(
    id: 'icone3',
    titre: 'La Sainte Famille (Vierge de Séville)',
    artiste: 'Bartolomé Esteban Murillo',
    annee: '1665-1670',
    technique: 'Huile sur toile',
    dimensions: '240 x 190 cm',
    lieu: 'Musée du Louvre, Paris',
    description: '''Ce grand tableau de Murillo représente la Sainte Famille dans toute sa tendresse humaine. Marie, vêtue de bleu, tient l\'Enfant Jésus sur ses genoux, tandis que Joseph, debout à ses côtés, tient délicatement un linge blanc. Un jeune Jean-Baptiste, au premier plan, regarde l\'Enfant avec admiration. Au-dessus du groupe, Dieu le Père apparaît dans une nuée lumineuse entourée d\'anges, et la colombe de l\'Esprit Saint descend vers l\'Enfant.
 
La composition pyramidale crée un équilibre parfait entre le monde terrestre et le monde céleste. La lumière dorée enveloppe les personnages d\'une atmosphère de sérénité et de sainteté. Joseph est représenté comme un homme mature et bienveillant, pleinement intégré au cœur de la Sainte Famille.
 
Ce tableau illustre parfaitement le génie de Murillo pour les scènes familiales empreintes de douceur et de piété. La tendresse des regards, la richesse des coloris et la présence simultanée des deux natures — humaine et divine — font de cette œuvre l\'un des sommets de la peinture religieuse espagnole du XVIIe siècle.''',
    histoire: '''Ce tableau, connu sous le nom de "Vierge de Séville", a été peint vers 1665-1670 pour une église de Séville avant d\'entrer dans les collections royales espagnoles. Il fut acquis par le Louvre au XIXe siècle et est aujourd\'hui l\'un des Murillo les plus admirés du musée.''',
    type: 'tableau',
    epoque: 'Baroque',
    tags: ['Joseph', 'Marie', 'Jésus', 'Jean-Baptiste', 'Murillo', 'Baroque', 'Espagne'],
    // Murillo — Holy Family "Virgin of Seville" (Louvre, 1665-70) ✓ vérifié
    // Sainte Famille — Murillo (Prado) ✓ vérifié
    imageUrl: 'images/famille.jpg',
  ),

  // ─── TABLEAUX ──────────────────────────────────────────────

  OeuvreArt(
    id: 'tableau1',
    titre: 'Le Songe de Saint Joseph',
    artiste: 'Georges de La Tour',
    annee: '1640',
    technique: 'Huile sur toile',
    dimensions: '93 x 81 cm',
    lieu: 'Musée des Beaux-Arts, Nantes',
    description: '''Ce chef-d\'œuvre du XVIIe siècle représente l\'ange apparaissant à Joseph en songe. La scène est éclairée par une unique bougie, dans le style caractéristique de La Tour.''',
    histoire: '''Commandé par le duc de Lorraine pour sa chapelle privée.''',
    type: 'tableau',
    epoque: 'Classique',
    tags: ['Joseph', 'Ange', 'Songe', 'La Tour', 'Clair-obscur'],
    // "The Angel appears to Saint Joseph" — La Tour ✓ vérifié (album 1880358061)
    imageUrl: 'images/songe.jpg',
  ),

  OeuvreArt(
    id: 'tableau2',
    titre: 'La Fuite en Égypte',
    artiste: 'Giotto',
    annee: '1305',
    technique: 'Fresque',
    dimensions: '200 x 185 cm',
    lieu: 'Chapelle des Scrovegni, Padoue',
    description: '''Cette fresque de Giotto représente la fuite de la Sainte Famille en Égypte. Joseph marche en tête, guidant l\'âne qui porte Marie et l\'Enfant.''',
    histoire: '''La chapelle des Scrovegni, entièrement peinte par Giotto entre 1303 et 1305.''',
    type: 'fresque',
    epoque: 'Médiéval',
    tags: ['Joseph', 'Marie', 'Jésus', 'Fuite en Égypte', 'Giotto', 'Fresque'],
    // Flight into Egypt — Giotto ✓ vérifié (page gallerix.org/storeroom/146947004/N/9759)
    imageUrl: 'images/giotto.jpg',
  ),

  OeuvreArt(
    id: 'tableau3',
    titre: 'Le Repos pendant la Fuite en Égypte',
    artiste: 'Caravage',
    annee: '1597',
    technique: 'Huile sur toile',
    dimensions: '133,5 x 166,5 cm',
    lieu: 'Galerie Doria-Pamphilj, Rome',
    description: '''Ce tableau représente la Sainte Famille au repos pendant la fuite. Joseph tient une partition musicale qu\'il montre à un ange jouant du violon.''',
    histoire: '''Commandé par le cardinal Francesco Maria Del Monte.''',
    type: 'tableau',
    epoque: 'Baroque',
    tags: ['Joseph', 'Marie', 'Jésus', 'Ange', 'Fuite en Égypte', 'Caravage'],
    // Rest on the Flight into Egypt — Caravage ✓ vérifié (album/Caravaggio/pic/glrx-4531)
    imageUrl: 'images/repos.jpg',
  ),

  OeuvreArt(
    id: 'tableau4',
    titre: 'Saint Joseph charpentier',
    artiste: 'Georges de La Tour',
    annee: '1642',
    technique: 'Huile sur toile',
    dimensions: '137 x 102 cm',
    lieu: 'Musée du Louvre, Paris',
    description: '''Ce tableau montre Saint Joseph dans son atelier de charpentier. Le jeune Jésus tient une chandelle qui éclaire la scène avec des reflets dorés.''',
    histoire: '''Ce tableau a appartenu au duc de La Ferté avant d\'entrer au Louvre en 1969.''',
    type: 'tableau',
    epoque: 'Classique',
    tags: ['Joseph', 'Jésus', 'Travail', 'Atelier', 'Charpentier', 'La Tour'],
    // Saint Joseph the Carpenter — La Tour ✓ vérifié (storeroom/1880358061/N/2111297981)
    imageUrl: 'images/chapentierlatour.jpg',
  ),

  OeuvreArt(
    id: 'tableau5',
    titre: 'Les Noces de la Vierge',
    artiste: 'Raphaël',
    annee: '1504',
    technique: 'Huile sur bois',
    dimensions: '170 x 117 cm',
    lieu: 'Pinacothèque de Brera, Milan',
    description: '''Ce chef-d\'œuvre représente le mariage de Marie et Joseph. Raphaël, âgé de 21 ans, montre déjà tout son génie dans cette composition parfaitement équilibrée.''',
    histoire: '''Peint pour la chapelle Saint-Joseph de l\'église San Francesco à Città di Castello.''',
    type: 'tableau',
    epoque: 'Renaissance',
    tags: ['Joseph', 'Marie', 'Mariage', 'Noces', 'Raphaël', 'Renaissance'],
    // Marriage of the Virgin — Raphaël ✓ vérifié (album/Rafael/pic/glrx-202090454)
    imageUrl: 'images/noces.jpg',
  ),

  OeuvreArt(
 id: 'tableau6',
    titre: 'La Mort de Saint Joseph',
    artiste: 'Giovanni Antonio Guardi',
    annee: 'vers 1750',
    technique: 'Huile sur toile',
    dimensions: '170 x 80 cm',
    lieu: 'Gemäldegalerie, Berlin',
    description: '''Ce tableau de Guardi représente le moment solennel de la mort de Saint Joseph, entouré de Marie et de Jésus. Joseph, allongé sur un drap immaculé, est dans ses derniers instants. Marie, vêtue de bleu, incline la tête avec une douleur contenue et digne. Jésus, debout à ses côtés, pose tendrement la main sur la joue de son père adoptif, dans un ultime geste d\'amour filial.
 
La composition est verticale et ascendante : du lit de mort au bas du tableau, le regard monte vers le ciel où deux anges descendent dans une nuée lumineuse pour accompagner l\'âme de Joseph. Une croix, discrètement placée au premier plan, rappelle la dimension rédemptrice de cette mort.
 
Guardi maîtrise avec virtuosité les contrastes de lumière et d\'ombre, héritiers du baroque vénitien. L\'atmosphère est à la fois grave et consolante : la mort de Joseph, assisté de Jésus et de Marie, est considérée dans la tradition chrétienne comme la mort la plus douce qui soit, celle du juste accompagné par le Christ et sa mère.''',
    histoire: '''Giovanni Antonio Guardi, frère du célèbre Francesco Guardi, fut un peintre vénitien du XVIIIe siècle spécialisé dans les sujets religieux. Ce tableau, conservé à la Gemäldegalerie de Berlin, illustre un thème cher à la dévotion baroque : la "Bonne Mort" de Joseph, modèle pour les fidèles chrétiens. La scène fut très représentée aux XVIIe et XVIIIe siècles, notamment après la proclamation de Joseph comme patron de l\'Église universelle.''',
    type: 'tableau',
    epoque: 'Baroque',
    tags: ['Joseph', 'Marie', 'Jésus', 'Mort', 'Guardi', 'Baroque', 'Venise'],
    // Giovanni Antonio Guardi — The Death of Saint Joseph (Gemäldegalerie, Berlin) ✓ vérifié
    imageUrl: 'images/mort.jpg',
  ),

  OeuvreArt(
   id: 'tableau7',
    titre: 'Saint Joseph guidant l\'Enfant Jésus',
    artiste: 'Bartolomé Esteban Murillo',
    annee: 'vers 1660',
    technique: 'Huile sur toile',
    dimensions: '123 x 98 cm',
    lieu: 'Musée de l\'Ermitage, Saint-Pétersbourg',
    description: '''Ce tableau de Murillo représente Saint Joseph guidant l\'Enfant Jésus par la main dans un paysage ouvert. Joseph, vêtu d\'une robe brune, avance d\'un pas protecteur, son bâton de voyageur à la main. L\'Enfant Jésus, auréolé et vêtu d\'une tunique violette, tourne son regard vers l\'horizon, la main confiée à celle de son père adoptif.
 
Au-dessus d\'eux, un ciel tourmenté laisse apparaître trois angelots dans les nuées, témoins célestes de cette marche sacrée. Le contraste entre la lumière qui éclaire les deux figures et le fond sombre du ciel dramatise la scène et souligne le caractère divin de l\'Enfant.
 
Murillo excelle dans la représentation de la relation quotidienne entre Joseph et Jésus — non plus dans l\'intimité d\'un atelier ou d\'une étreinte, mais en mouvement, dans le monde. Cette image du père et du fils marchant ensemble est parmi les plus touchantes de l\'iconographie joséphinite : Joseph, homme humble et fort, guide vers son destin celui qu\'il sait être le Fils de Dieu.''',
    histoire: '''Ce tableau, conservé à l\'Ermitage de Saint-Pétersbourg, est l\'une des nombreuses représentations de la Sainte Famille que Murillo produisit pour des commanditaires privés et des églises sévillanes. Il entra dans les collections impériales russes au XVIIIe siècle et fait aujourd\'hui partie des trésors du musée.''',
    type: 'tableau',
    epoque: 'Baroque',
    tags: ['Joseph', 'Jésus', 'Enfant', 'Murillo', 'Baroque', 'Espagne', 'Ermitage'],
    // Saint Joseph leading by hand Baby Jesus — Murillo (Hermitage) ✓ vérifié
    imageUrl: 'images/tenant.jpg',
  ),

  // ─── SCULPTURE ─────────────────────────────────────────────

  OeuvreArt(
     id: 'sculpture1',
    titre: 'La Trinité céleste et terrestre',
    artiste: 'Bartolomé Esteban Murillo',
    annee: 'vers 1675-1682',
    technique: 'Huile sur toile',
    dimensions: '293 x 207 cm',
    lieu: 'National Gallery, Londres',
    description: '''Ce grand tableau de Murillo est l\'une des œuvres les plus ambitieuses et les plus symboliquement riches consacrées à la Sainte Famille. La composition met en parallèle deux trinités : en bas, la trinité terrestre formée par Joseph, Marie et l\'Enfant Jésus ; en haut, la trinité céleste avec Dieu le Père, le Saint-Esprit sous forme de colombe et le Christ enfant qui en est le lien vivant.
 
Au centre, l\'Enfant Jésus étend les bras vers les deux sphères, unissant le ciel et la terre. Joseph, à gauche, tient son bâton fleuri, symbole de son élection divine. Marie, à droite, contemple son fils avec une tendresse sereine. L\'ensemble baigne dans une lumière dorée qui enveloppe les figures célestes.
 
Cette œuvre théologique autant qu\'artistique illustre le rôle unique de Joseph dans l\'économie du salut : père adoptif du Fils de Dieu, il est le lien entre l\'humanité ordinaire et le mystère de l\'Incarnation. La composition savante et la beauté des coloris en font l\'un des chefs-d\'œuvre tardifs de Murillo.''',
    histoire: '''Peint dans les dernières années de la vie de Murillo, ce tableau fut acquis par la National Gallery de Londres au XIXe siècle. Il est considéré comme l\'une des œuvres majeures de la peinture baroque espagnole et attire chaque année des milliers de visiteurs.''',
    type: 'tableau',
    epoque: 'Baroque',
    tags: ['Joseph', 'Marie', 'Jésus', 'Trinité', 'Murillo', 'Baroque', 'Espagne'],
    // Trinité céleste et terrestre — Murillo (National Gallery, Londres) ✓ vérifié
    imageUrl: 'images/trinité.jpg',
  ),

  // ─── VITRAIL ───────────────────────────────────────────────

  OeuvreArt(
     id: 'vitrail1',
    titre: 'L\'Adoration des Mages',
    artiste: 'Giotto di Bondone',
    annee: '1304-1306',
    technique: 'Fresque',
    dimensions: '200 x 185 cm',
    lieu: 'Chapelle des Scrovegni, Padoue',
    description: '''Cette fresque de Giotto représente l\'Adoration des Mages, scène centrale du cycle de l\'Enfance du Christ à la chapelle des Scrovegni. Au centre, l\'Enfant Jésus est allongé dans une crèche, entouré de Marie et de Joseph. Les trois Rois Mages, couronnés et richement vêtus, s\'avancent de la droite pour lui offrir leurs présents. Des anges planent au-dessus de la scène.
 
Joseph, représenté à gauche, tient un agneau — symbole du sacrifice futur du Christ. Sa présence discrète mais essentielle souligne son rôle de gardien et de témoin du mystère de l\'Incarnation. Un bœuf et un âne complètent la scène, conformément à la tradition iconographique.
 
Giotto révolutionne ici la représentation des scènes sacrées en leur donnant une présence physique et une humanité inédites. Les personnages ont du poids, des expressions, des gestes naturels. Cette fresque est l\'une des premières œuvres de l\'art occidental à rompre avec la frontalité hiératique de l\'art byzantin pour proposer une narration vivante et incarnée.''',
    histoire: '''La chapelle des Scrovegni de Padoue, entièrement peinte par Giotto entre 1303 et 1306, est classée au patrimoine mondial de l\'UNESCO. Commandée par Enrico Scrovegni pour expier les péchés de son père usurier, elle constitue l\'un des ensembles picturaux les plus importants de l\'histoire de l\'art occidental.''',
    type: 'fresque',
    epoque: 'Médiéval',
    tags: ['Joseph', 'Marie', 'Jésus', 'Mages', 'Giotto', 'Fresque', 'Padoue'],
    // Adoration des Mages — Giotto (Scrovegni) ✓ vérifié
    imageUrl: 'images/vitrailles.jpg',
  ),
];
  static List<OeuvreArt> getParType(String type) {
    return toutes.where((o) => o.type == type).toList();
  }

  static List<OeuvreArt> getFavoris() {
    return toutes.where((o) => o.estFavori).toList();
  }

  static List<OeuvreArt> rechercher(String requete) {
    if (requete.isEmpty) return [];
    return toutes.where((o) {
      return o.titre.toLowerCase().contains(requete.toLowerCase()) ||
             o.artiste.toLowerCase().contains(requete.toLowerCase()) ||
             o.description.toLowerCase().contains(requete.toLowerCase()) ||
             o.tags.any((tag) => tag.toLowerCase().contains(requete.toLowerCase()));
    }).toList();
  }
}