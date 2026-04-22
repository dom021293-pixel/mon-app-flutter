// lib/models/douleurs_joies_model.dart
class DouleurJoie {
  final String type; // "douleur" ou "joie"
  final int numero;
  final String titre;
  final String description;
  final String meditation;
  final String priere;
  final String verset;
  final String imageUrl;

  DouleurJoie({
    required this.type,
    required this.numero,
    required this.titre,
    required this.description,
    required this.meditation,
    required this.priere,
    required this.verset,
    required this.imageUrl,
  });
}

class DouleursJoiesData {
  static List<DouleurJoie> toutes = [
    // LES 7 DOULEURS
    DouleurJoie(
      type: 'douleur',
      numero: 1,
      titre: 'Le doute de Joseph',
      description: 'Joseph doute de la grossesse de Marie',
      verset: 'Matthieu 1, 18-19',
      meditation: '''Joseph, cet homme juste, est confronté au doute le plus déchirant. Marie, sa fiancée, est enceinte. Il ne comprend pas. Il ne sait pas que le Saint-Esprit est à l'œuvre. Son cœur est déchiré entre l'amour qu'il porte à Marie et ce que la loi semble exiger.

Cette douleur est celle de l'incompréhension devant les mystères de Dieu. Joseph aurait pu se révolter, accuser, condamner. Au lieu de cela, il choisit la délicatesse : il décide de la répudier secrètement pour ne pas la livrer à la honte publique.

Dans nos vies, nous aussi nous traversons des nuits de doute. Nous ne comprenons pas ce que Dieu fait, où il nous mène. Comme Joseph, nous sommes appelés à rester justes, c'est-à-dire à garder confiance même dans l'obscurité.''',
      priere: '''Saint Joseph, dans votre première douleur,
vous avez connu le doute et l'angoisse.
Obtenez-moi la grâce de rester juste
quand je ne comprends pas les voies de Dieu.
Aidez-moi à ne pas juger, à ne pas condamner,
mais à attendre dans la confiance
que Dieu manifeste sa lumière.
Saint Joseph, priez pour moi dans mes moments de doute.
Amen.''',
      imageUrl: 'assets/images/douleur1.jpg',
    ),
    DouleurJoie(
      type: 'douleur',
      numero: 2,
      titre: 'La pauvreté de la naissance de Jésus',
      description: 'Joseph ne trouve pas de lieu pour la naissance de Jésus',
      verset: 'Luc 2, 6-7',
      meditation: '''Quelle douleur pour un père de ne pouvoir offrir un lieu digne pour la naissance de son enfant ! Joseph cherche, frappe aux portes, mais toutes sont fermées. Le Fils de Dieu doit naître dans une étable, parmi les animaux.

Joseph aurait pu se sentir humilié, inutile. Il avait tant rêvé pour cet enfant ! Mais il accepte cette pauvreté avec humilité. Il fait de cette étable une cathédrale d'amour.

Cette douleur nous apprend que Dieu ne se trouve pas toujours dans ce qui est grand et confortable. Il se cache parfois dans la pauvreté, la simplicité, l'humilité. Comme Joseph, nous sommes appelés à l'accueillir là où il est.''',
      priere: '''Saint Joseph, dans votre deuxième douleur,
vous n'avez pu offrir à Jésus qu'une étable.
Apprenez-moi à accepter la pauvreté et le dépouillement.
Aidez-moi à reconnaître la présence de Dieu
dans les situations les plus humbles.
Que je ne cherche pas les grandeurs du monde,
mais la simplicité du cœur.
Saint Joseph, priez pour moi.
Amen.''',
      imageUrl: 'assets/images/douleur2.jpg',
    ),
    DouleurJoie(
      type: 'douleur',
      numero: 3,
      titre: 'La circoncision',
      description: 'Joseph voit le sang de Jésus pour la première fois',
      verset: 'Luc 2, 21',
      meditation: '''La circoncision est le premier sang versé par Jésus. Joseph tient l'enfant, il voit la douleur sur son visage, il entend ses cris. Son cœur de père est transpercé.

Il comprend que cet enfant n'est pas comme les autres. Il est venu pour souffrir, pour donner sa vie. Joseph pressent déjà le drame du Calvaire. Quelle douleur pour un père de savoir que son enfant est né pour mourir !

Cette douleur nous rappelle que l'amour vrai accepte la souffrance. Joseph aime Jésus non pas malgré sa destinée, mais à cause d'elle. Il accepte d'avance tout ce qui arrivera.''',
      priere: '''Saint Joseph, dans votre troisième douleur,
vous avez vu le sang de Jésus pour la première fois.
Obtenez-moi la force d'accepter les souffrances de la vie.
Aidez-moi à aimer sans retenue,
même quand l'amour fait mal.
Que je n'aie pas peur de la croix,
car elle est le chemin de la résurrection.
Saint Joseph, priez pour moi.
Amen.''',
      imageUrl: 'assets/images/douleur3.jpg',
    ),
    DouleurJoie(
      type: 'douleur',
      numero: 4,
      titre: 'La prophétie de Siméon',
      description: 'Siméon annonce que Jésus sera un signe de contradiction',
      verset: 'Luc 2, 34-35',
      meditation: '''Quarante jours après la naissance, Joseph et Marie présentent Jésus au Temple. Un vieillard, Siméon, prend l'enfant dans ses bras et prophétise : "Cet enfant amènera la chute et le relèvement de beaucoup... et toi-même, une épée te transpercera l'âme."

Joseph entend ces paroles. Il comprend que Marie souffrira, que Jésus sera rejeté. Son cœur de père est de nouveau transpercé. Il voit déjà l'ombre de la croix.

Cette douleur nous apprend que suivre Dieu n'est pas un chemin de facilité. Ceux qui aient vraiment sont appelés à souffrir avec ceux qu'ils aiment. Joseph accepte cette part de douleur, sans chercher à l'éviter.''',
      priere: '''Saint Joseph, dans votre quatrième douleur,
vous avez entendu la prophétie de Siméon.
Donnez-moi le courage d'accepter
les épreuves qui accompagnent l'amour vrai.
Aidez-moi à rester fidèle,
même quand la route devient difficile.
Que je ne cherche pas à fuir la croix,
mais à la porter avec amour.
Saint Joseph, priez pour moi.
Amen.''',
      imageUrl: 'assets/images/douleur4.jpg',
    ),
    DouleurJoie(
      type: 'douleur',
      numero: 5,
      titre: 'La fuite en Égypte',
      description: 'Joseph doit fuir en pleine nuit pour sauver Jésus',
      verset: 'Matthieu 2, 13-15',
      meditation: '''Un ange avertit Joseph en songe : "Lève-toi, prends l'enfant et sa mère, et fuis en Égypte." Joseph obéit sans tarder. Au milieu de la nuit, il réveille les siens, prépare l'âne, et part dans l'inconnu.

Quitter sa maison, sa terre, ses proches, son travail, tout abandonner pour sauver l'enfant. Joseph devient réfugié, étranger dans un pays inconnu. Il doit tout recommencer, trouver du travail, une maison, subvenir aux besoins des siens.

Cette douleur nous touche particulièrement aujourd'hui, alors que tant de familles sont déplacées par la guerre ou la misère. Joseph est leur protecteur, lui qui a connu l'exil et la précarité.''',
      priere: '''Saint Joseph, dans votre cinquième douleur,
vous avez tout quitté pour sauver Jésus.
Protégez tous ceux qui sont exilés, réfugiés, migrants.
Soyez leur soutien dans la peur et l'incertitude.
Aidez-les à trouver une terre d'accueil,
du travail, une maison, une nouvelle vie.
Saint Joseph, priez pour tous les exilés.
Amen.''',
      imageUrl: 'assets/images/douleur5.jpg',
    ),
    DouleurJoie(
      type: 'douleur',
      numero: 6,
      titre: 'L\'inquiétude du retour',
      description: 'Joseph craint de retourner en Judée',
      verset: 'Matthieu 2, 19-23',
      meditation: '''Après la mort d'Hérode, un ange dit à Joseph de retourner en Israël. Mais Joseph apprend qu'Archélaüs règne en Judée. Il a peur. Il craint pour la vie de l'enfant. Il hésite, il ne sait que faire.

Dieu lui parle de nouveau en songe et le guide vers la Galilée. Joseph obéit encore. Cette inquiétude montre que Joseph n'est pas un homme sans peur. Il est humain, il a des craintes. Mais il ne se laisse pas paralyser par elles. Il cherche la volonté de Dieu et il obéit.

Cette douleur nous apprend qu'il est normal d'avoir peur. Ce qui compte, ce n'est pas de ne jamais avoir peur, mais de ne pas laisser la peur nous arrêter. Comme Joseph, nous pouvons avancer malgré nos craintes, guidés par Dieu.''',
      priere: '''Saint Joseph, dans votre sixième douleur,
vous avez connu la peur et l'incertitude.
Aidez-moi quand la peur me paralyse.
Donnez-moi la force d'avancer malgré mes craintes.
Apprenez-moi à écouter la voix de Dieu
qui me guide au milieu des ténèbres.
Que je ne me laisse pas arrêter par la peur,
mais que j'avance avec confiance.
Saint Joseph, priez pour moi.
Amen.''',
      imageUrl: 'assets/images/douleur6.jpg',
    ),
    DouleurJoie(
      type: 'douleur',
      numero: 7,
      titre: 'La perte de Jésus au Temple',
      description: 'Joseph cherche Jésus pendant trois jours',
      verset: 'Luc 2, 41-48',
      meditation: '''Chaque année, Joseph et Marie montent à Jérusalem pour la Pâque. Quand Jésus a douze ans, ils le perdent pendant le retour. Pendant trois jours, ils le cherchent, angoissés. Trois jours d'angoisse, de questions, de peur.

Joseph se sent-il coupable ? A-t-il mal surveillé l'enfant ? Il cherche partout, demande à tous, sans trouver. Son cœur de père est déchiré.

Cette douleur est peut-être la plus grande. Perdre un enfant, ne pas savoir où il est, s'il est en danger... Beaucoup de parents connaissent cette angoisse. Joseph comprend leur détresse. Il intercède pour eux.

Après trois jours, ils retrouvent Jésus au Temple, paisible. "Pourquoi me cherchiez-vous ? Ne saviez-vous pas que je dois être aux affaires de mon Père ?" Joseph ne comprend pas tout, mais il accueille le mystère.''',
      priere: '''Saint Joseph, dans votre septième douleur,
vous avez cherché Jésus pendant trois jours.
Soyez proche de tous les parents
qui souffrent pour leurs enfants.
Protégez les enfants perdus, égarés, en danger.
Aidez ceux qui cherchent un être cher
à ne pas perdre espoir.
Et quand nous perdons Jésus par le péché,
aidez-nous à le retrouver dans le sacrement du pardon.
Saint Joseph, priez pour nous.
Amen.''',
      imageUrl: 'assets/images/douleur7.jpg',
    ),

    // LES 7 JOIES
    DouleurJoie(
      type: 'joie',
      numero: 1,
      titre: 'L\'annonce de l\'ange',
      description: 'L\'ange dissipe le doute de Joseph',
      verset: 'Matthieu 1, 20-21',
      meditation: '''Quelle joie quand l'ange apparaît à Joseph en songe ! "Joseph, fils de David, ne crains pas de prendre chez toi Marie ton épouse : ce qui a été engendré en elle vient de l'Esprit Saint."

Le doute, l'angoisse, le chagrin sont dissipés en un instant. Joseph comprend maintenant le mystère. Marie est la plus sainte des femmes, et l'enfant qu'elle porte est le Fils de Dieu. Non seulement il peut la prendre chez lui, mais il est appelé à être le père nourricier du Sauveur.

Cette joie est celle de la révélation. Dieu parle à Joseph dans le silence de la nuit et lui dévoile son plan. Joseph est choisi, appelé, aimé. Son cœur déborde de gratitude et d'émerveillement.''',
      priere: '''Saint Joseph, dans votre première joie,
l'ange a dissipé vos doutes et vos craintes.
Obtenez-moi la grâce de reconnaître
la présence de Dieu dans ma vie.
Quand je suis dans l'obscurité du doute,
envoyez-moi votre lumière.
Aidez-moi à croire que Dieu a un plan pour moi,
même quand je ne le comprends pas.
Saint Joseph, priez pour moi.
Amen.''',
      imageUrl: 'assets/images/joie1.jpg',
    ),
    DouleurJoie(
      type: 'joie',
      numero: 2,
      titre: 'La naissance de Jésus',
      description: 'Joseph contemple l\'enfant Jésus',
      verset: 'Luc 2, 6-7',
      meditation: '''Quelle joie pour Joseph de tenir enfin l'enfant dans ses bras ! Il le contemple, ce petit être fragile qui est le Fils de Dieu. Il le serre contre lui, il le protège, il l'aime.

L'étable est pauvre, mais le cœur de Joseph déborde de richesses. Il est le premier, avec Marie, à adorer le Sauveur. Il est le premier à veiller sur lui, à le nourrir, à le réchauffer.

Cette joie est celle de la paternité. Joseph est père, non pas selon la chair, mais selon le cœur. Il a reçu de Dieu cette grâce inouïe : être le père nourricier de Jésus. Son cœur chante de joie.''',
      priere: '''Saint Joseph, dans votre deuxième joie,
vous avez tenu Jésus dans vos bras.
Apprenez-moi à le tenir dans mon cœur.
Aidez-moi à le contempler avec amour,
à le protéger par ma vie,
à le faire connaître par mes paroles et mes actes.
Que ma plus grande joie soit d'aimer Jésus,
comme vous l'avez aimé.
Saint Joseph, priez pour moi.
Amen.''',
      imageUrl: 'assets/images/joie2.jpg',
    ),
    DouleurJoie(
      type: 'joie',
      numero: 3,
      titre: 'La circoncision et le nom de Jésus',
      description: 'Joseph donne le nom de Jésus',
      verset: 'Matthieu 1, 21.25',
      meditation: '''Le huitième jour, Joseph accomplit le rite de la circoncision et, comme l'ange le lui a commandé, il donne à l'enfant le nom de Jésus, ce qui signifie "Dieu sauve".

Quelle joie pour Joseph de prononcer ce nom pour la première fois ! Jésus, le Sauveur. Cet enfant qu'il tient dans ses bras est venu pour sauver son peuple. Joseph est le premier à l'appeler par ce nom qui sera un jour sur toutes les lèvres.

Cette joie est celle de la mission. Joseph participe au salut du monde en donnant son nom à Jésus. Il n'est pas un simple spectateur, il est acteur du plan de Dieu.''',
      priere: '''Saint Joseph, dans votre troisième joie,
vous avez donné à Jésus son saint nom.
Apprenez-moi à prononcer ce nom avec amour,
à l'invoquer dans mes difficultés,
à le bénir en toutes circonstances.
Que le nom de Jésus soit toujours sur mes lèvres
et dans mon cœur.
Saint Joseph, priez pour moi.
Amen.''',
      imageUrl: 'assets/images/joie3.jpg',
    ),
    DouleurJoie(
      type: 'joie',
      numero: 4,
      titre: 'Les prophéties de Siméon et Anne',
      description: 'Joseph entend les louanges de Siméon et Anne',
      verset: 'Luc 2, 25-38',
      meditation: '''Au Temple, Siméon prend l'enfant dans ses bras et bénit Dieu. Il reconnaît en lui le Messie tant attendu. Anne, la prophétesse, survient et se met à louer Dieu.

Quelle joie pour Joseph d'entendre ces témoignages ! Des inconnus, guidés par l'Esprit Saint, reconnaissent qui est Jésus. Joseph n'est pas seul à savoir. D'autres voient, d'autres croient, d'autres espèrent.

Cette joie est celle de la communion des saints. Joseph découvre qu'il fait partie d'un peuple qui attend le salut. Il n'est pas isolé. D'autres marchent avec lui vers la lumière.''',
      priere: '''Saint Joseph, dans votre quatrième joie,
vous avez entendu les prophéties de Siméon et Anne.
Aidez-moi à reconnaître les signes de Dieu
dans les personnes que je rencontre.
Donnez-moi la grâce de témoigner
de ma foi comme Siméon et Anne.
Que je sache reconnaître Jésus
dans ceux qui croisent ma route.
Saint Joseph, priez pour moi.
Amen.''',
      imageUrl: 'assets/images/joie4.jpg',
    ),
    DouleurJoie(
      type: 'joie',
      numero: 5,
      titre: 'La présence de Jésus dans la fuite en Égypte',
      description: 'Joseph protège Jésus en Égypte',
      verset: 'Matthieu 2, 13-15',
      meditation: '''En Égypte, Joseph vit avec Jésus et Marie. Il travaille, il prie, il aime. Chaque jour, il voit Jésus grandir, apprendre, sourire. Quelle joie de vivre avec Dieu !

L'exil est dur, mais la présence de Jésus transforme tout. Joseph n'est pas chez lui, mais il est chez Dieu. Jésus est sa patrie, sa maison, son tout.

Cette joie est celle de la présence. Nous aussi, nous pouvons vivre avec Jésus chaque jour. Dans la prière, dans les sacrements, dans l'amour du prochain, il est avec nous. Rien d'autre ne compte vraiment.''',
      priere: '''Saint Joseph, dans votre cinquième joie,
vous avez vécu avec Jésus en Égypte.
Apprenez-moi à vivre en sa présence chaque jour.
Que je sache le reconnaître dans ma vie,
dans les événements, dans les personnes.
Que sa présence soit ma joie,
ma force, ma paix.
Saint Joseph, priez pour moi.
Amen.''',
      imageUrl: 'assets/images/joie5.jpg',
    ),
    DouleurJoie(
      type: 'joie',
      numero: 6,
      titre: 'Le retour à Nazareth',
      description: 'Joseph ramène la sainte Famille à Nazareth',
      verset: 'Matthieu 2, 19-23',
      meditation: '''Après la mort d'Hérode, Joseph ramène les siens à Nazareth. Enfin, ils ont une maison, un pays, une vie stable. Jésus peut grandir en paix.

Quelle joie de rentrer chez soi après l'exil ! Quelle joie de retrouver sa terre, sa famille, ses amis ! Joseph est reconnaissant à Dieu qui les a protégés et ramenés.

Cette joie est celle du retour. Nous sommes tous en exil sur cette terre, en attente de la patrie céleste. Un jour, Dieu nous ramènera chez lui, dans la maison du Père. Cette espérance est notre joie.''',
      priere: '''Saint Joseph, dans votre sixième joie,
vous êtes retourné à Nazareth après l'exil.
Aidez-moi à garder l'espérance
de la patrie céleste.
Dans les moments d'exil et d'épreuve,
rappelez-moi que Dieu me ramènera chez lui.
Que cette espérance soit ma force
et ma joie chaque jour.
Saint Joseph, priez pour moi.
Amen.''',
      imageUrl: 'assets/images/joie6.jpg',
    ),
    DouleurJoie(
      type: 'joie',
      numero: 7,
      titre: 'La vie cachée à Nazareth',
      description: 'Joseph vit avec Jésus et Marie',
      verset: 'Luc 2, 51-52',
      meditation: '''Pendant trente ans, Joseph vit à Nazareth avec Jésus et Marie. Trente ans de vie simple, de travail, de prière, d'amour. Trente ans à voir Jésus grandir en sagesse et en grâce.

Quelle joie ineffable ! Joseph est le témoin privilégié de la vie cachée de Jésus. Il voit son premier sourire, ses premiers pas, ses premières paroles. Il partage ses repas, ses prières, ses jeux.

Cette joie est celle de l'intimité avec Dieu. Joseph nous apprend que la sainteté se trouve dans la vie quotidienne, dans les petites choses faites avec amour. Il nous invite à découvrir Dieu dans notre propre vie cachée.''',
      priere: '''Saint Joseph, dans votre septième joie,
vous avez vécu trente ans avec Jésus.
Apprenez-moi à trouver Dieu
dans ma vie quotidienne.
Aidez-moi à voir sa présence
dans les petites choses de chaque jour.
Que ma vie cachée soit, comme la vôtre,
une offrande d'amour à Dieu.
Saint Joseph, priez pour moi.
Amen.''',
      imageUrl: 'assets/images/joie7.jpg',
    ),
  ];

  static List<DouleurJoie> getDouleurs() {
    return toutes.where((dj) => dj.type == 'douleur').toList();
  }

  static List<DouleurJoie> getJoies() {
    return toutes.where((dj) => dj.type == 'joie').toList();
  }
}