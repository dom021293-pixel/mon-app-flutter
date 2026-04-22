// lib/data/enseignements_data.dart
import 'package:joe/models/enseignement_model.dart';

class EnseignementsData {
  static List<Enseignement> tousLesEnseignements = [
    // PAPES
    Enseignement(
      id: 'patris_corde',
      titre: 'Patris Corde - Un cœur de père',
      auteur: 'Pape François',
      extrait: 'Joseph est un père aimé, un père tendre et obéissant...',
      contenu: '''
Avec un cœur de père : c'est ainsi que Joseph a aimé Jésus, appelé dans les quatre Évangiles « le fils de Joseph ».

Dans sa lettre apostolique "Patris corde" (8 décembre 2020), le Pape François révèle sept aspects de la paternité de Joseph :

1. Père aimé : Joseph est aimé parce qu'il a aimé. Il est le père adoptif que Dieu a choisi pour son Fils.
2. Père tendre : Sa tendresse s'est manifestée dans sa délicatesse envers Marie et dans sa protection de l'Enfant.
3. Père obéissant : Il obéit à l'ange sans hésiter, acceptant des plans qui dépassent sa compréhension.
4. Père accueillant : Il accueille Marie et le mystère de l'Incarnation sans chercher à le contrôler.
5. Père au courage créatif : Dans les difficultés (fuite en Égypte), il fait preuve d'une inventivité pleine de foi.
6. Père travailleur : Il apprend à Jésus le métier de charpentier, sanctifiant le travail manuel.
7. Père dans l'ombre : Il vit dans la discrétion, acceptant de n'être pas au premier plan.

"Chaque pauvre, chômeur, personne marginalisée, migrant, personne en situation de précarité, puisse trouver en Joseph un intercesseur, un soutien et un guide." (Pape François)
      ''',
      categorie: 'Papes',
      date: '8 décembre 2020',
      imageUrl: 'assets/images/pape_francois.jpg',
      references: ['Lettre apostolique "Patris corde"'],
    ),
    
    Enseignement(
      id: 'joseph_pape_leon',
      titre: 'Saint Joseph, Patron de l\'Église universelle',
      auteur: 'Pape Léon XIII',
      extrait: 'Joseph a été constitué par Dieu comme le protecteur de la Sainte Famille...',
      contenu: '''
C'est le pape Léon XIII qui, en 1889, a déclaré saint Joseph Patron de l'Église universelle. Dans son encyclique "Quamquam pluries", il explique pourquoi l'Église confie à Joseph sa protection.

"Joseph a été constitué par Dieu comme le protecteur de la Sainte Famille de Nazareth, comme le père virginal de Jésus. Il est juste et naturel que, comme il a protégé la Sainte Famille pendant sa vie terrestre, il protège maintenant l'Église, qui est la famille spirituelle de Jésus."

Léon XIII souligne que Joseph partage avec Marie une intimité unique avec Jésus. Personne après Marie n'a été aussi proche du Sauveur. Personne n'a mieux connu son cœur, ses besoins, ses désirs. Joseph est donc l'intercesseur le plus puissant après Marie.

Le pape invite tous les fidèles à recourir à saint Joseph dans leurs nécessités, particulièrement dans les moments difficiles pour l'Église. Il promet que ceux qui l'invoquent avec confiance seront exaucés, car Joseph, qui a protégé Jésus sur terre, ne peut rien refuser à ceux qui appartiennent à Jésus.

Depuis cette déclaration, tous les papes ont encouragé la dévotion à saint Joseph et ont souligné son rôle de protecteur de l'Église. Le pape François, dans "Patris corde", a réaffirmé cette conviction : "Aujourd'hui encore, nous pouvons confier à saint Joseph, le protecteur de la Sainte Famille, la protection de nos familles, de nos communautés et de l'Église tout entière."
      ''',
      categorie: 'Papes',
      date: '15 août 1889',
      imageUrl: 'assets/images/leon13.jpg',
      references: ['Encyclique "Quamquam pluries"'],
    ),
    
    Enseignement(
      id: 'joseph_jean_paul2',
      titre: 'Redemptoris Custos - La dignité et la mission de Saint Joseph',
      auteur: 'Saint Jean-Paul II',
      extrait: 'Joseph est le gardien du Rédempteur et le serviteur de l\'œuvre du salut...',
      contenu: '''
Dans son exhortation apostolique "Redemptoris Custos" (15 août 1989), Saint Jean-Paul II approfondit la figure de Joseph à l'occasion du centenaire de la déclaration de Léon XIII.

Jean-Paul II développe plusieurs aspects de la mission de Joseph :

L'homme juste : "Joseph est appelé juste parce qu'il vit pleinement la justice qui vient de la foi." Sa justice n'est pas une simple observance extérieure, mais une adhésion profonde à la volonté de Dieu.

Le serviteur de l'Incarnation : "Joseph a été appelé par Dieu à servir directement la personne et la mission de Jésus par l'exercice de sa paternité." Il n'est pas un simple figurant, mais un acteur essentiel du mystère du salut.

Le mari de Marie : "L'amour conjugal de Joseph pour Marie est un amour virginal qui respecte le mystère et sert le dessein de Dieu." Leur union est au service de l'enfant.

L'éducation de Jésus : "Joseph a dû apprendre à Jésus la signification de la souffrance, de la pauvreté, de la persécution." Il a préparé Jésus à sa mission.

Le patron de l'Église : "Comme il a veillé sur la Sainte Famille, Joseph veille aujourd'hui sur l'Église, la famille des enfants de Dieu."

Saint Jean-Paul II conclut : "Que Saint Joseph obtienne à l'Église et au monde la confiance en Dieu qui seule peut assurer la paix et le progrès authentique de la famille humaine."
      ''',
      categorie: 'Papes',
      date: '15 août 1989',
      imageUrl: 'assets/images/jean_paul2.jpg',
      references: ['Exhortation "Redemptoris Custos"'],
    ),
    
    Enseignement(
      id: 'joseph_benoit16',
      titre: 'Le silence de Joseph',
      auteur: 'Benoît XVI',
      extrait: 'Le silence de Joseph est un silence plein de foi et d\'écoute...',
      contenu: '''
Le silence de Joseph est particulièrement éloquent, comme l'a souligné Benoît XVI dans ses catéchèses. Dans les Évangiles, il ne prononce pas une seule parole. Pourtant, son silence n'est pas un vide, mais une plénitude. C'est le silence de l'écoute, de la contemplation, de l'obéissance.

Benoît XVI explique : "Dans le silence, Joseph accueille la parole de Dieu. Dans le silence, il protège Marie et l'Enfant. Dans le silence, il travaille et éduque Jésus. Son silence est habité par la présence de Dieu."

Le pape émérite souligne la pertinence de ce silence pour notre époque : "Notre époque a besoin de redécouvrir la valeur du silence. Nous sommes submergés de paroles, de bruit, d'images. Le silence nous fait peur. Pourtant, c'est dans le silence que Dieu parle au cœur de l'homme. C'est dans le silence que nous pouvons vraiment écouter et comprendre."

Joseph nous apprend l'art du silence intérieur. Il nous montre comment, dans le silence, nous pouvons être pleinement présents à Dieu et aux autres. Son silence n'est pas une absence, mais une présence profonde et aimante.

"Le silence de Joseph nous invite à faire taire en nous les bruits du monde pour mieux entendre la voix de Dieu qui veut nous parler." (Benoît XVI)
      ''',
      categorie: 'Papes',
      date: '18 décembre 2005',
      imageUrl: 'assets/images/benoit16.jpg',
      references: ['Catéchèses', 'Angélus du 18 décembre 2005'],
    ),
    
    Enseignement(
      id: 'joseph_pie9',
      titre: 'La proclamation de Saint Joseph comme Patron de l\'Église',
      auteur: 'Pape Pie IX',
      extrait: 'Joseph, le père virginal de Jésus, est digne de la vénération universelle...',
      contenu: '''
Le 8 décembre 1870, le Pape Pie IX proclame solennellement Saint Joseph Patron de l'Église universelle par le décret "Quemadmodum Deus". Ce décret s'inscrit dans un contexte troublé : les États pontificaux viennent d'être envahis, l'Église traverse des difficultés.

Pie IX, qui avait déjà défini le dogme de l'Immaculée Conception seize ans plus tôt, veut confier l'Église à celui qui a protégé Jésus et Marie. Il écrit : "De même que Dieu avait établi Joseph comme chef de sa famille domestique, de même il l'a établi comme père et chef de sa famille universelle, l'Église."

Le décret souligne que Joseph est particulièrement digne de ce titre pour plusieurs raisons :
- Il a été choisi par Dieu lui-même pour cette mission
- Il a exercé une paternité véritable sur Jésus
- Il a protégé la Sainte Famille dans les dangers
- Il est un modèle de toutes les vertus

Pie IX exprime sa confiance que Joseph, qui a protégé Jésus sur terre, protégera désormais l'Église, le corps mystique du Christ. Cette proclamation marque un tournant dans la dévotion à Saint Joseph, qui connaîtra ensuite un développement considérable.
      ''',
      categorie: 'Papes',
      date: '8 décembre 1870',
      imageUrl: 'assets/images/pie9.jpg',
      references: ['Décret "Quemadmodum Deus"'],
    ),
    
    Enseignement(
      id: 'joseph_pie12',
      titre: 'Saint Joseph travailleur',
      auteur: 'Pape Pie XII',
      extrait: 'Joseph est le modèle des travailleurs, sanctifiant le travail manuel...',
      contenu: '''
Le 1er mai 1955, le Pape Pie XII institue la fête de "Saint Joseph travailleur" pour donner un patron chrétien aux travailleurs et contrer la fête du travail laïque du 1er mai.

Pie XII explique : "Le travail humain, en particulier le travail manuel, trouve dans la Sainte Famille de Nazareth une exaltation particulière. Joseph était un travailleur, il a appris son métier à Jésus, et ensemble ils ont partagé la fatigue et la joie du travail quotidien."

Le pape souligne la dignité du travail : "Le travail n'est pas seulement une activité humaine, mais il participe à l'œuvre créatrice de Dieu. En travaillant, l'homme imite son Créateur et collabore à la transformation du monde."

Dans le contexte de l'après-guerre, marqué par les luttes sociales et l'influence du communisme, Pie XII propose Joseph comme modèle aux travailleurs chrétiens : "Joseph nous apprend que le travail, même le plus humble, a une dignité et une valeur spirituelle. Il n'est pas une malédiction mais une participation à l'œuvre du salut."

"Que saint Joseph, le travailleur de Nazareth, intercède pour tous ceux qui sont sans emploi, pour ceux qui sont exploités, pour ceux qui peinent dans des conditions difficiles." (Pie XII)
      ''',
      categorie: 'Papes',
      date: '1er mai 1955',
      imageUrl: 'assets/images/pie12.jpg',
      references: ['Discours du 1er mai 1955'],
    ),
    
    Enseignement(
      id: 'joseph_paul6',
      titre: 'Joseph, homme de silence et de service',
      auteur: 'Pape Paul VI',
      extrait: 'Joseph nous enseigne la valeur du silence et du service discret...',
      contenu: '''
Le Pape Paul VI, dans ses enseignements, a souvent mis en avant la figure de Joseph comme modèle de vie cachée et de service humble. Il voit en lui l'exemple parfait de ceux qui servent Dieu dans la discrétion.

Paul VI déclare : "Joseph est le modèle des humbles que le christianisme élève aux grandes destinées. Il est la preuve que pour être bon disciple du Christ, il n'est pas besoin de faire de grandes choses, mais il suffit d'avoir les vertus communes d'un cœur simple et laborieux."

Le pape développe trois aspects de Joseph :
- L'homme du silence : "Son silence n'est pas vide mais plein de foi, plein de méditation, plein de prière."
- L'homme du service : "Toute sa vie est au service de Jésus et Marie, sans jamais chercher son intérêt propre."
- L'homme de la présence : "Il est là, toujours disponible, toujours attentif, toujours fidèle."

Paul VI voit en Joseph un guide pour les chrétiens d'aujourd'hui : "Dans un monde bruyant et agité, Joseph nous apprend la valeur du recueillement. Dans une société où chacun cherche à paraître, il nous apprend l'humilité du service."

"C'est pourquoi l'Église regarde Joseph avec une confiance particulière et l'invoque comme son protecteur." (Paul VI)
      ''',
      categorie: 'Papes',
      date: '19 mars 1969',
      imageUrl: 'assets/images/paul6.jpg',
      references: ['Homélies', 'Discours'],
    ),
    
    // SAINTS
    Enseignement(
      id: 'joseph_therese',
      titre: 'Saint Joseph dans la vie de Sainte Thérèse',
      auteur: 'Sainte Thérèse de Lisieux',
      extrait: 'Je n\'ai jamais rien demandé à saint Joseph sans être exaucée...',
      contenu: '''
Dès son plus jeune âge, Thérèse a eu une dévotion particulière pour saint Joseph. Elle raconte dans ses écrits comment, à l'âge de cinq ou six ans, elle avait déjà une grande confiance en lui.

Mais c'est surtout lors d'une grave maladie qu'elle expérimente sa protection. Alors qu'elle est gravement malade et que les médecins désespèrent de la guérir, sa sœur Pauline place une statue de saint Joseph près de son lit. Thérèse se tourne vers lui avec une foi simple et confiante. Soudain, elle voit la statue s'animer, saint Joseph lui sourit et elle est guérie instantanément.

Plus tard, devenue carmélite, Thérèse continue de confier à saint Joseph toutes ses intentions. Elle écrit : "Je n'ai jamais rien demandé à saint Joseph sans être exaucée. Il est vraiment le père des âmes intérieures, celui qui sait protéger dans les difficultés et obtenir les grâces nécessaires."

Pour Thérèse, saint Joseph est le modèle de la vie cachée, celui qui a vécu dans l'intimité de Jésus et Marie sans chercher à paraître. C'est pourquoi elle l'invoque particulièrement pour les âmes qui veulent se donner à Dieu dans le silence et l'humilité.

Dans sa dernière maladie, elle recommande aux sœurs de prier saint Joseph pour elle, disant : "Saint Joseph, vous qui êtes le patron de la bonne mort, priez pour moi !"
      ''',
      categorie: 'Saints',
      date: 'Extrait de "Histoire d\'une âme"',
      imageUrl: 'assets/images/therese.jpg',
      references: ['Histoire d\'une âme', 'Poésies'],
    ),
    
    Enseignement(
      id: 'joseph_francois_sales',
      titre: 'Joseph, modèle des parfaits chrétiens',
      auteur: 'Saint François de Sales',
      extrait: 'Saint Joseph est le modèle des parfaits chrétiens...',
      contenu: '''
Saint François de Sales, grand docteur de l'Église, avait une dévotion particulière pour saint Joseph. Dans ses écrits, il le présente comme le modèle de toutes les vertus chrétiennes.

Il écrit : "Saint Joseph est le modèle des parfaits chrétiens. Il a vécu dans l'union intime avec Jésus et Marie, et c'est pourquoi il est si puissant auprès d'eux. Sa vie, toute simple et toute cachée, est pourtant d'une richesse incomparable."

François de Sales développe particulièrement trois vertus de Joseph :

La fidélité dans les petites choses : "Joseph n'a pas fait de miracles, n'a pas prêché, n'a pas converti les foules. Il a simplement été fidèle dans les humbles tâches de chaque jour. Et c'est par cette fidélité qu'il a sauvé le Sauveur."

La confiance dans les épreuves : "Quand il ne comprend pas, quand il doute, quand il doit fuir, Joseph continue de faire confiance. Il ne s'appuie pas sur sa propre intelligence mais sur la Providence."

L'amour sans mesure : "Joseph aime Jésus et Marie d'un amour si pur, si désintéressé, si total qu'il devient le modèle de tout amour véritable."

Le saint évêque conclut : "Si nous voulons être de vrais chrétiens, imitons Joseph dans sa vie cachée, dans son travail humble, dans son amour silencieux."
      ''',
      categorie: 'Saints',
      date: 'Extrait de ses sermons',
      imageUrl: 'assets/images/francois_sales.jpg',
      references: ['Sermons', 'Introduction à la vie dévote'],
    ),
    
    Enseignement(
      id: 'joseph_bernard',
      titre: 'Joseph, l\'intercesseur puissant',
      auteur: 'Saint Bernard de Clairvaux',
      extrait: 'Pourquoi craindrais-je d\'aller à Joseph ?...',
      contenu: '''
Saint Bernard, le grand docteur de l'Église, a magnifiquement parlé de Joseph dans ses sermons. Il insiste particulièrement sur la puissance d'intercession de celui qui a porté Jésus dans ses bras.

Bernard s'exclame : "Pourquoi craindrais-je d'aller à Joseph ? Jésus l'a aimé non seulement comme ami, mais comme père. Il ne peut rien refuser à celui qui l'a porté dans ses bras."

Il développe une théologie de la paternité de Joseph : "Ce n'est pas selon la chair que Joseph est père, mais selon le cœur. Et c'est cette paternité spirituelle qui le rend si proche de Jésus. Qui mieux que lui connaît le cœur du Fils ? Qui mieux que lui peut intercéder pour nous ?"

Bernard voit en Joseph un modèle de foi : "Il a cru sans voir, il a obéi sans comprendre, il a aimé sans mesure. Sa foi est plus grande que celle d'Abraham, car il a cru au mystère de l'Incarnation avant même qu'il ne soit accompli."

Le saint abbé encourage ses moines à recourir à Joseph : "Allons à Joseph avec confiance. Présentons-lui nos besoins, nos peines, nos combats. Il est le père des pauvres, le consolateur des affligés, le soutien des faibles."

"Joseph est vraiment le trésorier du Cœur de Jésus, celui qui distribue ses grâces à tous ceux qui l'invoquent." (Saint Bernard)
      ''',
      categorie: 'Saints',
      date: 'XIIe siècle',
      imageUrl: 'assets/images/bernard.jpg',
      references: ['Sermons pour la Nativité', 'Homélies'],
    ),
    
    Enseignement(
      id: 'joseph_josemaria',
      titre: 'La confiance absolue de Joseph',
      auteur: 'Saint Josémaria Escriva',
      extrait: 'Joseph a cru sans voir, il a obéi sans comprendre, il a fait confiance sans réserve...',
      contenu: '''
Saint Josémaria Escriva, fondateur de l'Opus Dei, avait une profonde dévotion pour saint Joseph. Dans ses homélies, il présente Joseph comme le modèle de la vie ordinaire vécue avec sainteté.

Il écrit : "Saint Joseph a été un homme d'une foi et d'une confiance absolues. Quand l'ange lui annonce en songe que Marie est enceinte par l'œuvre du Saint-Esprit, il obéit sans hésiter. Il ne demande pas de signes, ne pose pas de conditions. Il fait confiance."

Josémaria souligne la promptitude de Joseph : "Quand l'ange lui dit de fuir en Égypte, il se lève la nuit même et part. Il ne demande pas où il va, ni pour combien de temps. Il fait confiance. Quand l'ange lui dit de revenir, il revient. Toujours cette même confiance totale."

Le fondateur de l'Opus Dei voit dans cette confiance un modèle pour notre vie : "Nous avons tant besoin de cette confiance aujourd'hui. Face aux difficultés de la vie, face aux situations que nous ne comprenons pas, nous sommes appelés à imiter Joseph : faire confiance à Dieu, même quand nous ne voyons pas le chemin."

Il ajoute : "Cette confiance de Joseph est d'autant plus admirable que les situations dans lesquelles il se trouve sont humainement incompréhensibles. Une vierge qui enfante, un Dieu qui devient enfant, une fuite précipitée... Tout cela dépasse la raison humaine. Mais Joseph ne raisonne pas, il fait confiance."

"Comme Joseph, marchons dans la foi, sûrs que Dieu ne nous abandonne jamais." (Saint Josémaria)
      ''',
      categorie: 'Saints',
      date: '19 mars 1956',
      imageUrl: 'assets/images/josemaria.jpg',
      references: ['Homélie "En la solennité de saint Joseph"', 'Forge'],
    ),
    
    Enseignement(
      id: 'joseph_alphonse',
      titre: 'Joseph, le père virginal',
      auteur: 'Saint Alphonse de Liguori',
      extrait: 'Joseph a été choisi pour être le père virginal de Jésus...',
      contenu: '''
Saint Alphonse de Liguori, docteur de l'Église et fondateur des Rédemptoristes, a écrit de magnifiques pages sur saint Joseph dans ses œuvres. Il insiste particulièrement sur la paternité virginale de Joseph.

Alphonse explique : "Joseph a été choisi par Dieu pour être le père virginal de Jésus. Non pas un père selon la chair, mais un père selon le cœur, un père qui aimerait Jésus d'un amour plus pur encore que l'amour paternel naturel."

Le saint évêque développe ce qu'implique cette paternité : "Joseph a exercé sur Jésus une autorité véritable, mais une autorité toute de service et d'amour. Il l'a protégé, nourri, éduqué. Il lui a appris à parler, à prier, à travailler. Il a été pour lui un père en tout, sauf dans la génération charnelle."

Alphonse voit dans cette paternité une source de puissance d'intercession : "Quand Joseph intercède pour nous, il le fait avec toute la tendresse d'un père pour son enfant. Jésus ne peut rien refuser à celui qui a pris soin de lui pendant tant d'années."

Le saint docteur encourage ses lecteurs à recourir à Joseph dans toutes leurs nécessités : "Allons à Joseph avec la confiance d'enfants qui savent que leur père ne les abandonnera jamais. Il est le protecteur des familles, le consolateur des affligés, le soutien des pauvres."

"Joseph est vraiment le trésorier du Cœur de Jésus, celui qui distribue ses grâces à tous ceux qui l'invoquent." (Saint Alphonse)
      ''',
      categorie: 'Saints',
      date: 'XVIIIe siècle',
      imageUrl: 'assets/images/alphonse.jpg',
      references: ['Glories de Marie', 'Sermons'],
    ),
    
    Enseignement(
      id: 'joseph_augustin',
      titre: 'Joseph, l\'homme juste',
      auteur: 'Saint Augustin',
      extrait: 'Joseph fut appelé juste parce qu\'il possédait toutes les vertus...',
      contenu: '''
Saint Augustin, le grand docteur de l'Église, a commenté la figure de Joseph dans ses sermons et traités. Il s'arrête particulièrement sur le titre d'"homme juste" que l'Évangile lui donne.

Augustin explique : "Joseph fut appelé juste parce qu'il possédait toutes les vertus. Sa justice n'était pas une simple observance extérieure, mais une adhésion profonde à la volonté de Dieu. Il était juste dans ses pensées, dans ses paroles, dans ses actes."

Le saint évêque d'Hippone développe cette justice de Joseph : "Il était juste envers Dieu par sa foi, juste envers Marie par son respect, juste envers Jésus par son amour, juste envers le prochain par sa charité discrète."

Augustin voit en Joseph un modèle de la foi : "Il a cru à la parole de l'ange alors que tout semblait impossible. Il a cru que Marie était enceinte par l'Esprit Saint. Il a cru qu'il devait fuir en Égypte. Il a cru, sans voir, sans comprendre."

Le docteur de la grâce ajoute : "Joseph est juste parce qu'il est totalement ouvert à Dieu. Quand l'ange lui révèle le mystère de l'incarnation, il ne doute pas, il obéit. Sa justice est une justice de foi, qui accueille le plan de Dieu sans le comprendre pleinement."

"Cette justice se manifeste aussi dans sa délicatesse envers Marie. Voulant la protéger, il décide de la répudier secrètement. C'est un homme bon, qui ne veut pas nuire, même quand il est dans l'incompréhension." (Saint Augustin)
      ''',
      categorie: 'Saints',
      date: 'Ve siècle',
      imageUrl: 'assets/images/augustin.jpg',
      references: ['Sermons', 'Traités sur Matthieu'],
    ),
    
    Enseignement(
      id: 'joseph_bernadette',
      titre: 'Saint Joseph et les apparitions de Lourdes',
      auteur: 'Sainte Bernadette Soubirous',
      extrait: 'Saint Joseph était présent avec la Sainte Vierge...',
      contenu: '''
Le 25 mars 1858, jour de l'Annonciation, la Vierge Marie apparaît à Bernadette pour la seizième fois. Ce jour-là, la Dame lui révèle son nom : "Je suis l'Immaculée Conception". Mais Bernadette raconte aussi qu'à côté de la Vierge, elle voit saint Joseph.

Dans ses témoignages, Bernadette décrit saint Joseph comme un homme d'un certain âge, à la barbe blanche, tenant un cierge à la main. Il se tient légèrement en retrait, regardant la Sainte Vierge avec un air de vénération profonde. Il ne parle pas, mais sa présence est paisible et protectrice.

Cette apparition discrète de saint Joseph à Lourdes est très significative. Elle nous montre que là où est Marie, Joseph est présent. Il est le gardien silencieux, celui qui protège sans faire de bruit. À Lourdes comme à Nazareth, Joseph est là, dans l'ombre, veillant sur la Mère et sur l'Église.

Bernadette raconte : "Je voyais la Sainte Vierge, et à côté d'elle, un peu en arrière, je voyais saint Joseph. Il tenait un cierge à la main et regardait la Sainte Vierge avec tant d'amour ! Il ne disait rien, mais sa présence me remplissait de paix."

Pour Bernadette, cette vision confirme ce qu'elle a toujours cru : saint Joseph est vraiment le protecteur de la Sainte Vierge et de tous les chrétiens. Elle aura ensuite une dévotion particulière pour lui, l'invoquant dans toutes ses difficultés.
      ''',
      categorie: 'Saints',
      date: '25 mars 1858',
      imageUrl: 'assets/images/bernadette.jpg',
      references: ['Témoignages de Sainte Bernadette', 'Archives de Lourdes'],
    ),
    
    Enseignement(
      id: 'joseph_jean_chrysostome',
      titre: 'Joseph, le charpentier qui a sauvé le Sauveur',
      auteur: 'Saint Jean Chrysostome',
      extrait: 'Si le charpentier n\'avait pas émigré en Égypte, le Christ n\'aurait pas été sauvé...',
      contenu: '''
Saint Jean Chrysostome, le grand prédicateur de l'Église d'Orient, a prononcé de magnifiques homélies sur saint Joseph. Il s'émerveille de voir comment Dieu a choisi un simple charpentier pour accomplir ses desseins.

Chrysostome s'exclame : "Si le charpentier n'avait pas émigré en Égypte, le Christ n'aurait pas été sauvé. Si le charpentier n'était pas descendu en Égypte, personne n'aurait appelé le Christ d'Égypte. Ainsi, par l'obéissance de cet humble artisan, toute l'Écriture s'accomplit."

Le saint docteur insiste sur l'humilité de Joseph : "Il n'était ni roi, ni prêtre, ni savant. Il était un simple artisan, gagnant sa vie à la sueur de son front. Et pourtant, Dieu l'a choisi pour être le père de son Fils. C'est ainsi que Dieu agit : il choisit ce qui est humble pour confondre ce qui est fort."

Chrysostome voit dans la promptitude d'obéissance de Joseph un modèle pour tous les croyants : "Dès la nuit, il se lève et part. Il ne demande pas : 'Où allons-nous ? Pour combien de temps ? Comment vivrons-nous là-bas ?' Il obéit simplement, sans discuter."

Le prédicateur ajoute : "Joseph a contribué au salut du monde par son obéissance et son travail. Son atelier de Nazareth était plus grand que tous les palais des rois, car c'est là que le Fils de Dieu a appris à travailler de ses mains."

"Gloire à toi, Joseph, charpentier de Nazareth, qui as sauvé le Sauveur !" (Saint Jean Chrysostome)
      ''',
      categorie: 'Saints',
      date: 'IVe siècle',
      imageUrl: 'assets/images/chrysostome.jpg',
      references: ['Homélies sur Matthieu'],
    ),
    
    // THÉOLOGIENS ET SPIRITUELS
    Enseignement(
      id: 'joseph_gerson',
      titre: 'Joseph, le miroir de la patience',
      auteur: 'Jean Gerson',
      extrait: 'Considérez Joseph dans toutes ses épreuves...',
      contenu: '''
Jean Gerson, grand théologien et chancelier de l'Université de Paris, est l'un des principaux promoteurs de la dévotion à saint Joseph au XVe siècle. Son traité "Considérations sur saint Joseph" a eu une influence considérable.

Gerson propose de méditer sur les épreuves de Joseph : "Considérez Joseph dans toutes ses épreuves : le doute, la pauvreté de la naissance, la fuite en Égypte, la perte de Jésus au Temple. Dans chacune, il fait preuve d'une patience admirable, sans jamais se plaindre ni se révolter."

Le théologien développe ce qu'il appelle "les sept douleurs et les sept joies de Joseph", qui deviendront un thème majeur de la spiritualité joséphine. Chaque douleur est accompagnée d'une joie correspondante.

Il écrit : "Joseph est vraiment le miroir de la patience. Dans l'obscurité de la foi, il avance sans voir, sans comprendre, sans savoir. Il ne s'appuie pas sur ses propres forces mais sur la Providence. C'est pourquoi Dieu peut tant compter sur lui."

Gerson encourage les fidèles à imiter Joseph : "Apprenons de lui à porter nos croix avec patience, à faire confiance dans l'épreuve, à persévérer dans la fidélité. Joseph nous montre que la sainteté ne consiste pas à faire de grandes choses, mais à accomplir humblement et fidèlement la volonté de Dieu dans les petites choses de chaque jour."

"Ô bienheureux Joseph, qui avez tant souffert sans jamais vous plaindre, obtenez-nous la grâce de la patience dans nos épreuves !" (Jean Gerson)
      ''',
      categorie: 'Théologiens',
      date: 'XVe siècle',
      imageUrl: 'assets/images/gerson.jpg',
      references: ['Considérations sur saint Joseph'],
    ),
    
    Enseignement(
      id: 'joseph_isidore',
      titre: 'Joseph, modèle des pères de famille',
      auteur: 'Saint Isidore de Séville',
      extrait: 'Joseph est le modèle de tous les pères...',
      contenu: '''
Saint Isidore de Séville, l'un des grands docteurs de l'Église d'Espagne, a laissé de belles pages sur saint Joseph dans ses écrits. Il voit en lui le modèle par excellence des pères de famille.

Isidore écrit : "Joseph est le modèle de tous les pères. Il a exercé sa paternité avec une autorité douce, une présence discrète, un amour sans conditions. Il n'a pas cherché à dominer, mais à servir. Il n'a pas imposé sa volonté, mais il a guidé avec sagesse."

Le saint évêque développe les qualités de ce père idéal : "Joseph est un père qui protège sans étouffer, qui éduque sans contraindre, qui aime sans posséder. Il laisse Jésus grandir, s'éloigner, accomplir sa mission. Il accepte de s'effacer pour que l'enfant devienne adulte."

Isidore voit en Joseph un modèle pour les pères d'aujourd'hui : "Dans un monde où la paternité est souvent fragilisée, Joseph est un guide sûr. Il apprend aux pères à être présents sans être envahissants, à guider sans imposer, à aimer sans condition."

Le saint docteur conclut : "Bienheureux le père qui, comme Joseph, sait être un père selon le cœur de Dieu. Bienheureuse la famille qui, comme celle de Nazareth, vit dans l'amour, le respect et la paix."

"Joseph, père virginal de Jésus, priez pour tous les pères du monde !" (Saint Isidore)
      ''',
      categorie: 'Saints',
      date: 'VIIe siècle',
      imageUrl: 'assets/images/isidore.jpg',
      references: ['Étymologies', 'Sentences'],
    ),
    
    Enseignement(
      id: 'joseph_bonaventure',
      titre: 'Joseph, le père dans l\'ombre',
      auteur: 'Saint Bonaventure',
      extrait: 'Joseph a vécu dans l\'ombre pour que Jésus soit dans la lumière...',
      contenu: '''
Saint Bonaventure, le docteur séraphique, a médité sur la place de Joseph dans le mystère de l'Incarnation. Il voit en lui le modèle de ceux qui acceptent de vivre dans l'ombre pour que d'autres rayonnent.

Bonaventure écrit : "Joseph a vécu dans l'ombre pour que Jésus soit dans la lumière. Il a accepté de n'être pas au premier plan, de n'être pas connu, de n'être pas reconnu. Son seul désir était que Jésus grandisse et que sa mission s'accomplisse."

Le théologien franciscain développe ce qu'il appelle "la kénose de Joseph" : "Comme Jésus s'est anéanti pour notre salut, Joseph s'est anéanti pour Jésus. Il a renoncé à tout : à sa réputation, à sa carrière, à ses projets. Il n'a vécu que pour servir le mystère qui le dépassait."

Bonaventure voit dans cette attitude un modèle pour tous les chrétiens : "Nous sommes tous appelés à vivre cette paternité spirituelle, à enfanter le Christ dans les âmes, à le faire grandir par notre témoignage, notre prière, notre amour. Comme Joseph, nous devons accepter de travailler dans l'ombre, sans chercher à paraître."

Le saint docteur conclut : "Heureux ceux qui, comme Joseph, acceptent de vivre cachés pour que le Christ soit manifesté. Heureux ceux qui ne cherchent pas leur propre gloire mais celle de Dieu. Heureux ceux qui savent s'effacer pour que d'autres grandissent."

"Joseph, père dans l'ombre, apprenez-nous l'humilité et le service discret !" (Saint Bonaventure)
      ''',
      categorie: 'Saints',
      date: 'XIIIe siècle',
      imageUrl: 'assets/images/bonaventure.jpg',
      references: ['Méditations sur la vie du Christ'],
    ),
    
    // ENSEIGNEMENTS CONTEMPORAINS
    Enseignement(
      id: 'joseph_sheehan',
      titre: 'Joseph, le patron des émigrés',
      auteur: 'Mgr Shawn Sheehan',
      extrait: 'Joseph a connu l\'exil et peut comprendre ceux qui fuient leur terre...',
      contenu: '''
Dans son enseignement sur saint Joseph, Mgr Shawn Sheehan, évêque de Lublin, souligne combien Joseph peut être proche des migrants et des réfugiés d'aujourd'hui.

L'évêque rappelle : "Joseph a connu l'exil. Il a dû fuir en Égypte avec Marie et l'Enfant pour échapper à la persécution d'Hérode. Il a connu la peur, l'incertitude, la précarité. Il a dû tout quitter, sa maison, son travail, ses proches, pour recommencer une nouvelle vie dans un pays étranger."

Mgr Sheehan développe ce thème : "Aujourd'hui, des millions de personnes vivent le même drame. Ils fuient la guerre, la persécution, la misère. Ils cherchent une terre d'accueil, un endroit où vivre en paix. Joseph est leur protecteur. Il comprend leur détresse, leur peur, leur espoir."

L'évêque invite les fidèles à accueillir les migrants : "En accueillant un étranger, c'est Joseph que nous accueillons. En tendant la main à un réfugié, c'est à Joseph que nous la tendons. Il a connu l'exil, il est proche de tous ceux qui sont déplacés."

Il conclut : "Que saint Joseph, l'exilé d'Égypte, protège tous les migrants et réfugiés du monde. Qu'il leur donne la force de tenir dans l'épreuve et qu'il ouvre les cœurs à l'accueil. Qu'il fasse de chaque terre d'accueil une nouvelle Nazareth où ils puissent vivre en paix."
      ''',
      categorie: 'Enseignements contemporains',
      date: 'XXIe siècle',
      imageUrl: 'assets/images/sheehan.jpg',
      references: ['Catéchèses sur saint Joseph'],
    ),
    
    Enseignement(
      id: 'joseph_cantalamessa',
      titre: 'Joseph, l\'homme du songe',
      auteur: 'Père Raniero Cantalamessa',
      extrait: 'Dieu parle à Joseph dans les songes, comme il parle à chacun de nous dans le silence de la nuit...',
      contenu: '''
Le Père Raniero Cantalamessa, prédicateur de la Maison pontificale, a prononcé de magnifiques homélies sur saint Joseph. Il s'arrête particulièrement sur les songes par lesquels Dieu guide Joseph.

Cantalamessa explique : "Dieu parle à Joseph dans les songes. Quatre fois, dans l'Évangile, Joseph reçoit un message de Dieu en dormant. C'est sa façon de communiquer avec cet homme juste, silencieux, intérieur."

Le prédicateur développe : "Joseph est un homme du silence et de l'écoute. Dans le silence de la nuit, quand les bruits du jour se taisent, il est capable d'entendre la voix de Dieu. Son cœur est suffisamment apaisé, suffisamment détaché des agitations du monde, pour percevoir ce que Dieu lui dit."

Cantalamessa voit dans cette attitude un modèle pour notre vie spirituelle : "Nous aussi, nous avons besoin de ce silence intérieur pour entendre Dieu. Trop de bruits, trop d'activités, trop de paroles nous empêchent de percevoir sa voix douce et légère. Joseph nous apprend à faire taire en nous les agitations inutiles pour mieux écouter."

Le prédicateur ajoute : "Dieu ne parle pas seulement à Joseph pour lui donner des instructions. Il lui parle pour le rassurer : 'Ne crains pas'. C'est la parole que Dieu adresse à tous ceux qu'il appelle. Il ne demande pas à Joseph de comprendre, mais de faire confiance."

"Joseph, homme des songes, apprenez-nous à écouter Dieu dans le silence de notre cœur !" (Père Cantalamessa)
      ''',
      categorie: 'Enseignements contemporains',
      date: 'XXIe siècle',
      imageUrl: 'assets/images/cantalamessa.jpg',
      references: ['Homélies', 'Méditations'],
    ),
    
    Enseignement(
      id: 'joseph_martini',
      titre: 'Joseph, le père du silence',
      auteur: 'Cardinal Carlo Maria Martini',
      extrait: 'Joseph nous apprend la valeur du silence dans un monde de bruit...',
      contenu: '''
Le Cardinal Carlo Maria Martini, archevêque de Milan, a souvent médité sur la figure de Joseph dans ses exercices spirituels. Il voit en lui le maître du silence intérieur.

Martini écrit : "Joseph nous apprend la valeur du silence dans un monde de bruit. Il ne parle pas, mais il agit. Il ne discute pas, mais il obéit. Il ne théorise pas, mais il vit. Son silence est éloquent : il dit l'essentiel."

Le cardinal développe : "Ce silence de Joseph n'est pas une absence, mais une présence. Il est pleinement présent à Dieu, à Marie, à Jésus. Il écoute, il contemple, il aime. Son silence est habité par la Parole qu'il porte."

Martini voit dans ce silence un chemin de sainteté : "La sainteté de Joseph n'est pas dans les paroles, mais dans les actes. Il ne prêche pas, il vit. Il ne discourt pas, il aime. Sa vie est un sermon silencieux, mais plus puissant que tous les discours."

Le cardinal conclut : "Nous avons tant besoin de ce silence aujourd'hui. Trop de paroles vides, trop de bruits inutiles nous empêchent de vivre l'essentiel. Joseph nous rappelle que ce qui compte, ce n'est pas ce qu'on dit, mais ce qu'on est. Ce n'est pas ce qu'on proclame, mais ce qu'on vit."

"Joseph, père du silence, apprenez-nous à faire taire en nous les bruits du monde pour mieux entendre Dieu !" (Cardinal Martini)
      ''',
      categorie: 'Enseignements contemporains',
      date: 'XXe siècle',
      imageUrl: 'assets/images/martini.jpg',
      references: ['Exercices spirituels'],
    ),
    
    // ENSEIGNEMENTS SUR LES VERTUS
    Enseignement(
      id: 'joseph_vertus_foi',
      titre: 'La foi de Joseph',
      auteur: 'Tradition',
      extrait: 'Joseph a cru sans voir, il a obéi sans comprendre...',
      contenu: '''
La foi de Joseph est exemplaire à tous égards. Dans l'Évangile, il ne demande jamais de signes, ne pose jamais de conditions, ne discute jamais les ordres de Dieu. Il croit et il obéit.

Cette foi est d'autant plus admirable que les situations dans lesquelles Joseph se trouve sont humainement incompréhensibles. Une vierge qui enfante, un Dieu qui devient enfant, une fuite précipitée en Égypte, un retour discret à Nazareth... Tout cela dépasse la raison humaine. Mais Joseph ne raisonne pas, il fait confiance.

La foi de Joseph est une foi nue, dépouillée de tout appui sensible. Il ne voit pas, il ne comprend pas, il ne sait pas. Il marche dans l'obscurité, mais il marche avec confiance. Il s'appuie non sur ce qu'il voit, mais sur Celui qui l'appelle.

Cette foi est aussi une foi agissante. Joseph ne se contente pas de croire, il agit en conséquence. Il prend Marie chez lui, il part en Égypte, il revient à Nazareth. Sa foi se traduit en actes concrets, en décisions quotidiennes.

Enfin, la foi de Joseph est une foi persévérante. Pendant trente ans, il vit dans l'obscurité de Nazareth, sans signes particuliers, sans manifestations extraordinaires. Il continue de croire, de faire confiance, d'espérer. Rien ne semble se passer, mais il est là, fidèle.

"Bienheureux celui qui, comme Joseph, croit sans voir, obéit sans comprendre, persévère sans se lasser !"
      ''',
      categorie: 'Vertus',
      date: 'Tradition',
      imageUrl: 'assets/images/foi.jpg',
      references: ['Méditations sur les vertus de Joseph'],
    ),
    
    Enseignement(
      id: 'joseph_vertus_esperance',
      titre: 'L\'espérance de Joseph',
      auteur: 'Tradition',
      extrait: 'Joseph espère contre toute espérance...',
      contenu: '''
L'espérance de Joseph est mise à l'épreuve tout au long de sa vie. Dès le début, il doit espérer contre toute évidence que Marie est vraiment enceinte de l'Esprit Saint. Il espère que Dieu protégera l'enfant malgré la menace d'Hérode. Il espère qu'ils trouveront refuge en Égypte. Il espère que Dieu lui indiquera le moment du retour.

Cette espérance n'est pas un optimisme naïf. C'est une vertu théologale, un don de Dieu qui permet de garder confiance même quand tout semble perdu. Joseph espère non pas parce que les choses vont bien, mais parce que Dieu est fidèle.

L'espérance de Joseph est aussi une espérance pour son peuple. Il sait que Jésus est le Messie attendu, celui qui sauvera Israël. Il espère que ce salut s'accomplira, même s'il ne verra pas lui-même son accomplissement.

Enfin, l'espérance de Joseph est une espérance pour l'humanité entière. Il porte en lui la certitude que Dieu ne laissera pas l'homme seul, qu'il viendra le sauver, qu'il établira son règne de justice et de paix.

"Joseph, homme d'espérance, apprenez-nous à garder confiance même dans les nuits les plus sombres. Rappelez-nous que Dieu ne manque jamais à ses promesses."
      ''',
      categorie: 'Vertus',
      date: 'Tradition',
      imageUrl: 'assets/images/esperance.jpg',
      references: ['Méditations sur les vertus de Joseph'],
    ),
    
    Enseignement(
      id: 'joseph_vertus_charite',
      titre: 'La charité de Joseph',
      auteur: 'Tradition',
      extrait: 'Joseph aime comme Dieu aime...',
      contenu: '''
La charité de Joseph est le sommet de toutes ses vertus. Il aime Marie d'un amour pur et désintéressé. Il aime Jésus d'un amour paternel unique. Il aime Dieu d'un amour filial parfait.

Cet amour est d'abord un amour de service. Toute la vie de Joseph est au service de Jésus et Marie. Il travaille pour eux, il les protège, il les guide. Il ne cherche jamais son intérêt propre, mais toujours le leur.

La charité de Joseph est aussi un amour de don total. Il se donne sans compter, sans réserve, sans retour sur lui-même. Il accepte de tout quitter, de tout risquer, de tout sacrifier pour ceux qu'il aime.

Cet amour est encore un amour de présence. Joseph est là, toujours présent, toujours disponible, toujours attentif. Il ne s'absente pas, ne se dérobe pas, ne fuit pas ses responsabilités. Il est le roc sur lequel la Sainte Famille peut s'appuyer.

Enfin, l'amour de Joseph est un amour qui pardonne. Il aurait pu en vouloir à Marie, se sentir trahi, abandonné. Au lieu de cela, il accueille, il comprend, il pardonne. Son cœur est assez grand pour dépasser les blessures.

"Joseph, modèle de charité, apprenez-nous à aimer comme vous aimez : sans conditions, sans limites, sans retour sur nous-mêmes."
      ''',
      categorie: 'Vertus',
      date: 'Tradition',
      imageUrl: 'assets/images/charite.jpg',
      references: ['Méditations sur les vertus de Joseph'],
    ),
  ];

  static List<Enseignement> getEnseignementsParCategorie(String categorie) {
    return tousLesEnseignements
        .where((e) => e.categorie == categorie)
        .toList();
  }

  static List<Enseignement> getFavoris() {
    return tousLesEnseignements.where((e) => e.estFavori).toList();
  }

  static Enseignement? getEnseignementParId(String id) {
    try {
      return tousLesEnseignements.firstWhere((e) => e.id == id);
    } catch (e) {
      return null;
    }
  }
}