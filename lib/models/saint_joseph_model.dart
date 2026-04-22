// lib/models/saint_joseph_model.dart
class SaintDevotion {
  final String id;
  final String nom;
  final String epoque;
  final String pays;
  final String description;
  final List<String> citations;
  final List<String> vertus;
  final String imageUrl;
  final String fete;

  SaintDevotion({
    required this.id,
    required this.nom,
    required this.epoque,
    required this.pays,
    required this.description,
    required this.citations,
    required this.vertus,
    required this.imageUrl,
    required this.fete,
  });
}

class SaintsJosephData {
  static List<SaintDevotion> tousLesSaints = [
    SaintDevotion(
      id: 'jean_chrysostome',
      nom: 'Saint Jean Chrysostome',
      epoque: '349-407',
      pays: 'Antioche',
      description: '''Saint Jean Chrysostome, l'un des plus grands Pères de l'Église, a magnifiquement parlé de Saint Joseph dans ses homélies. Il s'émerveille de voir comment Dieu a choisi un simple charpentier pour être le père nourricier de son Fils.

Pour Chrysostome, Joseph est "le coryphée de tous les patriarches". Il voit en lui un homme dont la foi dépasse même celle d'Abraham. Sa prédication sur Joseph a contribué à répandre sa dévotion dans l'Église d'Orient.''',
      citations: [
        'Il considéra la foi inébranlable d\'Abraham, la pureté d\'âme d\'Isaac, la patience infatigable de Jacob, la sainteté et la douceur de David, mais il ne trouva que Joseph seul qui attira ses regards et qui lui parut digne d\'une qualité aussi éminente.',
        'Gloire à toi, Joseph, charpentier de Nazareth, qui as sauvé le Sauveur !'
      ],
      vertus: ['Foi', 'Humilité', 'Obéissance', 'Patience'],
      // Icône des Trois Saints Hiérarques (Basile, Chrysostome, Grégoire) — cdn.gallerix.asia
      imageUrl: 'images/chrysostome.jpg',
      fete: '13 septembre',
    ),
    SaintDevotion(
      id: 'francois_sales',
      nom: 'Saint François de Sales',
      epoque: '1567-1622',
      pays: 'France',
      description: '''Saint François de Sales, évêque de Genève et docteur de l'Église, voyait en Saint Joseph le modèle de la vie intérieure. Il disait que Joseph est "le miroir de la perfection chrétienne" et "le roi des arbres".

Pour François de Sales, Joseph est l'exemple de l'humilité et du service discret. Il méditait souvent sur la vie cachée de Joseph à Nazareth, y trouvant l'inspiration pour sa propre vie spirituelle. Il encourageait ses fidèles à avoir recours à Saint Joseph dans toutes leurs nécessités.''',
      citations: [
        'Oh ! Quel saint est le glorieux saint Joseph ! Il n\'est pas seulement patriarche, mais le coryphée de tous les patriarches ; il n\'est pas seulement le confesseur, mais plus que confesseur : car dans sa confession sont encloses les dignités des évêques, la générosité des martyrs et de tous les autres saints. C\'est donc à juste raison qu\'il est comparé au palmier, le roi des arbres.',
        'Dieu veut que Joseph soit toujours pauvre, ce qui est une des plus rudes épreuves qu\'il puisse nous envoyer, et il s\'y soumet non pas pour un temps, car ce fut toute sa vie ; mais de quelle pauvreté ! D\'une pauvreté méprisée, rejetée et nécessiteuse.',
        'Oh combien est admirable cette parfaite obéissance de Joseph ! Voyez comme il a été dans toutes occasions toujours parfaitement soumis à la divine volonté.',
        'Un Saint qui avait tant aimé en sa vie ne pouvait mourir que d\'amour, car son âme ne pouvant à souhait aimer son cher Jésus entre les distractions de cette terre, et ayant achevé le service qui était requis au bas âge de celui-ci, que restait-il, sinon qu\'il dît au Père Éternel: Ô Père, j\'ai accompli l\'œuvre que vous m\'aviez donnée en charge.'
      ],
      vertus: ['Humilité', 'Patience', 'Obéissance', 'Pauvreté', 'Amour'],
      // Saint Joseph et l'Enfant Jésus — El Greco — cdn.gallerix.asia
      imageUrl: 'images/desalle.jpg',
      fete: '24 janvier',
    ),
    SaintDevotion(
      id: 'claude_colombiere',
      nom: 'Saint Claude de La Colombière',
      epoque: '1641-1682',
      pays: 'France',
      description: '''Saint Claude de La Colombière, jésuite et confesseur de Sainte Marguerite-Marie Alacoque, avait une profonde dévotion à Saint Joseph. Il voyait en lui le modèle de la vie cachée et de l'amour discret.

Il encourageait la dévotion à Joseph comme un moyen sûr d'approcher de Marie et de Jésus. Pour lui, honorer Joseph c'est honorer Marie et participer à la gloire de la Sainte Famille.''',
      citations: [
        'N\'y eût-il pas de raison de publier les louanges de saint Joseph, on le devrait faire par le seul désir de plaire à Marie. On ne peut douter qu\'elle ne prenne beaucoup de part aux honneurs qu\'on rend à ce saint et qu\'elle-même ne sente qu\'ils rejaillissent sur elle.'
      ],
      vertus: ['Discrétion', 'Amour de Marie', 'Foi', 'Humilité'],
      // Miracle de Saint Ignace de Loyola (jésuite) — Rubens — cdn.gallerix.asia
      imageUrl: 'images/claude.jpg',
      fete: '15 février',
    ),
    SaintDevotion(
      id: 'leonard_port_maurice',
      nom: 'Saint Léonard de Port-Maurice',
      epoque: '1676-1751',
      pays: 'Italie',
      description: '''Saint Léonard de Port-Maurice, prédicateur franciscain, est connu pour son zèle missionnaire et sa dévotion à Saint Joseph. Il voyait en Joseph le modèle par excellence de la paternité et de la protection.

Il aimait méditer sur la mort de Joseph, l'appelant "le saint de la bonne mort". Pour lui, Joseph est un intercesseur puissant pour tous ceux qui s'approchent du passage éternel.''',
      citations: [
        'La plus belle prérogative de Joseph, comme époux de Marie, c\'est qu\'à ce titre, il est considéré et honoré comme le chef de cette sainte Famille.',
        'Ah ! Joseph ! si vous ne lâchez pas la main de celui qui est la vie, vous ne pouvez mourir. Oh! qu\'il est doux de mourir en tenant la main de Jésus !... Jésus lève la main, il bénit et embrasse son bien-aimé père, et Joseph expire au milieu des baisers et des embrassements de Jésus...'
      ],
      vertus: ['Paternité', 'Protection', 'Confiance', 'Espérance'],
      // Dernière communion de Saint François (franciscain) — Rubens — cdn.gallerix.asia
      imageUrl: 'images/maurice.jpg',
      fete: '26 novembre',
    ),
    SaintDevotion(
      id: 'bernard',
      nom: 'Saint Bernard de Clairvaux',
      epoque: '1090-1153',
      pays: 'France',
      description: '''Saint Bernard, grand docteur de l'Église, avait une confiance illimitée en Saint Joseph. Il voyait en lui l'intercesseur privilégié auprès du Christ.

Bernard de Clairvaux méditait profondément sur la place de Joseph dans le mystère de l'Incarnation. Pour lui, Joseph était le gardien du mystère de Dieu, celui qui a été choisi pour protéger le Fils de Dieu.''',
      citations: [
        'Considérant que la ressemblance est l\'âme des unions bien assorties, on conclut qu\'il était nécessaire que saint Joseph fût comme Marie, sa fidèle épouse, très pur en chasteté, très profond en humilité, très élevé en contemplation, très ardent en charité.',
        'C\'est ainsi qu\'à l\'exemple de Joseph, celui qui est parfaitement obéissant accomplit fidèlement la volonté de son supérieur, aussitôt qu\'il la connaît, sans attendre au lendemain…'
      ],
      vertus: ['Contemplation', 'Chasteté', 'Humilité', 'Obéissance'],
      // San Marco altarpiece – St Bernard — Fra Angelico — cdn.gallerix.asia
      imageUrl: 'images/clairevaux.jpg',
      fete: '20 août',
    ),
    SaintDevotion(
      id: 'jean_damascene',
      nom: 'Saint Jean Damascène',
      epoque: '676-749',
      pays: 'Syrie',
      description: '''Saint Jean Damascène, docteur de l'Église, est l'un des grands défenseurs des saintes images. Il a magnifiquement parlé de Saint Joseph dans ses écrits, le présentant comme le chef de la Sainte Famille.

Pour lui, Joseph a reçu de Dieu l'autorité paternelle sur Jésus. Cette autorité n'est pas une domination, mais un service d'amour. Il voit en Joseph le modèle de toute autorité chrétienne.''',
      citations: [
        '''Le Seigneur donna à Joseph l'amour, la vigilance et l'autorité de père envers Jésus. Il lui donna l'affection d'un père, afin qu'il le gardât avec amour ; la sollicitude de père, afin qu'il l'assistât dans tous ses besoins ; l'autorité de père, afin qu'il fût obéi en tout ce qu'il commanderait à Jésus-Christ. En cette qualité, Joseph est reconnu comme le chef de la Sainte Famille.'''
      ],
      vertus: ['Paternité', 'Autorité', 'Vigilance', 'Sollicitude'],
      // Icône des Trois Saints Hiérarques (contient Basile le Grand) — cdn.gallerix.asia
      imageUrl: 'images/damascene.jpg',
      fete: '4 décembre',
    ),
    SaintDevotion(
      id: 'basile',
      nom: 'Saint Basile le Grand',
      epoque: '329-379',
      pays: 'Cappadoce',
      description: '''Saint Basile le Grand, Père de l'Église et docteur, voyait en Saint Joseph un modèle de paternité unique. Il s'émerveille que Joseph ait été choisi pour partager avec Dieu le titre de père de Jésus-Christ.

Pour Basile, cette paternité est une grâce inouïe qui élève Joseph au-dessus de tous les saints. Il encourageait les fidèles à honorer Joseph comme le père adoptif du Sauveur.''',
      citations: [
        'Saint Joseph seul a la gloire de partager avec Dieu le titre de père de Jésus-Christ.'
      ],
      vertus: ['Paternité', 'Foi', 'Confiance', 'Humilité'],
      // Icône des Trois Saints Hiérarques — cdn.gallerix.asia
      imageUrl: 'images/basile.jpg',
      fete: '2 janvier',
    ),
    SaintDevotion(
      id: 'olier',
      nom: 'Jean-Jacques Olier',
      epoque: '1608-1657',
      pays: 'France',
      description: '''Jean-Jacques Olier, fondateur des Prêtres de Saint-Sulpice, avait une dévotion profonde à Saint Joseph. Il voyait en lui l'image de la paternité de Dieu et le modèle de la vie sacerdotale.

Pour Olier, Joseph est le "Père des miséricordes" parce qu'il a reçu du Père éternel un esprit de compassion pour les hommes. Il est le guide et le modèle des prêtres qui ont charge des âmes.''',
      citations: [
        'Le Père éternel, ayant choisi saint Joseph pour en faire l\'image de sa paternité, a pris en lui un esprit de compassion et de tendresse pour les misères des hommes, et s\'est fait en lui le Père des miséricordes.',
        'Dieu le Père qui nous aime du même amour dont il aime ce Fils unique, nous donne à puiser, à goûter, à savourer dans saint Joseph la grâce et l\'amour dont il aime ce même Fils.',
        'Ce grand saint conduisait et dirigeait l\'Enfant Jésus dans l\'esprit de son Père, sa douceur, sa sagesse, sa prudence : ainsi en devons-nous faire [nous les prêtres] de tous les membres de Jésus-Christ qui nous sont confiés et qui sont d\'autres Christ, en sorte que nous devons les traiter avec la même révérence que saint Joseph traitait l\'Enfant Jésus.',
        'C\'est un saint caché que Dieu a voulu tenir secret pendant sa vie, et dont il s\'est réservé à lui seul les occupations intérieures sans les partager aux soins extérieurs de l\'Église, un saint que Dieu a manifesté au fond des cœurs, et dont il a lui-même imprimé la vénération dans l\'intérieur des âmes.'
      ],
      vertus: ['Paternité spirituelle', 'Miséricorde', 'Compassion', 'Humilité'],
      // Sainte Famille sous le pommier — Rubens — cdn.gallerix.asia
      imageUrl: 'images/olier.jpg',
      fete: '2 avril',
    ),
    SaintDevotion(
      id: 'francois_sales_2',
      nom: 'Saint François de Sales (suite)',
      epoque: '1567-1622',
      pays: 'France',
      description: '''Le docteur de la douceur a laissé de nombreuses méditations sur Saint Joseph, particulièrement sur sa vie cachée à Nazareth et sur sa mort.

François de Sales voyait en Joseph un maître de la vie intérieure et un modèle de confiance en Dieu. Il aimait particulièrement méditer sur la pauvreté de Joseph, y voyant une leçon pour tous les chrétiens.''',
      citations: [
        '''O grand saint Joseph, époux très-aimé de la Mère du Bien-Aimé, combien de fois avez-vous porté l'Amour du ciel et de la terre entre vos bras, tandis qu'embrasé des doux embrassements et des baisers de ce divin Enfant, votre âme fondait d'aise, lorsqu'il prononçait si tendrement à vos oreilles (O Dieu, quelle suavité !) que vous étiez son grand ami et son père bien-aimé ?''',
        'Chacun tenait ce grand saint pour un pauvre charpentier qui ne pouvait pas tant faire qu\'il lui manquât plusieurs choses nécessaires, quoiqu\'il se fatiguât avec une affection non pareille pour l\'entretien de toute sa petite famille, après quoi il se soumettait très humblement à la volonté de Dieu en la continuation de sa pauvreté et de son abjection, sans se laisser aucunement vaincre par l\'ennui intérieur qui lui faisait sans doute maintes attaques.'
      ],
      vertus: ['Pauvreté', 'Humilité', 'Confiance', 'Abandon'],
      // Saint Joseph et l'Enfant Jésus — El Greco — cdn.gallerix.asia
      imageUrl: 'images/desalle.jpg',
      fete: '24 janvier',
    ),
    SaintDevotion(
      id: 'jean_paul2',
      nom: 'Saint Jean-Paul II',
      epoque: '1920-2005',
      pays: 'Pologne',
      description: '''Saint Jean-Paul II, pape de 1978 à 2005, a consacré une grande partie de son pontificat à promouvoir la dévotion à Saint Joseph. Il a écrit l'exhortation apostolique "Redemptoris Custos" (Gardien du Rédempteur).

Le pape polonais voyait en Joseph le modèle du père, du travailleur et du juste. Il lui confiait ses soucis quotidiens et l'Église tout entière.''',
      citations: [
        'Saint Joseph, à votre lumière, puissions-nous apprécier tout ce qui est humble, simple, caché, et ce qui se fait sans bruit et sans que cela se voie, mais avec des résultats décisifs dans les profondeurs insondables du cœur.'
      ],
      vertus: ['Humilité', 'Silence', 'Service', 'Confiance'],
      // Saint Grégoire le Grand — Rubens — cdn.gallerix.asia
      imageUrl: 'images/jeanpaul.jpg',
      fete: '22 octobre',
    ),
    SaintDevotion(
      id: 'therese_enfant_jesus',
      nom: 'Sainte Thérèse de l\'Enfant-Jésus',
      epoque: '1873-1897',
      pays: 'France',
      description: '''Sainte Thérèse de l\'Enfant-Jésus, docteur de l'Église, avait une dévotion particulière à Saint Joseph dès son enfance. Elle raconte dans "Histoire d'une âme" comment elle fut guérie miraculeusement par son intercession.

Pour Thérèse, Joseph est le père des âmes intérieures, celui qui protège dans les difficultés et obtient les grâces nécessaires pour avancer sur le chemin de la sainteté.''',
      citations: [
        '''Joseph, votre admirable vie, s'est passée dans la pauvreté ; Mais, de Jésus et de Marie, vous contemplez la beauté.'''
      ],
      vertus: ['Confiance', 'Pauvreté', 'Abandon', 'Foi enfantine'],
      // Adoration des bergers — Rubens — cdn.gallerix.asia
      imageUrl: 'images/lisieux.jpg',
      fete: '1er octobre',
    ),
    SaintDevotion(
      id: 'therese_avila',
      nom: 'Sainte Thérèse d\'Avila',
      epoque: '1515-1582',
      pays: 'Espagne',
      description: '''Sainte Thérèse d'Avila, docteur de l'Église et réformatrice du Carmel, avait une profonde dévotion à Saint Joseph. Elle attribuait à son intercession la guérison de nombreuses maladies et la fondation de ses monastères.

Pour elle, Joseph est le maître de la vie intérieure, celui qui guide les âmes dans l'oraison et qui obtient de Dieu toutes les grâces.''',
      citations: [
        '''Le glorieux saint Joseph, je le sais par expérience, étend son pouvoir à tous nos besoins. Notre Seigneur veut nous faire comprendre que, s'il a été soumis sur la terre à celui qu'il appelait son père, parce que c'était son gouverneur qui pouvait lui commander, il défère également au ciel, à toutes ses suppliques. Et c'est ce qu'ont vu comme moi par expérience, d'autres personnes auxquelles j'avais conseillé de se recommander à cet incomparable protecteur. A l'heure actuelle, elles sont nombreuses les âmes qui l'honorent et constatent de nouveau la vérité de ce que j'avance. Il m'a toujours exaucée au-delà de mes prières et de mes espérances...''',
        '''Les âmes d'oraison, en particulier, lui doivent un culte tout filial. Je ne sais d'ailleurs comment on pourrait penser à la Reine des Anges et à toutes les souffrances qu'elle a endurées en compagnie de l'Enfant Jésus, sans remercier saint Joseph de les avoir si bien aidés alors, l'un et l'autre. Que celui qui n'a pas de maître pour lui enseigner l'oraison prenne ce glorieux saint pour guide, et il ne risquera pas de s'égarer....'''
      ],
      vertus: ['Oraison', 'Intercession', 'Confiance', 'Foi'],
      // Sainte Thérèse d'Avila intercède devant le Christ — Rubens — cdn.gallerix.asia
      imageUrl: 'images/avila.jpg',
      fete: '15 octobre',
    ),
    SaintDevotion(
      id: 'jose_maria_escriva',
      nom: 'Saint Josémaria Escriva',
      epoque: '1902-1975',
      pays: 'Espagne',
      description: '''Saint Josémaria Escriva, fondateur de l'Opus Dei, avait une dévotion profonde à Saint Joseph, qu'il appelait "notre père et seigneur". Pour lui, Joseph est le modèle de la sainteté dans la vie ordinaire.

Il aimait méditer sur Joseph comme père adoptif de Jésus, voyant en lui un modèle pour tous ceux qui sont appelés à une paternité spirituelle. Il enseignait que Joseph sanctifiait son travail à Nazareth, montrant ainsi que toute occupation humaine peut être une voie de sainteté.''',
      citations: [
        'Saint Joseph est vraiment père et seigneur. Il protège et accompagne dans leur chemin sur terre ceux qui le vénèrent, comme il a protégé et accompagné Jésus enfant et adolescent. En le connaissant mieux, on découvre que le saint patriarche est aussi maître de la vie intérieure, car il nous apprend à connaître Jésus, à vivre avec Lui, et nous fait découvrir que nous appartenons à la famille de Dieu. Tout cela, saint Joseph nous l\'apprend en étant un homme ordinaire comme il le fut, un père de famille, un travailleur qui gagnait sa vie à la sueur de son front.',
        'La forte personnalité humaine de Joseph se détache des récits évangéliques : il n\'apparaît jamais comme un homme timide ou craintif devant la vie ; il sait au contraire faire face aux problèmes, sortir des situations difficiles et assumer avec responsabilité et initiative les taches qui lui sont confiées.',
        'Vivre de la foi ! Saint Joseph a accompli pleinement ces mots, qui furent si souvent par la suite thème de méditation pour l\'apôtre Paul. Il accomplit la volonté de Dieu sans routine ni formalisme, avec spontanéité et profondeur.'
      ],
      vertus: ['Paternité', 'Travail', 'Foi', 'Courage', 'Simplicité'],
      // Retour de la Sainte Famille d'Égypte — Rubens — cdn.gallerix.asia
      imageUrl: 'images/maria.jpg',
      fete: '26 juin',
    ),
    SaintDevotion(
      id: 'jean_paul2_2',
      nom: 'Saint Jean-Paul II (suite)',
      epoque: '1920-2005',
      pays: 'Pologne',
      description: '''Le pape polonais a consacré son enseignement à Saint Joseph dans l'exhortation apostolique "Redemptoris Custos". Il y développe la figure de Joseph comme gardien du Rédempteur et modèle de vie chrétienne.

Pour Jean-Paul II, Joseph est l'homme juste qui accueille le mystère de Dieu et s'y abandonne avec foi. Il est le modèle de toute vocation chrétienne.''',
      citations: [
        'Joseph était le gardien, le gérant et le défenseur légitime et naturel de la maison divine dont il était le chef... Or, la divine maison que Joseph gouverna comme avec l\'autorité du père contenait les prémices de l\'Église naissante... Telles sont les raisons pour lesquelles ce bienheureux Patriarche regarde comme lui étant particulièrement confiée la multitude des chrétiens qui compose l\'Église.',
        'Du haut du ciel assistez-nous dans le combat que nous livrons à la puissance des ténèbres ; et, de même que vous avez arraché autrefois l\'Enfant Jésus au péril de la mort, défendez aujourd\'hui la sainte Église de Dieu des embûches de l\'ennemi et de toute adversité. Couvrez chacun de nous tous de votre perpétuelle protection, afin que, soutenus par votre secours, nous puissions vivre saintement, pieusement mourir et obtenir la béatitude éternelle du Ciel.'
      ],
      vertus: ['Foi', 'Paternité', 'Protection', 'Confiance'],
      // Saint Grégoire le Grand — Rubens — cdn.gallerix.asia
      imageUrl: 'images/jeanpaul.jpg',
      fete: '22 octobre',
    ),
    SaintDevotion(
      id: 'pierre_julien_eymard',
      nom: 'Saint Pierre Julien Eymard',
      epoque: '1811-1868',
      pays: 'France',
      description: '''Saint Pierre Julien Eymard, fondateur des Pères du Saint-Sacrement, avait une dévotion profonde à Saint Joseph. Il voyait en lui le modèle de l'adoration eucharistique.

Pour lui, Joseph est le premier et le plus parfait adorateur de Jésus après Marie. Sa vie à Nazareth était une vie d'adoration continuelle.''',
      citations: [
        'Saint Joseph, après la Très Sainte Vierge, a été le premier et le plus parfait adorateur de Notre-Seigneur. Il l\'adorait avec une vertu de foi plus grande que celle de tous les saints ; Il l\'adorait avec une humilité plus profonde que celle de tous les élus ; Il l\'adorait avec une pureté plus pure que celle des anges ; Il l\'adorait avec un amour qu\'aucune autre créature, angélique ou humaine, n\'eut et ne put avoir pour Jésus ; Il l\'adorait avec un dévouement aussi grand que son amour.'
      ],
      vertus: ['Adoration', 'Foi', 'Humilité', 'Pureté'],
      // Adoration des Mages — Rubens — cdn.gallerix.asia
      imageUrl: 'images/eymard.jpg',
      fete: '2 août',
    ),
    SaintDevotion(
      id: 'andre_bessette',
      nom: 'Saint frère André Bessette',
      epoque: '1845-1937',
      pays: 'Canada',
      description: '''Saint frère André Bessette, le "saint de Montréal", a consacré sa vie à diffuser la dévotion à Saint Joseph. Il a construit l'Oratoire Saint-Joseph du Mont-Royal, le plus grand sanctuaire dédié à Joseph au monde.

Pour lui, Joseph est le grand thaumaturge, celui qui obtient des guérisons et des grâces pour tous ceux qui l'invoquent avec foi. Sa devise était : "Priez Saint Joseph. Il ne vous laissera jamais en chemin."''',
      citations: [
        'Priez Saint Joseph. Il ne vous laissera jamais en chemin.',
        'Allez prier devant la statue de Saint Joseph; dites-lui : Saint Joseph, priez pour moi, comme vous auriez prié si vous étiez vous-même sur la terre à ma place...'
      ],
      vertus: ['Foi', 'Confiance', 'Humilité', 'Persévérance'],
      // Apparition du Saint-Esprit à Thérèse d'Avila — Rubens — cdn.gallerix.asia
      imageUrl: 'images/andre.jpg',
      fete: '6 janvier',
    ),
  ];

  static List<SaintDevotion> getSaintsAleatoires(int count) {
    final shuffled = List.of(tousLesSaints);
    shuffled.shuffle();
    return shuffled.take(count).toList();
  }
}