// lib/data/neuvaines_data.dart
import 'package:joe/models/neuvaine_model.dart';

class NeuvainesData {
  static List<Neuvaine> toutesLesNeuvaines = [
    // NEUVAINE 1 : Neuvaine de confiance à Saint Joseph
    Neuvaine(
      id: 'neuvaine_confiance',
      titre: '''Neuvaine de confiance 
      à Saint Joseph''',
      description: '9 jours pour grandir dans la confiance en l\'intercession puissante de Saint Joseph, celui qui n\'a jamais refusé une grâce à ceux qui l\'invoquent.',
      imageUrl: 'assets/images/neuvaine_confiance.jpg',
      couleurHex: '0xFF8B4513', // Marron
      jours: [
        JourNeuvaine(
          numero: 1,
          titre: 'La confiance en Dieu',
          verset: 'Matthieu 1, 18-24',
          meditation: '''
Joseph est un homme de confiance. Il fait confiance à Dieu quand l'ange lui apparaît en songe. Il fait confiance à Marie. Il accepte de prendre sur lui un mystère qui le dépasse.

Cette confiance n'est pas aveugle, elle est fondée sur sa foi profonde en Dieu. Joseph nous apprend à faire confiance même quand nous ne comprenons pas tout.

Méditons aujourd'hui sur les moments où nous avons du mal à faire confiance. Peut-être traversons-nous des situations incompréhensibles, des épreuves qui nous dépassent. Joseph nous montre le chemin : s'abandonner entre les mains de Dieu.

Demandons à Saint Joseph la grâce de grandir dans la confiance, de savoir nous abandonner à la Providence divine comme il l'a fait si parfaitement à Nazareth.''',
          priere: '''
Saint Joseph, homme de confiance,
vous qui avez su vous abandonner totalement à la volonté de Dieu,
apprenez-moi à faire confiance dans les moments difficiles.

Quand je ne comprends pas le chemin,
quand les épreuves semblent trop lourdes,
obtenez-moi la grâce de m'abandonner
entre les mains de Dieu comme vous l'avez fait.

Aidez-moi à croire que Dieu écrit droit
dans les lignes courbes de ma vie.
Que ma confiance en Lui devienne inébranlable,
même dans les nuits les plus sombres.

Saint Joseph, priez pour moi.
Amen.''',
        ),
        JourNeuvaine(
          numero: 2,
          titre: 'Le silence et l\'écoute',
          verset: 'Matthieu 2, 13-15',
          meditation: '''
Joseph est un homme de silence et d'écoute. Dans l'Évangile, il ne prononce pas une seule parole. Pourtant, il agit constamment en réponse aux messages qu'il reçoit en songe.

Son silence n'est pas une absence, mais une présence attentive. Il sait écouter Dieu dans le silence de la nuit et dans les événements de chaque jour. Il ne parle pas, mais il agit avec promptitude et obéissance.

Notre monde est bruyant, rempli de paroles souvent vaines. Nous avons peur du silence car il nous confronte à nous-mêmes. Pourtant, c'est dans le silence que Dieu parle au cœur.

Apprenons de Joseph à cultiver le silence dans nos vies. Pas un silence vide, mais un silence habité par la présence de Dieu, un silence qui permet d'entendre Sa voix douce et légère.''',
          priere: '''
Saint Joseph, homme de silence,
vous qui saviez écouter la voix de Dieu
dans le calme de la nuit et la simplicité du quotidien,

Apprenez-moi à faire taire en moi
les bruits du monde et les agitations inutiles
pour mieux entendre ce que Dieu veut me dire.

Dans le silence de mon cœur,
aidez-moi à discerner la volonté de Dieu
et à trouver la paix véritable.

Que mon silence ne soit pas fuite,
mais présence aimante à Dieu et aux autres,
comme le vôtre à Nazareth.
Saint Joseph, priez pour moi.
Amen.''',
        ),
        JourNeuvaine(
          numero: 3,
          titre: 'L\'obéissance prompte',
          verset: 'Matthieu 2, 13-15',
          meditation: '''
Joseph obéit sans délai. Quand l'ange lui dit de fuir en Égypte, il se lève "dès la nuit" et part. Il ne demande pas d'explications, ne cherche pas à négocier. Il obéit avec une promptitude admirable.

Cette obéissance n'est pas servile, elle est filiale. Joseph sait que Dieu ne lui veut que du bien. Il fait confiance à Celui qui guide ses pas, même quand le chemin semble périlleux.

Comme Joseph, nous sommes parfois appelés à obéir sans comprendre. Dieu nous demande des choses qui dépassent notre raison. L'obéissance de Joseph nous apprend que la vraie liberté consiste à se soumettre à la volonté de Celui qui nous aime.

Méditons sur notre propre obéissance à Dieu. Sommes-nous prompts à exécuter Sa volonté, ou cherchons-nous à temporiser, à négocier ?''',
          priere: '''
Saint Joseph, modèle d'obéissance,
vous qui avez répondu sans hésiter à l'appel de Dieu,
obtenez-moi la grâce d'une obéissance prompte et joyeuse.

Quand Dieu me parle par sa Parole,
par les événements ou par mes frères,
aidez-moi à répondre généreusement,
sans chercher à comprendre ni à négocier.

Que mon obéissance soit filiale,
animée par la confiance et l'amour.
Apprenez-moi à me lever "dès la nuit"
pour accomplir ce que Dieu attend de moi.

Saint Joseph, priez pour moi.
Amen.''',
        ),
        JourNeuvaine(
          numero: 4,
          titre: 'La protection de la Sainte Famille',
          verset: 'Matthieu 2, 13-15',
          meditation: '''
Joseph est le protecteur de la Sainte Famille. C'est lui que Dieu a choisi pour veiller sur Marie et sur Jésus. Dans la fuite en Égypte, c'est lui qui guide et protège les siens.

Cette protection n'est pas seulement matérielle. Joseph protège aussi le mystère de l'Incarnation. Il garde le silence sur ce qu'il sait, il préserve l'intimité de la Sainte Famille des regards indiscrets.

Aujourd'hui, Joseph continue de protéger l'Église, la grande famille des enfants de Dieu. Il protège aussi chaque famille, chaque foyer. Il est le gardien silencieux mais efficace de tous ceux qui se confient à lui.

Confions à Saint Joseph notre famille, nos proches, tous ceux qui nous sont chers. Demandons-lui de veiller sur eux avec la même sollicitude qu'il a eue pour Jésus et Marie.''',
          priere: '''
Saint Joseph, protecteur de la Sainte Famille,
vous qui avez veillé sur Jésus et Marie avec tant d'amour,
étendez votre protection sur ma famille et sur tous mes proches.

Protégez-nous des dangers visibles et invisibles.
Gardez-nous unis dans l'amour et la paix.
Que notre foyer soit, comme celui de Nazareth,
un lieu de tendresse, de travail et de prière.

Soyez le gardien de nos enfants,
le soutien de nos parents,
la force de ceux qui souffrent.

Saint Joseph, priez pour nous.
Amen.''',
        ),
        JourNeuvaine(
          numero: 5,
          titre: 'Le travail humble',
          verset: 'Matthieu 13, 55',
          meditation: '''
Joseph est un travailleur. Il est connu à Nazareth comme "le charpentier". Chaque jour, il exerce son métier avec conscience et compétence. Il apprend son art à Jésus, lui transmettant le goût du travail bien fait.

Le travail de Joseph n'a rien d'extraordinaire aux yeux des hommes. C'est un travail humble, obscur, répétitif. Pourtant, c'est ce travail qui fait vivre la Sainte Famille et qui prépare Jésus à sa mission.

Dieu sanctifie le travail humble par Joseph. Il nous montre que la sainteté se trouve aussi dans l'atelier, dans l'usine, dans le bureau. Ce qui compte, ce n'est pas la nature du travail, mais l'amour avec lequel on l'accomplit.

Méditons sur notre propre travail. L'offrons-nous à Dieu ? Y mettons-nous tout notre cœur, comme Joseph ?''',
          priere: '''
Saint Joseph, modèle des travailleurs,
vous qui avez sanctifié le travail humble de vos mains,
apprenez-moi à donner tout mon cœur à mon travail quotidien.

Que je voie dans mon travail une participation
à l'œuvre créatrice de Dieu.
Aidez-moi à l'accomplir avec honnêteté et compétence,
pour le bien de ma famille et de la société.

Si je suis sans travail ou dans la précarité,
soyez mon soutien et mon intercesseur.
Ouvrez les portes qui doivent s'ouvrir
et donnez-moi la force de persévérer.

Saint Joseph, priez pour nous.
Amen.''',
        ),
        JourNeuvaine(
          numero: 6,
          titre: 'La paternité aimante',
          verset: 'Luc 2, 41-52',
          meditation: '''
Joseph est un père pour Jésus. Non pas un père biologique, mais un père véritable. Il l'aime, l'éduque, le protège. Il lui apprend à prier, à travailler, à vivre en homme.

La paternité de Joseph est discrète mais réelle. Il est présent, disponible, attentif. Quand Jésus est perdu à Jérusalem, Joseph partage l'inquiétude de Marie. Quand ils le retrouvent au Temple, Joseph accueille le mystère de son enfant qui grandit dans la sagesse.

Aujourd'hui, beaucoup de pères sont absents, dépassés ou fragilisés. Joseph est un modèle pour tous. Il montre qu'être père, c'est aimer, protéger, éduquer, et aussi savoir s'effacer pour laisser l'enfant grandir.

Prions pour tous les pères du monde. Demandons à Saint Joseph de les inspirer et de les soutenir dans leur mission si importante.''',
          priere: '''
Saint Joseph, père aimant,
vous qui avez entouré Jésus de tant de tendresse et de soins,
veillez sur tous les pères du monde.

Donnez-leur un cœur grand et généreux,
capable d'aimer sans posséder,
de guider sans contraindre,
de protéger sans étouffer.

Soutenez les pères qui traversent des difficultés,
ceux qui sont seuls, fatigués, découragés.
Qu'ils trouvent en vous un modèle et un intercesseur.

Béni soyez-vous, Joseph,
d'avoir été pour Jésus un père selon le cœur de Dieu.
Saint Joseph, priez pour nous.
Amen.''',
        ),
        JourNeuvaine(
          numero: 7,
          titre: 'La vie cachée',
          verset: 'Luc 2, 51-52',
          meditation: '''
Joseph vit dans l'ombre. Pendant trente ans, il mène à Nazareth une vie ordinaire, sans éclat. Il n'écrit pas, ne prêche pas, ne fait pas de miracles. Il se contente d'être là, fidèlement, jour après jour.

Cette vie cachée est pourtant le sommet de la sainteté. Joseph ne cherche pas à paraître, il cherche à être. Il est pleinement présent à Dieu, à Marie, à Jésus. Son amour silencieux est plus éloquent que tous les discours.

Nous aussi, nous vivons pour la plupart une vie cachée. Peu d'entre nous seront célèbres ou feront de grandes choses. Mais la sainteté n'est pas là. Elle est dans la fidélité aux petites choses, dans l'amour offert silencieusement chaque jour.

Méditons sur la valeur de notre vie cachée. Offrons à Dieu nos gestes quotidiens, nos travaux obscurs, nos joies simples. Comme Joseph, faisons de notre vie un chef-d'œuvre d'amour discret.''',
          priere: '''
Saint Joseph, homme de la vie cachée,
vous qui avez vécu dans l'ombre à Nazareth,
apprenez-moi à valoriser les petits riens de chaque jour.

Aidez-moi à comprendre que la sainteté
ne se trouve pas dans les grandes choses,
mais dans l'amour fidèle offert dans le quotidien.

Que je ne cherche pas à paraître,
mais à être pleinement présent à Dieu et aux autres.
Que ma vie cachée soit, comme la vôtre,
un chef-d'œuvre d'amour silencieux.

Saint Joseph, priez pour moi.
Amen.''',
        ),
        JourNeuvaine(
          numero: 8,
          titre: 'L\'accueil de Marie',
          verset: 'Matthieu 1, 18-24',
          meditation: '''
Joseph accueille Marie. Quand il apprend qu'elle est enceinte, il pourrait la répudier, la livrer à la honte publique. Mais parce qu'il est juste et bon, il décide de la répudier secrètement pour la protéger.

Puis l'ange lui parle en songe : "Joseph, fils de David, ne crains pas de prendre chez toi Marie ton épouse." Et Joseph obéit. Il accueille Marie chez lui, il l'aime, il la protège. Il devient l'époux de celle qui est la Mère de Dieu.

Cet accueil de Marie est un acte de foi et d'amour. Joseph ne comprend pas tout, mais il fait confiance. Il ouvre sa maison et son cœur à celle que Dieu lui confie.

Sommes-nous, comme Joseph, des personnes qui accueillent ? Accueillons-nous Marie dans notre vie ? Accueillons-nous ceux que Dieu met sur notre route ?''',
          priere: '''
Saint Joseph, vous qui avez accueilli Marie avec tant d'amour,
apprenez-moi à accueillir ceux que Dieu met sur ma route.

Aidez-moi à ouvrir ma maison et mon cœur,
à être disponible et généreux,
à aimer sans conditions comme vous avez aimé.

Apprenez-moi surtout à accueillir Marie
dans ma vie, à l'aimer comme une mère,
à me confier à elle comme vous l'avez fait.

Que mon cœur soit toujours ouvert
à la présence de Dieu et des frères.

Saint Joseph, priez pour moi.
Amen.''',
        ),
        JourNeuvaine(
          numero: 9,
          titre: 'L\'intercession puissante',
          verset: 'Jean 2, 1-11',
          meditation: '''
La tradition nous dit que Joseph est un intercesseur puissant. Sainte Thérèse de Lisieux témoigne : "Je n'ai jamais rien demandé à saint Joseph sans être exaucée." Pourquoi tant de puissance ?

Joseph a été proche de Jésus comme personne après Marie. Il l'a porté dans ses bras, il l'a nourri, il l'a éduqué. Il connaît son cœur mieux que quiconque. Comment Jésus pourrait-il rien refuser à celui qui a tant fait pour lui ?

C'est pourquoi nous pouvons nous tourner avec confiance vers Joseph. Il est le père qui comprend nos besoins, le protecteur qui veille sur nous, l'intercesseur qui présente nos requêtes à Jésus.

Au dernier jour de cette neuvaine, confions à Saint Joseph toutes nos intentions. Mettons notre vie entre ses mains avec la certitude qu'il nous exaucera, selon la volonté de Dieu.''',
          priere: '''
Saint Joseph, intercesseur puissant,
vous qui n'avez jamais refusé une grâce à ceux qui vous invoquent,
je me tourne vers vous avec confiance.

Présentez à Jésus mes demandes,
vous qui l'avez porté dans vos bras.
Parlez-lui de moi, vous qui connaissez si bien son cœur.

Je vous confie toutes mes intentions,
celles que je porte dans mon cœur,
celles que je n'ose même pas formuler.
Obtenez-moi la grâce dont j'ai le plus besoin.

Saint Joseph, priez pour moi maintenant
et à l'heure de ma mort. Amen.''',
        ),
      ],
    ),

    // NEUVAINE 2 : Neuvaine pour le travail
    Neuvaine(
      id: 'neuvaine_travail',
      titre: 'Neuvaine pour le travail',
      description: '9 jours pour confier votre situation professionnelle à Saint Joseph, modèle des travailleurs et soutien de ceux qui cherchent un emploi.',
      imageUrl: 'assets/images/neuvaine_travail.jpg',
      couleurHex: '0xFFDAA520', // Or
      jours: [
        JourNeuvaine(
          numero: 1,
          titre: 'Joseph, le travailleur',
          verset: 'Matthieu 13, 55',
          meditation: '''
"N'est-ce pas le fils du charpentier ?" demandaient les habitants de Nazareth. Joseph était connu comme un artisan, un travailleur manuel. Il exerçait son métier avec conscience et compétence, gagnant sa vie et celle de la Sainte Famille par le travail de ses mains.

Le travail de Joseph n'avait rien d'extraordinaire. C'était un travail humble, parfois dur, certainement répétitif. Mais Joseph y mettait tout son cœur, voyant dans son atelier le lieu où il pouvait aimer Dieu et sa famille concrètement.

Dieu a choisi de passer trente ans dans cet atelier. Il a voulu partager la condition des travailleurs, sanctifiant par sa présence le travail humain. Avec Joseph, il a connu la fatigue, la poussière, les mains calleuses.

Aujourd'hui, le travail est souvent source de stress, de précarité, parfois de souffrance. Joseph nous rappelle sa dignité fondamentale. Le travail n'est pas une malédiction mais une participation à l'œuvre créatrice de Dieu.''',
          priere: '''
Saint Joseph, travailleur de Nazareth,
vous qui avez partagé la condition des hommes,
je vous confie ma situation professionnelle.

Béni soyez-vous d'avoir sanctifié le travail
par votre vie cachée à Nazareth.
Apprenez-moi à donner tout mon cœur à mon travail,
quel qu'il soit.

Aidez-moi à y voir non une corvée
mais une participation à l'œuvre de Dieu
et un service rendu à mes frères.

Saint Joseph, priez pour moi.
Amen.''',
        ),
        JourNeuvaine(
          numero: 2,
          titre: 'La dignité du travail',
          verset: 'Genèse 2, 15',
          meditation: '''
Dès les origines, Dieu a confié à l'homme la mission de travailler : "Le Seigneur Dieu prit l'homme et le plaça dans le jardin d'Éden pour le cultiver et le garder." Le travail fait partie du plan de Dieu sur l'humanité.

Par le travail, l'homme participe à l'œuvre créatrice de Dieu. Il transforme le monde, le rend plus beau, plus humain. Il subvient à ses besoins et à ceux de sa famille. Il contribue au bien commun.

Le travail est donc un droit et un devoir. Tout homme a le droit de travailler pour vivre dignement. Tout homme a le devoir de contribuer par son travail à la société. Malheureusement, ce droit est souvent bafoué par le chômage, la précarité, l'exploitation.

Saint Joseph, qui a connu la nécessité de travailler pour faire vivre sa famille, comprend nos difficultés. Il est proche de ceux qui cherchent un emploi, de ceux qui peinent dans des conditions difficiles, de ceux qui sont exploités.''',
          priere: '''
Saint Joseph, vous qui avez connu la dignité du travail,
je vous confie tous ceux qui sont sans emploi,
ceux qui cherchent un travail sans le trouver,
ceux qui vivent dans la précarité.

Obtenez-leur la grâce de trouver un emploi digne,
qui leur permette de vivre et de faire vivre leur famille.
Soutenez ceux qui sont exploités ou mal payés.
Donnez-leur le courage de lutter pour leurs droits.

Saint Joseph, priez pour tous les travailleurs du monde.
Amen.''',
        ),
        JourNeuvaine(
          numero: 3,
          titre: 'Le chômage et la précarité',
          verset: 'Matthieu 20, 1-16',
          meditation: '''
La parabole des ouvriers de la onzième heure résonne particulièrement pour ceux qui cherchent du travail. Ces ouvriers ont attendu toute la journée sur la place, sans que personne ne les embauche. Ils connaissent l'angoisse de rentrer chez eux les mains vides, de ne pouvoir nourrir leur famille.

Le chômage est une épreuve terrible. Il atteint la personne dans sa dignité. Il engendre l'angoisse du lendemain, le sentiment d'inutilité, parfois la honte. La précarité use, fragilise, décourage.

Joseph a connu l'inquiétude du lendemain. Quand l'ange lui dit de fuir en Égypte, il part sans savoir comment il fera vivre les siens dans un pays étranger. Mais il fait confiance à la Providence. Dieu ne l'abandonne pas.

Si vous traversez le chômage ou la précarité, confiez votre angoisse à Joseph. Il comprend votre détresse. Il intercède pour vous auprès de Dieu. Ne perdez pas confiance : l'heure de Dieu n'est pas la nôtre, mais elle sonne toujours au moment voulu.''',
          priere: '''
Saint Joseph, vous qui avez connu l'inquiétude du lendemain,
je vous confie tous ceux qui souffrent du chômage et de la précarité.

Donnez-leur la force de tenir dans l'épreuve.
Préservez-les du découragement et du désespoir.
Ouvrez devant eux des portes,
inspirez à ceux qui peuvent les aider
des paroles et des gestes de solidarité.

Obtenez-leur un travail digne,
qui leur rende leur joie de vivre
et leur permette de subvenir aux besoins des leurs.

Saint Joseph, priez pour eux.
Amen.''',
        ),
        JourNeuvaine(
          numero: 4,
          titre: 'L\'épreuve de l\'exil',
          verset: 'Matthieu 2, 13-15',
          meditation: '''
L'Évangile raconte que Joseph dut fuir en Égypte avec Marie et l'Enfant pour échapper à la fureur d'Hérode. Il a connu l'exil, l'éloignement de sa terre, la nécessité de tout recommencer dans un pays étranger.

Combien de travailleurs aujourd'hui connaissent cet exil ! Ils quittent leur pays pour trouver du travail ailleurs, loin des leurs, dans une culture différente. D'autres sont migrants, réfugiés, chassés par la guerre ou la misère.

Joseph est leur protecteur. Il a connu la condition d'étranger, la précarité, la nécessité de se faire accepter. Il comprend leurs difficultés, leurs peurs, leur nostalgie. Il intercède pour eux.

Si vous êtes loin de votre pays pour le travail, confiez votre solitude à Joseph. Si vous accueillez des travailleurs étrangers, pensez à ce que Joseph a vécu en Égypte et soyez pour eux des frères.''',
          priere: '''
Saint Joseph, exilé en Égypte,
je vous confie tous ceux qui sont loin de leur pays
pour gagner leur vie ou fuir la misère.

Soyez leur soutien dans la solitude.
Aidez-les à trouver des frères sur leur route.
Protégez-les des exploiteurs et des méchants.

Je vous confie aussi les migrants et les réfugiés.
Qu'ils trouvent partout des cœurs accueillants,
des mains tendues,
des frères qui les aident à se reconstruire.

Saint Joseph, priez pour eux.
Amen.''',
        ),
        JourNeuvaine(
          numero: 5,
          titre: 'L\'équilibre vie professionnelle et familiale',
          verset: 'Luc 2, 51-52',
          meditation: '''
À Nazareth, Joseph vivait en famille. Il travaillait, mais il rentrait chaque soir auprès de Marie et de Jésus. Il prenait le temps de prier avec eux, de partager les repas, de vivre la vie quotidienne.

Aujourd'hui, beaucoup peinent à trouver cet équilibre. Le travail envahit tout, empiète sur la vie familiale. Les temps de transport, les horaires décalés, les sollicitations professionnelles constantes éloignent les conjoints, privent les enfants de la présence de leurs parents.

D'autres, au contraire, aimeraient travailler plus mais n'en ont pas la possibilité. L'équilibre est difficile à trouver. Joseph nous apprend que le travail est au service de la famille, pas l'inverse.

Il nous invite à réfléchir à nos priorités. Notre travail nous permet-il de vivre, ou nous empêche-t-il de vivre ? Sommes-nous présents à notre famille ? Savons-nous poser des limites pour protéger l'essentiel ?''',
          priere: '''
Saint Joseph, vous qui avez su concilier travail et vie familiale,
apprenez-moi à trouver le juste équilibre.

Aidez-moi à organiser mon temps
pour être vraiment présent à ma famille.
Que mon travail ne nuise pas à mes proches,
mais soit au service de leur épanouissement.

Donnez-moi la sagesse de poser des limites,
de protéger les moments essentiels,
de ne pas me laisser dévorer par le travail.

Saint Joseph, priez pour ma famille.
Amen.''',
        ),
        JourNeuvaine(
          numero: 6,
          titre: 'Le travail bien fait',
          verset: 'Colossiens 3, 23',
          meditation: '''
Saint Paul écrit : "Tout ce que vous faites, faites-le de bon cœur, comme pour le Seigneur et non pour des hommes." Joseph a vécu cette parole avant même qu'elle soit écrite. Dans son atelier, il faisait tout de son mieux, pour la gloire de Dieu.

Le travail bien fait a une valeur spirituelle. Il est offrande à Dieu, service des frères. Un meuble bien fabriqué, un service bien rendu, un travail accompli avec soin : tout cela est agréable à Dieu.

Mais combien de fois sommes-nous tentés de faire au plus vite, de bâcler, de tricher ? Le laisser-aller, la médiocrité, la négligence sont contraires à l'esprit de Joseph.

Aujourd'hui, méditons sur la qualité de notre travail. Le faisons-nous avec amour, avec soin, avec le souci de bien faire ? Ou cherchons-nous seulement à gagner de l'argent, à en faire le moins possible ?''',
          priere: '''
Saint Joseph, artisan soigneux,
vous qui faisiez tout avec amour et perfection,
apprenez-moi à travailler avec conscience.

Que je fasse tout de mon mieux,
non pour être vu ou récompensé,
mais pour offrir à Dieu un travail bien fait.

Purifiez-moi de la médiocrité et de la négligence.
Donnez-moi le goût du travail soigné,
le souci du détail,
la fierté du devoir accompli.

Saint Joseph, priez pour moi.
Amen.''',
        ),
        JourNeuvaine(
          numero: 7,
          titre: 'Les relations au travail',
          verset: 'Matthieu 7, 12',
          meditation: '''
Dans son atelier, Joseph côtoyait sans doute des clients, des fournisseurs, peut-être des apprentis. Il devait gérer les relations professionnelles avec patience et honnêteté. L'Évangile ne nous dit rien, mais on imagine sa droiture.

Les relations au travail sont souvent source de difficultés : concurrence, jalousie, conflits, médisances. Parfois, l'ambiance est délétère, la collaboration difficile. Parfois, on subit l'injustice ou l'exploitation.

Joseph nous invite à l'honnêteté, à la bienveillance, au respect. Il nous apprend à faire face aux difficultés sans perdre notre paix intérieure. Il nous rappelle que, même au travail, nous sommes appelés à aimer nos frères.

Si vos relations professionnelles sont difficiles, confiez-les à Joseph. Si vous êtes en conflit, demandez-lui la grâce de la réconciliation. Si vous êtes témoin d'injustices, priez pour avoir le courage d'agir.''',
          priere: '''
Saint Joseph, homme juste et bon,
je vous confie mes relations professionnelles.

Aidez-moi à être honnête et bienveillant
envers ceux avec qui je travaille.
Donnez-moi la force de supporter les difficultés,
la sagesse d'éviter les conflits inutiles,
le courage de défendre la justice.

Je vous confie particulièrement ceux avec qui
j'ai des relations difficiles.
Touchez leurs cœurs, apaisez les tensions,
conduisez-nous sur le chemin de la réconciliation.

Saint Joseph, priez pour nous.
Amen.''',
        ),
        JourNeuvaine(
          numero: 8,
          titre: 'Le repos et la prière',
          verset: 'Exode 20, 8-11',
          meditation: '''
Dieu a béni le septième jour et s'est reposé. Il a donné à l'homme le commandement du repos sabbatique. Le travail n'est pas tout. Il faut aussi savoir s'arrêter pour se reposer, pour être avec les siens, pour prier.

Joseph observait sans doute le sabbat. Ce jour-là, il déposait ses outils, il allait à la synagogue, il priait avec Marie et Jésus. Il se ressourçait auprès de Dieu pour reprendre son travail avec des forces nouvelles.

Aujourd'hui, le repos est souvent négligé. On travaille le dimanche, on est toujours connecté, on ne s'arrête jamais. On finit par s'épuiser, par perdre le sens de la vie.

Joseph nous rappelle l'importance du repos et de la prière. Ce n'est pas du temps perdu, c'est du temps gagné pour l'essentiel. C'est le moment de se recentrer sur Dieu, sur sa famille, sur soi-même.''',
          priere: '''
Saint Joseph, vous qui sanctifiez le repos du sabbat,
apprenez-moi l'art de m'arrêter.

Aidez-moi à ne pas me laisser dévorer par le travail,
à respecter le rythme que Dieu a voulu pour l'homme.
Que je sache prendre le temps de me reposer,
d'être avec ma famille,
de prier et de me ressourcer.

Apprenez-moi à vivre le dimanche comme un jour du Seigneur,
un jour de grâce et de joie,
un avant-goût du repos éternel.

Saint Joseph, priez pour moi.
Amen.''',
        ),
        JourNeuvaine(
          numero: 9,
          titre: 'L\'offrande du travail à Dieu',
          verset: 'Romains 12, 1',
          meditation: '''
Saint Paul nous exhorte : "Offrez votre personne et votre vie en sacrifice saint, capable de plaire à Dieu." Notre travail peut devenir une offrande à Dieu. Chaque geste, chaque effort, chaque fatigue peut être vécu par amour.

Joseph a vécu ainsi. Ses journées à l'atelier étaient une prière continue. En rabotant le bois, en assemblant les pièces, en servant ses clients, il aimait Dieu et sa famille. Son travail était sanctifié par l'amour.

Nous aussi, nous pouvons faire de notre travail une offrande. Le matin, offrons notre journée à Dieu. Pendant la journée, faisons de notre mieux par amour pour Lui. Le soir, offrons-lui nos fatigues. Ainsi, notre travail devient prière.

Au dernier jour de cette neuvaine, confions à Joseph tout notre travail passé, présent et futur. Demandons-lui de l'offrir avec nous à Dieu, pour sa gloire et pour le salut du monde.''',
          priere: '''
Saint Joseph, je vous confie mon travail.
Prenez-le, purifiez-le, offrez-le avec moi à Dieu.

Acceptez mes efforts et mes fatigues,
mes joies et mes peines,
mes réussites et mes échecs.

Que tout mon travail devienne prière,
offrande d'amour à Dieu,
service de mes frères.

Et quand viendra pour moi l'heure du repos éternel,
accueillez-moi auprès de Jésus et Marie,
dans la joie sans fin du paradis.

Saint Joseph, priez pour moi maintenant
et à l'heure de ma mort. Amen.''',
        ),
      ],
    ),

    // NEUVAINE 3 : Neuvaine pour les familles
    Neuvaine(
      id: 'neuvaine_famille',
      titre: 'Neuvaine pour les familles',
      description: '9 jours pour confier votre famille à Saint Joseph, protecteur de la Sainte Famille de Nazareth.',
      imageUrl: 'assets/images/neuvaine_famille.jpg',
      couleurHex: '0xFF228B22', // Vert forêt
      jours: [
        JourNeuvaine(
          numero: 1,
          titre: 'La Sainte Famille, modèle de toutes les familles',
          verset: 'Luc 2, 51-52',
          meditation: '''
La Sainte Famille de Nazareth est le modèle de toutes les familles chrétiennes. Pendant trente ans, Joseph, Marie et Jésus ont vécu ensemble dans l'amour, la paix et la simplicité. Leur foyer était un lieu de prière, de travail et de tendresse.

Bien sûr, cette famille était unique : elle abritait le Fils de Dieu fait homme et sa Mère immaculée. Pourtant, elle a connu les joies et les peines de toutes les familles : la naissance d'un enfant, l'éducation, le travail quotidien, la perte de Jésus au Temple, la fuite en Égypte.

La Sainte Famille nous montre qu'il est possible de vivre en famille selon Dieu. L'amour, le respect, le pardon, la prière en commun sont les clés d'un foyer heureux. Joseph, Marie et Jésus sont là pour nous aider à construire notre famille sur ces fondements.

Confions aujourd'hui notre famille à la Sainte Famille de Nazareth. Demandons-leur de nous apprendre à nous aimer comme ils se sont aimés.''',
          priere: '''
Sainte Famille de Nazareth,
Jésus, Marie et Joseph,
modèle de toutes les familles chrétiennes,
regardez avec tendresse notre famille.

Apprenez-nous à nous aimer comme vous vous êtes aimés,
à nous respecter, à nous pardonner,
à prier ensemble et à nous soutenir mutuellement.

Que notre foyer soit, comme le vôtre,
un lieu de paix, de joie et de sainteté.

Sainte Famille de Nazareth, priez pour nous.
Amen.''',
        ),
        JourNeuvaine(
          numero: 2,
          titre: 'Joseph, époux fidèle',
          verset: 'Matthieu 1, 18-25',
          meditation: '''
Joseph est l'époux fidèle de Marie. Il l'aime d'un amour pur et désintéressé. Quand il apprend qu'elle est enceinte, il pourrait la répudier, mais il choisit de la protéger. Quand l'ange lui révèle le mystère, il l'accueille chez lui sans réserve.

L'amour de Joseph pour Marie est un amour de don total. Il met sa vie au service de celle que Dieu lui a confiée. Il la respecte, la protège, veille sur elle avec une délicatesse infinie. Il est pour elle un soutien, un compagnon, un ami.

Les époux d'aujourd'hui ont tant besoin de ce modèle ! Dans un monde où l'amour est souvent fragile, égoïste, conditionnel, Joseph nous rappelle ce qu'est l'amour véritable : un don total de soi, une fidélité sans faille, un respect profond.

Prions aujourd'hui pour tous les époux. Que Joseph les inspire et les soutienne dans leur vocation.''',
          priere: '''
Saint Joseph, époux fidèle,
vous qui avez aimé Marie d'un amour pur et généreux,
veillez sur tous les époux.

Apprenez-leur à s'aimer comme vous vous êtes aimés,
dans le respect, la tendresse et la fidélité.
Soutenez-les dans les difficultés,
renouvelez leur amour chaque jour.

Je vous confie particulièrement les couples qui traversent des épreuves.
Qu'ils trouvent en vous un modèle et un intercesseur.

Saint Joseph, priez pour les époux.
Amen.''',
        ),
        JourNeuvaine(
          numero: 3,
          titre: 'Joseph, père nourricier',
          verset: 'Matthieu 2, 13-15',
          meditation: '''
Joseph est le père nourricier de Jésus. Ce n'est pas son père biologique, mais il exerce pleinement la paternité. Il le protège, l'éduque, lui apprend à prier et à travailler. Il est présent, attentif, aimant.

La paternité de Joseph est discrète mais réelle. Il ne cherche pas à se mettre en avant. Il s'efface pour que Jésus grandisse. Il accepte de ne pas être le père selon la chair, mais il l'est selon le cœur.

Aujourd'hui, la paternité est souvent fragilisée. Beaucoup de pères sont absents, dépassés, ou ne savent pas comment exercer leur rôle. Joseph est un modèle pour tous. Il montre qu'être père, c'est aimer, protéger, éduquer, et aussi savoir s'effacer pour laisser l'enfant grandir.

Prions pour tous les pères du monde. Demandons à Saint Joseph de les inspirer et de les soutenir dans leur mission si importante.''',
          priere: '''
Saint Joseph, père nourricier,
vous qui avez entouré Jésus de tant de soins et d'amour,
veillez sur tous les pères du monde.

Donnez-leur un cœur grand et généreux,
capable d'aimer sans posséder,
de guider sans contraindre,
de protéger sans étouffer.

Soutenez les pères qui traversent des difficultés,
ceux qui sont seuls, fatigués, découragés.
Qu'ils trouvent en vous un modèle et un intercesseur.

Saint Joseph, priez pour les pères.
Amen.''',
        ),
        JourNeuvaine(
          numero: 4,
          titre: 'L\'éducation des enfants',
          verset: 'Luc 2, 51-52',
          meditation: '''
À Nazareth, Joseph éduque Jésus. Il lui apprend à prier, à connaître les Écritures, à vivre en homme. Il lui transmet son métier, le goût du travail bien fait. Il est présent à chaque étape de sa croissance.

L'éducation est une mission exigeante. Les parents d'aujourd'hui se sentent souvent dépassés. Comment éduquer dans un monde qui change si vite ? Comment transmettre des valeurs quand tout semble les contredire ? Comment être présent quand le travail accapare ?

Joseph nous apprend que l'éducation passe d'abord par l'exemple. Jésus a appris à prier en voyant Joseph prier. Il a appris à travailler en voyant Joseph travailler. Il a appris à aimer en voyant Joseph aimer.

Confions à Saint Joseph nos enfants, nos adolescents, nos jeunes adultes. Demandons-lui de nous aider à être pour eux des éducateurs selon son cœur.''',
          priere: '''
Saint Joseph, éducateur de Jésus,
je vous confie tous les enfants et les jeunes.

Veillez sur eux, protégez-les des dangers,
guidez-les sur le chemin de la vie.
Aidez-les à grandir en sagesse et en sainteté,
comme Jésus grandissait à Nazareth.

Je vous confie aussi les parents et les éducateurs.
Donnez-leur la sagesse, la patience et l'amour
pour remplir leur mission délicate.

Saint Joseph, priez pour nos enfants.
Amen.''',
        ),
        JourNeuvaine(
          numero: 5,
          titre: 'La vie quotidienne en famille',
          verset: 'Luc 2, 51-52',
          meditation: '''
La vie à Nazareth était simple et ordinaire. Les journées se succédaient, semblables les unes aux autres. Le travail, les repas, la prière, les conversations, le sommeil. Rien d'extraordinaire, et pourtant, tout était extraordinaire parce que vécu dans l'amour.

C'est dans ce quotidien que Dieu a choisi de passer trente ans. Il nous montre ainsi que la sainteté n'est pas ailleurs que dans notre vie de tous les jours. Ce sont les petites choses, les gestes simples, les attentions quotidiennes qui construisent l'amour.

Notre vie de famille est faite de ces petits riens : préparer le repas, aider aux devoirs, écouter les soucis de l'autre, partager un moment de détente, prier ensemble. Rien de spectaculaire, mais tout peut être vécu par amour.

Apprenons de la Sainte Famille à valoriser notre quotidien. Offrons à Dieu chaque petit geste, chaque service rendu, chaque moment partagé. Ainsi, notre foyer deviendra un véritable Nazareth.''',
          priere: '''
Saint Joseph, vous qui avez vécu le quotidien à Nazareth,
apprenez-nous à valoriser les petits riens de chaque jour.

Aidez-nous à voir dans nos gestes quotidiens
des occasions d'aimer Dieu et notre famille.
Que le travail, les repas, les moments de détente
soient vécus dans la joie et la paix.

Apprenez-nous à être présents les uns aux autres,
à nous écouter, à nous soutenir,
à partager nos joies et nos peines.

Saint Joseph, priez pour notre famille.
Amen.''',
        ),
        JourNeuvaine(
          numero: 6,
          titre: 'La prière en famille',
          verset: 'Matthieu 18, 20',
          meditation: '''
"Là où deux ou trois sont réunis en mon nom, je suis au milieu d'eux." Cette parole de Jésus s'est réalisée pleinement à Nazareth. Chaque jour, Joseph, Marie et Jésus priaient ensemble. La prière était le cœur de leur foyer.

La prière en famille est essentielle. Elle unit les cœurs, elle met Dieu au centre, elle donne la force d'affronter les épreuves. Une famille qui prie ensemble reste unie, quoi qu'il arrive.

Mais aujourd'hui, la prière en famille est souvent négligée. On ne trouve pas le temps, on ne sait pas comment faire, on est gênés. Pourtant, il suffit de peu : un Notre Père le soir, une prière avant le repas, un moment de partage de l'Évangile le dimanche.

Saint Joseph nous encourage à prier en famille. Il nous montre que la prière n'est pas une contrainte mais une source de joie et de paix. Avec Marie et Jésus, il prie avec nous et pour nous.''',
          priere: '''
Saint Joseph, vous qui priiez chaque jour avec Marie et Jésus,
apprenez-nous à prier en famille.

Donnez-nous le courage de nous réunir pour prier,
malgré les emplois du temps chargés et les réticences.
Apprenez-nous à faire de la prière le cœur de notre foyer.

Que notre maison soit une véritable église domestique,
où Dieu est aimé, honoré et servi.
Que la prière nous unisse et nous fortifie
dans les joies et dans les épreuves.

Saint Joseph, priez avec nous et pour nous.
Amen.''',
        ),
        JourNeuvaine(
          numero: 7,
          titre: 'Les épreuves en famille',
          verset: 'Matthieu 2, 13-15',
          meditation: '''
La Sainte Famille n'a pas été épargnée par les épreuves. La fuite en Égypte a été une expérience traumatisante : quitter sa maison, sa terre, ses proches, partir dans l'inconnu pour sauver l'enfant. Joseph a dû être terrifié, mais il a fait confiance.

Toutes les familles connaissent des épreuves : maladies, deuils, difficultés financières, conflits, incompréhensions. Parfois, on se sent dépassés, découragés, prêts à baisser les bras. Comment tenir ?

Joseph nous apprend que, dans l'épreuve, il faut garder confiance en Dieu. Il n'a pas compris pourquoi il devait fuir en Égypte, mais il a obéi. Il savait que Dieu ne l'abandonnerait pas. Et Dieu ne l'a pas abandonné.

Si votre famille traverse une épreuve, confiez-la à Saint Joseph. Il comprend votre angoisse, votre peur, votre fatigue. Il intercède pour vous auprès de Dieu. Il vous soutient de sa présence discrète mais efficace.''',
          priere: '''
Saint Joseph, vous qui avez connu l'épreuve de l'exil,
je vous confie ma famille dans ses difficultés.

Vous savez ce qu'est la peur, l'angoisse, l'incertitude.
Soyez proche de nous dans nos épreuves.
Donnez-nous la force de tenir,
la confiance de ne pas désespérer,
l'espérance que Dieu ne nous abandonne pas.

Protégez ma famille des dangers,
apaisez nos conflits,
soutenez-nous dans la maladie et le deuil.

Saint Joseph, priez pour nous.
Amen.''',
        ),
        JourNeuvaine(
          numero: 8,
          titre: 'Le pardon en famille',
          verset: 'Matthieu 18, 21-22',
          meditation: '''
Dans toute famille, il y a des tensions, des disputes, des blessures. On se heurte, on se blesse, parfois gravement. Comment vivre ensemble quand on s'est fait du mal ? Comment retrouver la paix ?

La Sainte Famille nous apprend l'art du pardon. Sans doute y avait-il entre Joseph, Marie et Jésus des moments de tension, d'incompréhension. Le jour où Jésus reste à Jérusalem sans prévenir, Joseph a dû être inquiet, peut-être même un peu fâché. Mais l'amour a pardonné.

Le pardon est difficile. Il demande de l'humilité, de la générosité, du temps. Parfois, on n'y arrive pas tout seul. Mais Dieu nous donne sa grâce. Avec lui, tout est possible.

Si des blessures existent dans votre famille, si des relations sont brisées, confiez-les à Saint Joseph. Demandez-lui la grâce du pardon, de la réconciliation, de la paix. Il vous aidera à refaire l'unité.''',
          priere: '''
Saint Joseph, homme juste et miséricordieux,
apprenez-nous l'art du pardon en famille.

Aidez-nous à reconnaître nos torts,
à demander pardon avec humilité,
à accueillir le pardon des autres avec gratitude.

Guérissez les blessures qui nous séparent,
apaisez les rancœurs qui nous empoisonnent,
réconciliez-nous les uns avec les autres.

Que votre présence discrète mais aimante
nous aide à refaire l'unité
et à retrouver la paix du cœur.

Saint Joseph, priez pour nous.
Amen.''',
        ),
        JourNeuvaine(
          numero: 9,
          titre: 'La joie d\'être famille',
          verset: 'Psaume 128',
          meditation: '''
Le psaume 128 célèbre la joie de la famille : "Tu es heureux et ton bonheur, c'est toi qui le vois. Tu verras les fils de tes fils." La famille est source de joie, même si elle connaît des épreuves.

À Nazareth, il y avait de la joie. La joie de vivre ensemble, de partager les repas, de travailler, de prier, de grandir. La joie simple des choses quotidiennes. La joie d'être une famille.

Dieu a voulu naître et grandir dans une famille. Il nous montre ainsi que la famille est le lieu privilégié de l'épanouissement humain. C'est là qu'on apprend à aimer, à partager, à pardonner. C'est là qu'on se prépare à la grande famille des enfants de Dieu.

Au dernier jour de cette neuvaine, rendons grâce pour notre famille. Avec ses défauts, ses fragilités, ses blessures, elle est unique et précieuse. Demandons à Saint Joseph de nous aider à cultiver la joie d'être ensemble, la joie de nous aimer, la joie de grandir ensemble vers Dieu.''',
          priere: '''
Saint Joseph, vous qui avez vécu la joie de la Sainte Famille,
apprenez-nous à cultiver la joie dans notre famille.

Aidez-nous à voir les merveilles que Dieu fait en nous,
à apprécier les petits bonheurs de chaque jour,
à savourer la joie d'être ensemble.

Que notre maison soit un lieu de lumière et de paix,
où il fait bon vivre, où l'on aime se retrouver.
Que notre joie soit contagieuse
et attire d'autres à la source de tout amour.

Saint Joseph, gardien de la Sainte Famille,
gardez notre famille dans la joie et la paix.
Amen.''',
        ),
      ],
    ),

    // NEUVAINE 4 : Neuvaine pour les malades
    Neuvaine(
      id: 'neuvaine_malades',
      titre: 'Neuvaine pour les malades',
      description: '9 jours pour confier les malades à Saint Joseph, consolation des affligés et patron de la bonne mort.',
      imageUrl: 'assets/images/neuvaine_malades.jpg',
      couleurHex: '0xFF4682B4', // Bleu acier
      jours: [
        JourNeuvaine(
          numero: 1,
          titre: 'Joseph, consolation des affligés',
          verset: 'Matthieu 5, 4',
          meditation: '''
"Heureux les affligés, ils seront consolés." Cette parole de Jésus s'est réalisée pour Joseph. Il a connu l'affliction : l'inquiétude devant la grossesse de Marie, la peur de la fuite en Égypte, l'angoisse de perdre Jésus à Jérusalem. Mais Dieu l'a consolé à chaque fois.

Joseph est proche de tous ceux qui souffrent. Il connaît la maladie, la peur, l'incertitude. Il comprend la douleur physique et morale. C'est pourquoi il est un consolateur si efficace : il a lui-même été consolé par Dieu.

Aujourd'hui, nous confions à Saint Joseph tous les malades. Qu'il soit pour eux une présence réconfortante, un soutien dans l'épreuve, un intercesseur auprès de Dieu. Qu'il leur obtienne la force de porter leur croix avec patience et confiance.

Prions aussi pour ceux qui soignent : médecins, infirmiers, soignants, aidants familiaux. Qu'ils trouvent en Joseph un modèle de dévouement et de compassion.''',
          priere: '''
Saint Joseph, consolation des affligés,
je vous confie tous les malades.

Vous qui avez connu la souffrance et l'inquiétude,
soyez proche de ceux qui souffrent dans leur corps,
de ceux qui luttent contre la maladie,
de ceux qui sont fatigués et découragés.

Obtenez-leur la force de supporter l'épreuve,
la paix du cœur dans la tempête,
l'espérance qui ne déçoit pas.

Je vous confie aussi ceux qui les soignent.
Inspirez-leur la compassion et le dévouement.

Saint Joseph, priez pour les malades.
Amen.''',
        ),
        JourNeuvaine(
          numero: 2,
          titre: 'La maladie, une épreuve',
          verset: '2 Corinthiens 12, 7-10',
          meditation: '''
La maladie est une épreuve difficile. Elle atteint le corps, mais aussi le moral, les relations, la foi. On se sent fragile, dépendant, parfois inutile. On s'interroge : pourquoi moi ? Pourquoi maintenant ? Où est Dieu ?

Saint Paul a connu une épreuve dans sa chair. Il a supplié le Seigneur de l'en délivrer. Dieu lui a répondu : "Ma grâce te suffit, car ma puissance donne toute sa mesure dans la faiblesse." La maladie peut devenir un lieu de grâce, si on l'accueille avec foi.

Joseph n'a pas été malade, sans doute, mais il a connu la faiblesse. Il a dû compter sur Dieu, s'abandonner à sa Providence, accepter de ne pas maîtriser les événements. Il a appris que la force de Dieu se déploie dans la faiblesse humaine.

Si vous êtes malade, ou si un proche l'est, confiez cette faiblesse à Joseph. Demandez-lui la grâce de vivre cette épreuve avec foi, sans révolte, dans l'abandon à Dieu.''',
          priere: '''
Saint Joseph, vous qui avez connu la faiblesse humaine,
je vous confie mon épreuve (ou celle de N.).

Aidez-moi à l'accueillir avec foi,
sans révolte ni désespoir.
Donnez-moi la force de porter cette croix
en union avec Jésus crucifié.

Que ma faiblesse devienne un lieu
où la puissance de Dieu se déploie.
Que je puisse dire avec saint Paul :
"Quand je suis faible, c'est alors que je suis fort."

Saint Joseph, priez pour moi.
Amen.''',
        ),
        JourNeuvaine(
          numero: 3,
          titre: 'La visite aux malades',
          verset: 'Matthieu 25, 36',
          meditation: '''
"J'étais malade et vous m'avez visité." Jésus s'identifie à ceux qui souffrent. Visiter un malade, c'est visiter Jésus lui-même. C'est une œuvre de miséricorde parmi les plus importantes.

Joseph, sans doute, a visité des malades à Nazareth. Il savait réconforter, encourager, prier avec ceux qui souffraient. Il était attentif aux plus fragiles. Sa présence discrète apportait la paix.

Aujourd'hui, beaucoup de malades sont seuls. La famille est loin, les amis se font rares, la solitude pèse lourdement. Une visite, un appel, un petit message peuvent faire la différence. C'est parfois peu de chose, mais c'est énorme pour celui qui souffre.

Si vous connaissez des malades, n'hésitez pas à les visiter, à les appeler, à leur écrire. Vous serez pour eux un envoyé de Joseph, un messager de la tendresse de Dieu.''',
          priere: '''
Saint Joseph, vous qui visitiez les malades,
apprenez-moi à être présent à ceux qui souffrent.

Donnez-moi un cœur attentif aux plus fragiles,
le courage de les visiter,
la délicatesse de les réconforter,
la sagesse de leur dire les mots qu'il faut.

Que ma présence leur apporte un peu de joie,
un peu de réconfort, un peu d'espérance.
Qu'à travers moi, ils sentent la tendresse de Dieu.

Saint Joseph, priez pour ceux qui visitent les malades.
Amen.''',
        ),
        JourNeuvaine(
          numero: 4,
          titre: 'L\'abandon à la volonté de Dieu',
          verset: 'Matthieu 26, 39',
          meditation: '''
"Père, que ta volonté soit faite, et non la mienne." La prière de Jésus à Gethsémani est le modèle de l'abandon à Dieu. Il accepte la croix, la souffrance, la mort, par amour et par obéissance.

Joseph a vécu cet abandon. Il n'a pas compris pourquoi il devait fuir en Égypte, pourquoi il devait vivre dans la précarité, pourquoi le mystère de l'Incarnation le dépassait tant. Mais il s'est abandonné à la volonté de Dieu, sans chercher à comprendre.

La maladie nous confronte à cet abandon. Nous voudrions guérir, retrouver la santé, vivre normalement. Mais Dieu a peut-être d'autres plans. Il nous demande de faire confiance, même si nous ne comprenons pas. Il nous demande de dire, comme Jésus : "Que ta volonté soit faite."

Cet abandon n'est pas de la résignation. C'est un acte de foi et d'amour. C'est reconnaître que Dieu est Père, qu'il nous aime, qu'il veut notre bien, même à travers l'épreuve.''',
          priere: '''
Saint Joseph, modèle d'abandon à Dieu,
apprenez-moi à dire oui à sa volonté,
même quand je ne comprends pas.

Aidez-moi à accepter la maladie,
à ne pas me révolter,
à faire confiance à Celui qui est Père.

Que je puisse dire avec Jésus :
"Que ta volonté soit faite,
non pas la mienne."
Donnez-moi la paix du cœur
dans l'abandon filial à Dieu.

Saint Joseph, priez pour moi.
Amen.''',
        ),
        JourNeuvaine(
          numero: 5,
          titre: 'La souffrance offerte',
          verset: 'Colossiens 1, 24',
          meditation: '''
"Je complète dans ma chair ce qui manque aux souffrances du Christ pour son corps qui est l'Église." Saint Paul a compris que la souffrance peut avoir un sens si on l'offre au Christ, si on l'unit à la sienne.

La maladie est une souffrance, mais elle peut devenir une offrande. En l'unissant à la passion de Jésus, elle participe au salut du monde. Elle a une valeur rédemptrice. Elle n'est pas absurde, elle peut porter du fruit.

Joseph a offert ses souffrances. Il a offert ses inquiétudes, ses fatigues, ses incompréhensions. Tout cela, il l'a vécu par amour, pour Jésus et Marie. Sa vie cachée était une offrande continuelle.

Si vous souffrez, offrez votre souffrance. Offrez-la pour vos proches, pour l'Église, pour le monde. Elle deviendra alors une prière puissante, une source de grâces. Vous ne serez plus une victime passive, mais un acteur du salut.''',
          priere: '''
Saint Joseph, vous qui avez offert vos souffrances,
apprenez-moi à offrir les miennes.

Prenez ma maladie, ma douleur, ma fatigue.
Unissez-les à la passion de Jésus.
Qu'elles deviennent une offrande agréable à Dieu,
porteuse de grâces pour moi et pour le monde.

Je vous offre tout : mes nuits difficiles,
mes journées de fatigue, mes moments de découragement.
Que rien ne soit perdu, que tout soit fécond.

Saint Joseph, priez pour moi.
Amen.''',
        ),
        JourNeuvaine(
          numero: 6,
          titre: 'L\'espérance chrétienne',
          verset: 'Romains 8, 18',
          meditation: '''
"J'estime qu'il n'y a pas de commune mesure entre les souffrances du temps présent et la gloire qui va être révélée en nous." Saint Paul nous rappelle que la souffrance n'est pas le dernier mot. Après la croix vient la résurrection.

L'espérance chrétienne n'est pas un optimisme naïf. C'est la certitude que Dieu est plus fort que la souffrance et la mort. C'est la foi en la résurrection. C'est l'attente confiante de la gloire à venir.

Joseph a vécu dans cette espérance. Il savait que le mystère qui se jouait à Nazareth dépassait l'entendement, mais il croyait que Dieu mènerait son œuvre à bien. Il espérait contre toute espérance.

La maladie est une épreuve pour l'espérance. On peut se décourager, perdre confiance. Mais l'espérance chrétienne nous dit que la guérison, ici ou dans l'au-delà, est possible. Elle nous dit que la mort n'est pas une fin, mais un passage. Elle nous ouvre à la vie éternelle.''',
          priere: '''
Saint Joseph, homme d'espérance,
je vous confie ceux qui perdent courage dans la maladie.

Ravivez en eux la flamme de l'espérance.
Aidez-les à croire que Dieu ne les abandonne pas,
que la souffrance n'est pas le dernier mot,
que la vie éternelle les attend.

Donnez-leur la force de regarder au-delà de l'épreuve,
vers la lumière de la résurrection.
Qu'ils gardent confiance, même dans les nuits les plus sombres.

Saint Joseph, priez pour nous.
Amen.''',
        ),
        JourNeuvaine(
          numero: 7,
          titre: 'Le sacrement des malades',
          verset: 'Jacques 5, 14-15',
          meditation: '''
"L'un de vous est-il malade ? Qu'il appelle les anciens de l'Église, et qu'ils prient sur lui après lui avoir fait une onction d'huile au nom du Seigneur." L'Église a toujours obéi à cette parole en administrant le sacrement des malades.

Ce sacrement n'est pas seulement pour les mourants. Il est pour tous ceux qui sont gravement malades. Il apporte la force, la paix, le pardon des péchés. Il unit le malade à la passion du Christ pour son bien et pour le bien de l'Église.

Beaucoup hésitent à le demander, par peur ou par ignorance. Pourtant, c'est une grande grâce. C'est Jésus lui-même qui vient toucher le malade, le réconforter, le fortifier.

Si vous êtes malade, ou si un proche l'est, n'hésitez pas à demander ce sacrement. Confiez-vous à Saint Joseph, qui vous obtiendra la grâce de le recevoir avec foi et de porter ses fruits.''',
          priere: '''
Saint Joseph, vous qui avez accompagné Jésus et Marie,
je vous confie ceux qui vont recevoir le sacrement des malades.

Préparez leur cœur à cette rencontre avec le Seigneur.
Qu'ils l'accueillent avec foi et confiance.
Qu'ils reçoivent la force, la paix et le pardon.

Je vous confie aussi les prêtres qui administrent ce sacrement.
Qu'ils soient des instruments de la tendresse de Dieu.

Saint Joseph, priez pour les malades.
Amen.''',
        ),
        JourNeuvaine(
          numero: 8,
          titre: 'L\'accompagnement des mourants',
          verset: 'Luc 23, 39-43',
          meditation: '''
"Seigneur, souviens-toi de moi quand tu viendras dans ton royaume." La prière du bon larron est celle de tout mourant qui se tourne vers Jésus. Accompagner un mourant, c'est l'aider à faire cette prière, à remettre son âme entre les mains de Dieu.

Joseph est le patron de la bonne mort. Pourquoi ? Parce qu'il est mort dans les bras de Jésus et de Marie. Quelle plus belle mort que celle-là ? Entouré de ceux qu'il aimait, soutenu par leur présence et leur prière.

Aujourd'hui, beaucoup meurent seuls, à l'hôpital, loin des leurs. La mort est parfois médicalisée, aseptisée, déshumanisée. Pourtant, c'est le passage le plus important de la vie. Il mérite d'être vécu avec dignité, accompagné, prié.

Si vous devez accompagner un mourant, confiez-vous à Saint Joseph. Demandez-lui la grâce d'être présent, de dire les mots qu'il faut, de prier avec foi. Il vous aidera à faire de ce moment difficile un moment de grâce.''',
          priere: '''
Saint Joseph, patron de la bonne mort,
je vous confie ceux qui s'approchent du passage.

Soyez à leurs côtés dans ces moments décisifs.
Apaisez leurs craintes, fortifiez leur foi,
ouvrez leur cœur à la miséricorde de Dieu.

Je vous confie aussi ceux qui les accompagnent.
Donnez-leur la force, la délicatesse, la foi
pour être présents jusqu'au bout.

Que personne ne meure seul, sans prière, sans amour.
Que chacun puisse, comme vous,
s'endormir dans les bras de Jésus et de Marie.

Saint Joseph, priez pour les mourants.
Amen.''',
        ),
        JourNeuvaine(
          numero: 9,
          titre: 'La vie éternelle',
          verset: 'Jean 14, 1-3',
          meditation: '''
"Dans la maison de mon Père, il y a de nombreuses demeures. Je vais vous préparer une place." La promesse de Jésus est notre espérance. La mort n'est pas la fin, mais le commencement de la vraie vie, la vie éternelle.

Joseph est entré dans cette vie. Il est auprès de Jésus et de Marie, dans la gloire du ciel. Il nous attend, il intercède pour nous. Un jour, nous le verrons face à face, avec tous les saints.

La maladie nous rapproche de cet instant. Elle nous prépare à rencontrer Dieu. C'est pourquoi elle peut être vécue dans la paix et même dans la joie, malgré la souffrance. Elle est le dernier chemin vers la maison du Père.

Au dernier jour de cette neuvaine, prions pour tous ceux qui sont malades, pour ceux qui souffrent, pour ceux qui vont mourir. Prions aussi pour nous-mêmes, afin que nous soyons prêts quand l'heure viendra. Et confions-nous à Saint Joseph, qui nous conduira sûrement à Jésus et Marie.''',
          priere: '''
Saint Joseph, vous qui êtes entré dans la vie éternelle,
conduisez-nous sur le chemin qui mène à Dieu.

Au moment de notre mort, soyez à nos côtés.
Présentez-nous à Jésus et Marie.
Ouvrez-nous les portes du paradis.

Nous vous confions tous ceux qui sont malades.
Obtenez-leur la guérison, ou la force de porter leur croix.
Préparez-les à la rencontre avec Dieu.

Et nous-mêmes, gardez-nous dans la foi et l'espérance,
afin que nous soyons prêts quand l'heure viendra.

Saint Joseph, priez pour nous maintenant
et à l'heure de notre mort. Amen.''',
        ),
      ],
    ),

    // NEUVAINE 5 : Neuvaine à Saint Joseph pour une intention particulière
    Neuvaine(
      id: 'neuvaine_intention',
      titre: '''Neuvaine pour une intention
       particulière''',
      description: '9 jours pour confier une intention spéciale à Saint Joseph, l\'intercesseur puissant qui n\'a jamais refusé une grâce à ceux qui l\'invoquent.',
      imageUrl: 'assets/images/neuvaine_intention.jpg',
      couleurHex: '0xFF800080', // Violet
      jours: [
        JourNeuvaine(
          numero: 1,
          titre: 'Présentation de l\'intention',
          verset: 'Matthieu 7, 7-8',
          meditation: '''
"Demandez, on vous donnera ; cherchez, vous trouverez ; frappez, on vous ouvrira." Jésus nous encourage à demander avec confiance. Dieu est Père, il veut le bien de ses enfants. Il nous invite à lui présenter nos besoins.

Aujourd'hui, nous présentons à Saint Joseph notre intention particulière. Celle que nous portons dans notre cœur, parfois depuis longtemps. Celle que nous n'osons même pas formuler, mais qui nous tient à cœur.

Joseph a obtenu tout ce qu'il a demandé à Dieu. Il est un intercesseur puissant. Sainte Thérèse de Lisieux témoigne : "Je n'ai jamais rien demandé à saint Joseph sans être exaucée." Nous pouvons donc nous tourner vers lui avec une grande confiance.

Présentons-lui notre intention avec simplicité et foi. Comme un enfant s'adresse à son père. Il nous écoute, il comprend, il intercède. Et nous attendons avec confiance la réponse de Dieu, qui sait mieux que nous ce qui nous est bon.''',
          priere: '''
Saint Joseph, intercesseur puissant,
je viens à vous avec confiance.

Je vous confie mon intention particulière :
(mentionnez ici votre intention)

Vous qui n'avez jamais refusé une grâce à ceux qui vous invoquent,
présentez ma demande à Jésus, votre fils bien-aimé.
Parlez-lui de moi, vous qui connaissez si bien son cœur.

Obtenez-moi la grâce que je demande,
si elle est pour le bien de mon âme et pour la gloire de Dieu.
Mais surtout, apprenez-moi à faire confiance,
à accepter la volonté de Dieu,
à attendre avec patience sa réponse.

Saint Joseph, priez pour moi.
Amen.''',
        ),
        JourNeuvaine(
          numero: 2,
          titre: 'La foi qui déplace les montagnes',
          verset: 'Matthieu 17, 20',
          meditation: '''
"Si vous aviez de la foi gros comme une graine de moutarde, vous diriez à cette montagne : Déplace-toi d'ici à là, et elle se déplacera. Rien ne vous sera impossible." La foi est la condition de la prière efficace. Sans foi, il est impossible de plaire à Dieu.

Joseph a eu une foi immense. Il a cru à la parole de l'ange, alors que tout semblait impossible. Il a cru que Marie était enceinte par l'Esprit Saint. Il a cru qu'il devait fuir en Égypte. Il a cru, sans voir, sans comprendre.

Aujourd'hui, nous sommes invités à grandir dans la foi. À croire que Dieu peut faire des miracles. À croire que notre intention peut être exaucée. À croire que Joseph intercède pour nous.

Si notre foi est faible, demandons à Joseph de l'augmenter. Il est le père des croyants, le modèle de la foi. Il nous obtiendra la grâce de croire plus fort, plus profondément.''',
          priere: '''
Saint Joseph, homme de foi,
augmentez ma confiance en Dieu.

Vous avez cru sans voir, vous avez obéi sans comprendre.
Apprenez-moi à croire, même quand je ne comprends pas.
Donnez-moi une foi capable de déplacer les montagnes.

Je crois, Seigneur, mais augmente ma foi.
Je crois que tu peux exaucer ma demande.
Je crois que Joseph intercède pour moi.

Que ma prière soit animée par une foi vivante,
capable d'obtenir les grâces dont j'ai besoin.

Saint Joseph, priez pour moi.
Amen.''',
        ),
        JourNeuvaine(
          numero: 3,
          titre: 'La persévérance dans la prière',
          verset: 'Luc 18, 1-8',
          meditation: '''
Jésus a enseigné la nécessité de prier toujours sans se décourager. Il a donné l'exemple de la veuve importune qui obtient justice à force de persévérance. La prière persévérante finit toujours par être exaucée.

Joseph a persévéré dans sa mission. Jour après jour, année après année, il a été fidèle. Il n'a pas baissé les bras devant les difficultés. Il a tenu bon, dans la confiance et l'obéissance.

Parfois, nous nous décourageons de prier. Les jours passent, les semaines, les mois, et rien ne semble changer. Nous avons l'impression que Dieu ne nous entend pas. Mais la parabole de la veuve nous rappelle qu'il faut persévérer.

Continuons de prier, avec confiance et persévérance. Joseph est à nos côtés, il prie avec nous. Il ne se lasse pas de présenter notre intention à Jésus. Avec lui, nous pouvons tenir bon.''',
          priere: '''
Saint Joseph, modèle de persévérance,
apprenez-moi à prier sans me décourager.

Quand les jours passent sans réponse,
quand le silence de Dieu m'éprouve,
soutenez ma foi et mon espérance.

Aidez-moi à persévérer dans la prière,
avec confiance et abandon.
Je sais que vous ne m'abandonnez pas,
que vous présentez sans cesse ma demande à Jésus.

Donnez-moi la force de tenir bon,
jusqu'à ce que Dieu exauce ma prière,
selon sa volonté et pour mon bien.

Saint Joseph, priez pour moi.
Amen.''',
        ),
        JourNeuvaine(
          numero: 4,
          titre: 'L\'abandon à la volonté de Dieu',
          verset: 'Matthieu 6, 10',
          meditation: '''
"Que ta volonté soit faite sur la terre comme au ciel." La prière parfaite est celle qui s'abandonne à la volonté de Dieu. Elle ne cherche pas à imposer sa propre volonté, mais à adhérer à celle du Père.

Joseph a vécu cet abandon. Il ne cherchait pas à comprendre, à contrôler, à maîtriser. Il s'abandonnait à Dieu, sûr qu'il ferait tout pour son bien. Même dans les moments les plus difficiles, il disait oui.

Notre prière doit être ainsi. Nous demandons avec confiance, mais nous nous abandonnons à la volonté de Dieu. Nous acceptons d'avance qu'il réponde comme il veut, quand il veut. Nous savons qu'il est Père, qu'il nous aime, qu'il veut notre bien.

Si Dieu n'exauce pas notre prière comme nous le voudrions, c'est qu'il a mieux pour nous. Peut-être prépare-t-il quelque chose de plus grand. Peut-être nous demande-t-il de grandir dans la patience, la foi, l'amour. Faisons-lui confiance.''',
          priere: '''
Saint Joseph, modèle d'abandon à Dieu,
apprenez-moi à dire oui à sa volonté.

Je vous confie mon intention,
mais surtout, apprenez-moi à m'abandonner.
Que je puisse dire avec Jésus :
"Que ta volonté soit faite,
non pas la mienne."

Si Dieu m'accorde ce que je demande,
je le remercierai.
S'il ne m'accorde pas,
je lui ferai confiance,
sachant qu'il a mieux pour moi.

Saint Joseph, priez pour moi.
Amen.''',
        ),
        JourNeuvaine(
          numero: 5,
          titre: 'L\'action de grâce',
          verset: '1 Thessaloniciens 5, 16-18',
          meditation: '''
"Soyez toujours dans la joie, priez sans cesse, rendez grâce en toutes circonstances." L'action de grâce est une dimension essentielle de la prière. Avant même d'être exaucés, nous rendons grâce pour l'amour de Dieu, pour son écoute, pour sa présence.

Joseph a rendu grâce. Chaque jour, il remerciait Dieu pour les merveilles qu'il accomplissait. Pour le don de Jésus, pour la présence de Marie, pour la paix de Nazareth. Sa vie était une action de grâce continuelle.

Aujourd'hui, rendons grâce pour notre intention. Même si elle n'est pas encore exaucée, rendons grâce. Parce que Dieu nous écoute, parce que Joseph intercède pour nous, parce que nous sommes aimés. Rendons grâce avec confiance.

L'action de grâce ouvre notre cœur, le rend plus disponible à recevoir les grâces de Dieu. Elle nous met dans la bonne disposition, celle de l'humilité et de la reconnaissance.''',
          priere: '''
Saint Joseph, homme d'action de grâce,
apprenez-moi à rendre grâce en toutes circonstances.

Je vous rends grâce, Seigneur,
pour votre amour fidèle,
pour votre écoute attentive,
pour la présence de Joseph à mes côtés.

Je rends grâce pour mon intention,
même si elle n'est pas encore exaucée.
Je sais que vous m'avez entendu,
que vous préparez une réponse,
que vous voulez mon bien.

Que ma vie soit une action de grâce continuelle.
Saint Joseph, priez pour moi.
Amen.''',
        ),
        JourNeuvaine(
          numero: 6,
          titre: 'La communion des saints',
          verset: 'Hébreux 12, 1',
          meditation: '''
"Nous sommes entourés d'une si grande nuée de témoins." La communion des saints nous unit à tous ceux qui sont au ciel. Ils intercèdent pour nous, ils nous soutiennent, ils nous accompagnent sur le chemin de la vie.

Joseph est l'un de ces témoins. Il est au ciel, auprès de Jésus et Marie. Il nous voit, il nous connaît, il prie pour nous. Il est notre père, notre protecteur, notre intercesseur.

Quand nous prions Joseph, nous ne sommes pas seuls. Toute l'Église prie avec nous. Les saints du ciel joignent leurs prières aux nôtres. Nous sommes portés par cette grande famille spirituelle.

Aujourd'hui, prenons conscience de cette communion. Nous ne sommes pas seuls à prier pour notre intention. Des millions de chrétiens dans le monde, des saints au ciel, des anges, Joseph lui-même, prient avec nous. Quelle force ! Quel réconfort !''',
          priere: '''
Saint Joseph, vous qui êtes dans la gloire du ciel,
je vous remercie d'être mon intercesseur.

Avec vous, tous les saints et les anges prient pour moi.
Avec vous, l'Église entière me porte dans sa prière.
Je ne suis pas seul, je suis soutenu par une nuée de témoins.

Que cette communion me donne force et confiance.
Que je me sente porté par tant de frères et sœurs
qui, comme vous, intercèdent pour moi.

Saint Joseph, priez pour moi,
avec tous les saints et les anges.
Amen.''',
        ),
        JourNeuvaine(
          numero: 7,
          titre: 'La paix du cœur',
          verset: 'Jean 14, 27',
          meditation: '''
"Je vous laisse la paix, je vous donne ma paix. Ce n'est pas à la manière du monde que je vous la donne." La paix de Jésus n'est pas l'absence de problèmes, mais une paix profonde qui habite le cœur malgré les difficultés.

Joseph a vécu dans cette paix. Malgré les inquiétudes, les dangers, les incompréhensions, il gardait son cœur en paix. Parce qu'il savait que Dieu était avec lui, que rien ne pouvait l'atteindre vraiment.

Nous cherchons souvent la paix dans la résolution de nos problèmes. Si notre intention est exaucée, nous aurons la paix. Mais la paix de Jésus est plus profonde. Elle ne dépend pas des circonstances. Elle est un don de Dieu, une grâce à demander.

Aujourd'hui, demandons à Joseph la paix du cœur. La paix de savoir que Dieu nous aime, quoi qu'il arrive. La paix de nous abandonner à sa volonté. La paix de croire qu'il fera tout pour notre bien.''',
          priere: '''
Saint Joseph, homme de paix,
obtenez-moi la paix du cœur.

La paix qui ne dépend pas des circonstances,
la paix qui habite l'âme même dans l'épreuve,
la paix que le monde ne peut donner.

Que je sois en paix, quoi qu'il arrive.
Que je garde confiance, même dans l'attente.
Que je sache que Dieu est avec moi,
qu'il ne m'abandonne jamais.

Donnez-moi cette paix profonde
qui est le signe de la présence de Dieu.

Saint Joseph, priez pour moi.
Amen.''',
        ),
        JourNeuvaine(
          numero: 8,
          titre: 'L\'attente confiante',
          verset: 'Psaume 27, 14',
          meditation: '''
"Espère le Seigneur, sois fort et prends courage, espère le Seigneur." L'attente est souvent difficile. On voudrait que les choses aillent vite, que Dieu réponde tout de suite. Mais Dieu a son temps, qui n'est pas le nôtre.

Joseph a attendu. Il a attendu que Jésus naisse, que l'ordre de fuir vienne, que l'ordre de revenir vienne. Il a attendu patiemment, dans la confiance, sans s'impatienter. Il savait que Dieu ne manquerait pas à sa promesse.

L'attence confiante est une vertu. Elle nous apprend à dépendre de Dieu, à ne pas nous prendre pour Dieu. Elle nous purifie, nous mûrit, nous prépare à recevoir le don de Dieu.

Si notre intention n'est pas encore exaucée, continuons d'attendre avec confiance. Joseph est avec nous dans cette attente. Il nous aide à ne pas nous décourager, à garder l'espérance, à croire que Dieu répondra au moment voulu.''',
          priere: '''
Saint Joseph, vous qui avez su attendre,
apprenez-moi l'attente confiante.

Donnez-moi la patience de ne pas m'impatienter,
la foi de croire que Dieu répondra,
l'espérance de regarder vers l'avenir avec confiance.

Je remets mon intention entre vos mains.
Je sais que vous la présenterez à Jésus
au moment favorable.
Je veux attendre avec vous,
dans la paix et la confiance.

Saint Joseph, priez pour moi.
Amen.''',
        ),
        JourNeuvaine(
          numero: 9,
          titre: 'L\'action de grâce finale',
          verset: 'Psaume 136, 1',
          meditation: '''
"Rendez grâce au Seigneur, car il est bon, car son amour est éternel." Au terme de cette neuvaine, que notre intention soit exaucée ou non, nous rendons grâce. Parce que Dieu nous a écoutés, parce que Joseph a intercédé pour nous, parce que nous sommes aimés.

Si notre intention a été exaucée, rendons grâce avec joie. Dieu a entendu notre prière, Joseph a intercédé pour nous. C'est un motif de grande reconnaissance.

Si elle n'a pas été exaucée, rendons grâce quand même. Dieu a peut-être mieux pour nous. Il nous prépare quelque chose que nous ne voyons pas encore. Il nous demande de continuer à lui faire confiance.

Quoi qu'il arrive, nous savons que Dieu nous aime. Nous savons que Joseph prie pour nous. Nous savons que notre prière n'est jamais perdue. Elle monte vers Dieu comme un encens, elle est agréable à ses yeux.

Rendons grâce, aujourd'hui et toujours, pour l'amour infini de Dieu. Rendons grâce à Joseph, notre père et protecteur. Rendons grâce pour tout.''',
          priere: '''
Saint Joseph, je vous rends grâce.

Je rends grâce pour votre intercession,
pour votre présence à mes côtés,
pour votre amour de père.

Je rends grâce à Dieu qui m'a écouté,
qui m'a donné la force de prier,
qui m'a accordé la paix du cœur.

Que mon intention soit exaucée ou non,
je rends grâce, car Dieu est bon,
car son amour est éternel.

Je vous confie ma vie,
ma famille,
toutes mes intentions passées, présentes et futures.

Saint Joseph, priez pour moi maintenant
et à l'heure de ma mort. Amen.''',
        ),
      ],
    ),

    // À ajouter dans NeuvainesData.toutesLesNeuvaines
// NEUVAINE 6 : Neuvaine à la Sainte Famille
Neuvaine(
  id: 'neuvaine_sainte_famille',
  titre: 'Neuvaine à la Sainte Famille',
  description: '9 jours pour méditer sur l\'exemple de Jésus, Marie et Joseph à Nazareth et demander leur protection pour votre famille.',
  imageUrl: 'assets/images/neuvaine_famille.jpg',
  couleurHex: '0xFF4A6FA5', // Bleu
  jours: [
    JourNeuvaine(
      numero: 1,
      titre: 'L\'amour dans la Sainte Famille',
      verset: 'Colossiens 3, 12-14',
      meditation: '''
La Sainte Famille de Nazareth est un modèle d'amour parfait. Jésus, Marie et Joseph s'aiment d'un amour pur, désintéressé, total. Leur vie commune est une école d'amour où chaque geste, chaque parole, chaque silence est imprégné de cette charité divine.

Dans notre famille, l'amour est parfois imparfait, mêlé d'égoïsme, de malentendus, de blessures. La Sainte Famille nous montre que l'amour véritable est patient, serviable, sans envie, sans orgueil. Il excuse tout, croit tout, espère tout, supporte tout.

Aujourd'hui, méditons sur la qualité de notre amour familial. Est-il généreux ? Patient ? Pardonnons-nous facilement ? Demandons à la Sainte Famille de purifier notre amour et de le rendre plus semblable au leur.''',
      priere: '''
Sainte Famille de Nazareth,
modèle de tout amour véritable,
apprenez-nous à nous aimer comme vous vous êtes aimés.

Jésus, vous qui avez grandi dans cet amour,
apprenez-nous à aimer sans conditions.
Marie, vous qui avez aimé avec un cœur de mère,
apprenez-nous la tendresse et la patience.
Joseph, vous qui avez aimé avec un cœur de père,
apprenez-nous la force et la protection.

Que notre famille soit une école d'amour
où chacun apprend à donner et à recevoir,
à pardonner et à être pardonné,
à aimer comme Dieu nous aime.

Sainte Famille de Nazareth, priez pour nous.
Amen.''',
    ),
    JourNeuvaine(
      numero: 2,
      titre: 'La prière en famille',
      verset: 'Matthieu 18, 19-20',
      meditation: '''
"Là où deux ou trois sont réunis en mon nom, je suis au milieu d'eux." Cette parole de Jésus s'est réalisée pleinement à Nazareth. Chaque jour, Joseph, Marie et Jésus priaient ensemble. La prière était le cœur de leur foyer, le secret de leur unité, la source de leur joie.

La prière en famille est essentielle. Elle met Dieu au centre, elle ouvre les cœurs à sa grâce, elle donne la force d'affronter les épreuves. Une famille qui prie ensemble reste unie, quoi qu'il arrive.

Pourtant, la prière en famille est souvent négligée aujourd'hui. Le manque de temps, les emplois du temps chargés, les distractions nombreuses nous éloignent de cette pratique essentielle. Mais il suffit de peu : un Notre Père le soir, une prière avant le repas, un moment de partage de l'Évangile le dimanche.

La Sainte Famille nous encourage à remettre la prière au cœur de notre foyer. Elle nous montre que la prière n'est pas une contrainte mais une source de paix et de joie.''',
      priere: '''
Sainte Famille de Nazareth,
vous qui priiez ensemble chaque jour,
apprenez-nous à prier en famille.

Donnez-nous le courage de nous réunir pour prier,
malgré les emplois du temps chargés et les distractions.
Faites de notre maison une véritable église domestique
où Dieu est aimé, honoré et servi.

Que la prière nous unisse et nous fortifie
dans les joies et dans les épreuves.
Que chaque repas, chaque soir,
soit une occasion de nous tourner vers Dieu.

Sainte Famille de Nazareth, priez avec nous.
Amen.''',
    ),
    JourNeuvaine(
      numero: 3,
      titre: 'Le travail à Nazareth',
      verset: 'Matthieu 13, 55',
      meditation: '''
"Celui-là n'est-il pas le fils du charpentier ?" demandaient les habitants de Nazareth. Pendant trente ans, Jésus a partagé le travail de Joseph dans l'atelier. Le travail humble et silencieux a sanctifié leur vie quotidienne.

Joseph apprenait à Jésus à manier les outils, à travailler le bois avec soin et patience. Marie s'occupait du foyer, des repas, du tissage. Chaque geste, même le plus simple, était accompli par amour.

Dans nos familles, le travail est parfois source de fatigue, de stress, de conflits. La Sainte Famille nous apprend à offrir notre travail à Dieu, à y voir une participation à l'œuvre créatrice, à le partager dans la joie et la solidarité.

Aujourd'hui, méditons sur la manière dont nous vivons le travail dans notre famille. Est-il source d'unité ou de division ? Savons-nous nous entraider et nous soutenir dans les tâches quotidiennes ?''',
      priere: '''
Sainte Famille de Nazareth,
vous qui avez sanctifié le travail de vos mains,
apprenez-nous à donner tout notre cœur à nos tâches quotidiennes.

Joseph, modèle des travailleurs,
apprends-nous la patience et le soin dans notre ouvrage.
Marie, femme de la maison,
apprends-nous à faire de notre foyer un lieu d'accueil et de paix.
Jésus, qui as partagé notre condition,
bénis le travail de nos mains.

Que notre travail soit offrande à Dieu
et service rendu à nos frères.
Qu'il nous unisse et nous sanctifie
dans la simplicité de chaque jour.

Sainte Famille de Nazareth, priez pour nous.
Amen.''',
    ),
    JourNeuvaine(
      numero: 4,
      titre: 'L\'obéissance et la confiance',
      verset: 'Luc 2, 51',
      meditation: '''
"Il leur était soumis." Ces quelques mots résument trente années de la vie de Jésus à Nazareth. Le Fils de Dieu a choisi d'obéir à Marie et Joseph, apprenant ainsi l'humilité et la confiance.

Joseph, de son côté, a obéi aux messages des anges sans hésiter, quittant tout pour sauver l'enfant, retournant à Nazareth sur un signe de Dieu. Marie a obéi à l'annonce de l'ange, acceptant de devenir la mère du Sauveur.

L'obéissance n'est pas une vertu à la mode aujourd'hui. On lui préfère l'autonomie, l'indépendance, la liberté sans limites. Mais la Sainte Famille nous montre que la vraie liberté consiste à faire confiance à Dieu et à ceux qu'il a placés sur notre route.

Dans nos familles, l'obéissance des enfants aux parents, mais aussi le respect mutuel et l'écoute de chacun, sont essentiels pour vivre en harmonie.''',
      priere: '''
Sainte Famille de Nazareth,
vous qui avez vécu dans l'obéissance et la confiance,
apprenez-nous à nous abandonner à la volonté de Dieu.

Jésus, toi qui fus obéissant jusqu'à la croix,
apprends-nous l'humilité du cœur.
Marie, toi qui as dit "oui" sans réserve,
apprends-nous la confiance filiale.
Joseph, toi qui as obéi promptement,
apprends-nous la docilité à l'Esprit.

Que dans notre famille, chacun sache écouter,
respecter et obéir quand il le faut.
Que la confiance mutuelle soit le fondement
de notre vie commune.

Sainte Famille de Nazareth, priez pour nous.
Amen.''',
    ),
    JourNeuvaine(
      numero: 5,
      titre: 'Les joies simples du quotidien',
      verset: 'Luc 2, 52',
      meditation: '''
"Jésus grandissait en sagesse, en taille et en grâce devant Dieu et devant les hommes." La vie à Nazareth n'était pas faite d'événements extraordinaires, mais de la répétition des mêmes gestes, des mêmes joies simples.

Le sourire de l'enfant qui fait ses premiers pas, le repas partagé après une journée de travail, la veillée où l'on raconte les merveilles de Dieu, la prière du soir qui unit les cœurs... Toutes ces petites choses sont le tissu d'une vie heureuse.

Nous cherchons souvent le bonheur ailleurs, dans des réalisations exceptionnelles, des voyages, des acquisitions. Mais la Sainte Famille nous rappelle que le vrai bonheur se trouve dans les petites joies de chaque jour, celles que nous partageons avec ceux que nous aimons.

Aujourd'hui, prenons le temps de regarder notre vie et de reconnaître toutes ces joies simples que Dieu nous donne chaque jour.''',
      priere: '''
Sainte Famille de Nazareth,
vous qui avez goûté les joies simples du quotidien,
apprenez-nous à reconnaître le bonheur dans les petites choses.

Apprenez-nous à voir la beauté d'un lever de soleil,
la joie d'un repas partagé, la paix d'une soirée en famille.
Apprenez-nous à savourer chaque instant présent
comme un cadeau de Dieu.

Que nous ne passions pas à côté de notre vie
à courir après des bonheurs illusoires.
Que nous sachions nous arrêter,
regarder, aimer, remercier.

Sainte Famille de Nazareth, priez pour nous.
Amen.''',
    ),
    JourNeuvaine(
      numero: 6,
      titre: 'L\'épreuve et la confiance',
      verset: 'Matthieu 2, 13-15',
      meditation: '''
La Sainte Famille n'a pas été épargnée par les épreuves. La fuite en Égypte a été une expérience traumatisante : quitter sa maison, sa terre, ses proches, partir dans l'inconnu pour sauver l'enfant.

Joseph a dû être terrifié, mais il a fait confiance. Marie a dû être inquiète, mais elle est restée sereine. Ensemble, ils ont affronté la peur, la fatigue, l'incertitude, soutenus par leur foi en Dieu.

Toutes les familles connaissent des épreuves : maladies, deuils, difficultés financières, conflits, incompréhensions. Parfois, on se sent dépassés, découragés, prêts à baisser les bras. Comment tenir ?

La Sainte Famille nous apprend que, dans l'épreuve, il faut garder confiance en Dieu. Il ne nous abandonne jamais. Il marche avec nous, même dans les nuits les plus sombres.''',
      priere: '''
Sainte Famille de Nazareth,
vous qui avez connu l'épreuve et la souffrance,
soyez proche de toutes les familles qui traversent des difficultés.

Vous qui avez dû fuir en terre étrangère,
protégez ceux qui sont exilés, migrants, réfugiés.
Vous qui avez connu l'inquiétude et la peur,
consolez les cœurs angoissés.
Vous qui avez fait confiance à Dieu,
fortifiez notre foi dans les moments d'épreuve.

Que notre famille reste unie et solidaire
quand la tempête fait rage.
Que nous sachions nous soutenir mutuellement
et puiser notre force dans la prière.

Sainte Famille de Nazareth, priez pour nous.
Amen.''',
    ),
    JourNeuvaine(
      numero: 7,
      titre: 'Le pardon dans la famille',
      verset: 'Matthieu 18, 21-22',
      meditation: '''
Dans toute famille, il y a des tensions, des disputes, des blessures. On se heurte, on se blesse, parfois gravement. Comment vivre ensemble quand on s'est fait du mal ? Comment retrouver la paix ?

La Sainte Famille nous apprend l'art du pardon. Sans doute y avait-il entre Joseph, Marie et Jésus des moments de tension, d'incompréhension. Le jour où Jésus reste à Jérusalem sans prévenir, Joseph a dû être inquiet, peut-être même un peu fâché. Mais l'amour a pardonné.

Le pardon est difficile. Il demande de l'humilité, de la générosité, du temps. Parfois, on n'y arrive pas tout seul. Mais Dieu nous donne sa grâce. Avec lui, tout est possible.

Si des blessures existent dans votre famille, si des relations sont brisées, confiez-les à la Sainte Famille. Demandez la grâce du pardon, de la réconciliation, de la paix.''',
      priere: '''
Sainte Famille de Nazareth,
vous qui avez vécu dans la paix et l'harmonie,
apprenez-nous l'art du pardon.

Aidez-nous à reconnaître nos torts,
à demander pardon avec humilité,
à accueillir le pardon des autres avec gratitude.

Guérissez les blessures qui nous séparent,
apaisez les rancœurs qui nous empoisonnent,
réconciliez-nous les uns avec les autres.

Que votre exemple nous aide
à refaire l'unité dans notre famille
et à retrouver la paix du cœur.

Sainte Famille de Nazareth, priez pour nous.
Amen.''',
    ),
    JourNeuvaine(
      numero: 8,
      titre: 'L\'éducation des enfants',
      verset: 'Luc 2, 51-52',
      meditation: '''
À Nazareth, Joseph et Marie ont éduqué Jésus. Ils lui ont appris à prier, à connaître les Écritures, à vivre en homme bon et juste. Joseph lui a transmis son métier, Marie lui a appris les gestes du quotidien.

L'éducation est une mission exigeante. Les parents d'aujourd'hui se sentent souvent dépassés. Comment éduquer dans un monde qui change si vite ? Comment transmettre des valeurs quand tout semble les contredire ? Comment être présent quand le travail accapare ?

La Sainte Famille nous rappelle que l'éducation passe d'abord par l'exemple. Jésus a appris à prier en voyant Joseph et Marie prier. Il a appris à aimer en les voyant s'aimer. Il a appris à servir en les voyant se servir mutuellement.

Confions à la Sainte Famille nos enfants, nos adolescents, nos jeunes adultes. Demandons-leur de nous aider à être pour eux des éducateurs selon leur cœur.''',
      priere: '''
Sainte Famille de Nazareth,
vous qui avez éduqué Jésus avec amour,
je vous confie tous les enfants de notre famille.

Joseph, père nourricier,
apprends aux pères à être des guides patients et aimants.
Marie, mère attentive,
apprends aux mères à être des présences douces et rassurantes.
Jésus, enfant obéissant,
aide nos enfants à grandir en sagesse et en grâce.

Donne aux parents la force d'éduquer,
la sagesse de transmettre,
la patience de corriger avec amour.
Fais de nos foyers des écoles de vie et de sainteté.

Sainte Famille de Nazareth, priez pour nous.
Amen.''',
    ),
    JourNeuvaine(
      numero: 9,
      titre: 'La Sainte Famille, modèle de toutes les familles',
      verset: 'Luc 2, 51-52',
      meditation: '''
Au terme de cette neuvaine, nous contemplons la Sainte Famille comme le modèle de toutes les familles chrétiennes. Pendant trente ans, Joseph, Marie et Jésus ont vécu ensemble dans l'amour, la paix et la simplicité. Leur foyer était un lieu de prière, de travail et de tendresse.

Bien sûr, cette famille était unique : elle abritait le Fils de Dieu fait homme et sa Mère immaculée. Pourtant, elle a connu les joies et les peines de toutes les familles : la naissance d'un enfant, l'éducation, le travail quotidien, la perte de Jésus au Temple, la fuite en Égypte.

La Sainte Famille nous montre qu'il est possible de vivre en famille selon Dieu. L'amour, le respect, le pardon, la prière en commun sont les clés d'un foyer heureux. Joseph, Marie et Jésus sont là pour nous aider à construire notre famille sur ces fondements.

Aujourd'hui, confions notre famille à la Sainte Famille de Nazareth. Demandons-leur de nous apprendre à nous aimer comme ils se sont aimés.''',
      priere: '''
Sainte Famille de Nazareth,
Jésus, Marie et Joseph,
modèle de toutes les familles chrétiennes,
regardez avec tendresse notre famille.

Apprenez-nous à nous aimer comme vous vous êtes aimés,
à nous respecter, à nous pardonner,
à prier ensemble et à nous soutenir mutuellement.

Que notre foyer soit, comme le vôtre,
un lieu de paix, de joie et de sainteté.
Que chacun y grandisse en sagesse et en grâce
devant Dieu et devant les hommes.

Et quand viendra pour nous l'heure du départ,
accueillez-nous dans la famille éternelle,
auprès de Dieu notre Père, pour les siècles des siècles.

Sainte Famille de Nazareth, priez pour nous.
Amen.''',
    ),
  ],
),

// NEUVAINE 7 : Neuvaine à la Sainte Famille
Neuvaine(
  id: 'neuvaine_saint_joe',
  titre: 'Neuvaine à Saint Joseph',
  description: '9 jours pour priez le Seigneur à travers Saint Joseph pour la famille, le travail, la santé.',
  imageUrl: 'assets/images/neuvaine_famille.jpg',
  couleurHex: '0xFF0F8A84', // Bleu
  jours: [
    JourNeuvaine(
      numero: 1,
      titre: 'Saint Joseph, mémoire du Père ',
      //verset: 'Colossiens 3, 12-14',
      meditation: '''
À ton image, Saint Joseph, puissions-nous 
vivre nos vies dans l’écoute et le respect de 
tous ceux et celles que nous rencontrons. Aide
nous à nous recevoir comme fils et fille du Père. ''',
      priere: '''
Je vous salue Joseph + Notre-Père + Je 
vous salue Marie + Gloire au Père''',
    ),
    JourNeuvaine(
      numero: 2,
      titre: 'Saint Joseph, un guide pour l’homme d’aujourd’hui ',
     // verset: 'Matthieu 18, 19-20',
      meditation: '''
Saint Joseph, tu peux être appelé le Saint 
de l’Incarnation. Nous te demandons, Saint 
Joseph, d’être et de demeurer pour nous un 
modèle d’homme et de père juste et 
responsable dont le monde d’aujourd’hui a 
besoin pour sauver nos familles tellement 
menacées. ''',
      priere: '''
Je vous salue Joseph + Notre-Père + Je 
vous salue Marie + Gloire au Père''',
    ),
    JourNeuvaine(
      numero: 3,
      titre: ' Saint Joseph et la maison familiale ',
      //verset: 'Matthieu 13, 55',
      meditation: '''
 Que nos maisons puissent accueillir Marie 
et l’Enfant-Jésus. Ne craignons pas d’accueillir 
la Sainte Famille à notre table. Saint Joseph, 
protecteur de la famille, aide-nous à comprendre 
le sens de la paternité véritable afin que les pères 
de familles retrouvent leur identité profonde. ''',
      priere: '''
Je vous salue Joseph + Notre-Père + Je 
vous salue Marie + Gloire au Père.''',
    ),
    JourNeuvaine(
      numero: 4,
      titre: 'Saint Joseph, modèle d’incarnation',
     // verset: 'Luc 2, 51',
      meditation: '''
Saint Joseph, devant l’Annonciation tu te 
mets à l’école de l’acceptation d’une solitude 
humaine totale pour vivre finalement avec 
Marie. Saint Joseph, explique-nous combien il 
est important de ne pas rompre les liens 
affectifs et conjugaux dans l’épreuve. Aide
nous dans nos familles à triompher de toute 
solitude, de toute révolte, de tout divorce et de 
toute séparation. ''',
      priere: '''
Je vous salue Joseph + Notre-Père + Je 
vous salue Marie + Gloire au Père.''',
    ),
    JourNeuvaine(
      numero: 5,
      titre: 'Saint Joseph,  Lumière dans nos nuits',
     // verset: 'Luc 2, 52',
      meditation: '''
Saint Joseph, tu as été dans l’inquiétude 
de ne pas offrir à ta famille un lieu pour la 
nativité et tu as reçu dans l’obéissance et dans 
la confiance le lieu de l’oubli total : la crèche. 
Au-delà de nos nuits et de nos pauvretés, Saint 
Joseph, apprends-nous à accueillir l’Enfant
Jésus dans notre cœur. ''',
      priere: '''
Je vous salue Joseph + Notre-Père + Je 
vous salue Marie + Gloire au Père.''',
    ),
    JourNeuvaine(
      numero: 6,
      titre: 'Saint Joseph, protecteur dans la maladie',
      //verset: 'Matthieu 2, 13-15',
      meditation: '''
Saint Joseph, aide-nous à ne pas nous 
replier sur nous-mêmes dans l’épreuve et la 
maladie ; encourage-nous à nous ouvrir à la 
seule volonté du Père sur le chemin des 
béatitudes. Nous te confions spécialement nos 
malades. ''',
      priere: '''
Je vous salue Joseph + Notre-Père + Je 
vous salue Marie + Gloire au Père ''',
    ),
    JourNeuvaine(
      numero: 7,
      titre: 'Saint Joseph, protecteur de l’Église ',
     // verset: 'Matthieu 18, 21-22',
      meditation: '''
Saint Joseph, gardien de l’Agneau, 
protecteur de la Sainte Famille, tu es devenu, 
par la grâce du Père, le gardien de l’Église. 
Enseigne-nous à aimer l’Église, à lui être 
toujours fidèle dans l’Eucharistie, dans la 
prière et par le témoignage de notre amour 
inconditionnel. 
''',
      priere: '''
Je vous salue Joseph + Notre-Père + Je 
vous salue Marie + Gloire au Père ''',
    ),
    JourNeuvaine(
      numero: 8,
      titre: 'Saint Joseph est au cœur de la communion fraternelle.',
     // verset: 'Luc 2, 51-52',
      meditation: '''
Par l’union aux Cœurs de Jésus et de 
Marie, nous communions au cœur doux et juste 
de Joseph. Saint Joseph, apprend-nous à être 
amour et instrument de paix dans notre vie 
quotidienne pour tous ceux et celles qui 
attendent notre aide. ''',
      priere: '''
Je vous salue Joseph + Notre-Père + Je 
vous salue Marie + Gloire au Père''',
    ),
    JourNeuvaine(
      numero: 9,
      titre: 'Saint Joseph, patron de la bonne mort et des âmes du Purgatoire.',
     // verset: 'Luc 2, 51-52',
      meditation: '''
Jésus, Marie, Joseph, priez pour nous et 
tous les membres de nos familles au moment 
de la mort. Nous vous confions spécialement 
tous ceux et celles qui nous sont chers, surtout 
nos défunts. Que le Seigneur les accueille dans 
son paradis où tous ensemble ils jouissent de la 
béatitude éternelle.''',
      priere: '''
Je vous salue Joseph + Notre-Père + Je 
vous salue Marie + Gloire au Père''',
    ),
  ],
),

// NEUVAINE 8 : 
Neuvaine(
  id: 'neuvaine_saint_joe',
  titre: 'Neuvaine à Saint Joseph',
  description: '9 jours pour priez le Seigneur à travers Saint Joseph pour la famille, le travail, la santé.',
  imageUrl: 'assets/images/neuvaine_famille.jpg',
  couleurHex: '0xFF0F8A84', // Bleu
  jours: [
    JourNeuvaine(
      numero: 1,
      titre: 'St Joseph, Adorateur de Jésus ',
      //verset: 'Colossiens 3, 12-14',
      meditation: '''
Saint Joseph, après la Très Sainte 
Vierge, a été le premier et le plus 
parfait Seigneur. Comme le Verbe incarné 
devait être glorifié par les 
adorations de Marie et de Joseph, 
qui l’indifférence et de l’ingratitude de 
ses créatures ! Saint Joseph adorait 
le Verbe incarné en union avec sa 
divine Mère, en union avec toutes les pensées, les actes d’adoration, d’amour, 
de louanges de Jésus pour son Père et de charité envers les hommes pour 
lesquels il s’était incarné. 
adorateur le de Notre dédommageaient de L’adoration de saint Joseph suivait le mystère présent et actuel, la grâce, 
l’esprit, la vertu de ce mystère. Dans l’Incarnation, il adorait l’anéantissement 
du Fils de Dieu ; à Bethléem, sa pauvreté ; à Nazareth, son silence, sa 
faiblesse, son obéissance, ses vertus, dont il avait une connaissance très 
grande, dont il voyait l’intention, le sacrifice à l’amour et à la gloire du Père 
céleste. 
Saint Joseph adorait, intérieurement du moins, tout ce que Jésus disait et 
pensait. Le Saint-Esprit le lui manifestait, afin qu’il pût s’y unir, et glorifier 
le Père céleste en union avec son divin Fils notre Sauveur. De sorte que la vie 
de saint Joseph fut une vie d’adoration de Jésus, mais d’adoration parfaite. 
Je m’unirai donc bien à ce saint adorateur, afin qu’il m’apprenne à adorer 
Notre-Seigneur et à me faire entrer en société avec lui, afin que je sois le 
Joseph de l’Eucharistie comme il a été le Joseph de Nazareth. 
Notre Père, 10 Je vous salue Marie, Gloire au Père.
\n
Saint Pierre-Julien Eymard  ''',
      priere: '''
 Prière d’intercession 
« Saint Joseph, père nourricier si fidèle de l’Enfant divin, époux virginal de 
la Mère de Dieu, puissant Protecteur de la sainte Eglise, nous venons vers Toi 
pour nous recommander à ta Protection spéciale. Tu n’as rien cherché en ce 
monde sinon la Gloire de Dieu et le bien du prochain. Tout donné au Sauveur, 
c’était ta joie de prier, de travailler, de te sacrifier et d’endurer pour Lui les 
difficultés de la vie. Tu étais inconnu en ce monde et cependant connu de 
Jésus : Ses regards reposaient avec complaisance sur ta vie simple et cachée 
en Lui ! Saint Joseph, tu as déjà aidé tant d’hommes, nous venons vers toi 
avec une grande confiance. Tu vois dans la Lumière de Dieu ce qui nous 
manque, tu connais nos soucis, nos difficultés, nos peines. Nous 
recommandons à ta sollicitude paternelle cette (ces) affaire(s) 
particulière(s)…… (mentionner ici nos intentions particulières, nos soucis de 
santé, de famille ou de travail). Nous la (les) mettons entre tes mains qui ont 
sauvé Jésus Enfant. Mais avant tout, obtiens-nous la Grâce de ne jamais être 
séparés de Jésus par le péché, de Le connaître et de L’aimer toujours plus, 
ainsi que sa Très Sainte Mère. Accorde-nous de vivre toujours en présence de 
Dieu, de tout faire pour sa Gloire et le bien des âmes, et d’arriver un jour à la vision 
bienheureuse de Dieu pour Le louer éternellement avec toi. Ainsi soit-il. » 
Frère Maximilien-Marie du Sacré-Cœur, fondateur du refuge de ND de la Compassion 
 Je te salue Joseph 
Je te salue Joseph, toi que la grâce divine a comblé ; le Sauveur a reposé dans 
tes bras et grandi sous tes yeux ; tu es béni entre tous les hommes et Jésus, 
l’Enfant divin de ta virginale Épouse est béni. 
Saint Joseph, donné pour père au Fils de Dieu, prie pour nous dans nos soucis 
de famille, de santé et de travail, jusqu’à nos derniers jours, et daigne nous 
secourir à l’heure de notre mort. Amen''',
    ),
    JourNeuvaine(
      numero: 2,
      titre: 'St Joseph, espoir des malades ',
     // verset: 'Matthieu 18, 19-20',
      meditation: '''
« Grand Saint Joseph, époux de la Mère de Dieu, Toi qui protégeas l'Enfant 
Jésus en veillant sur son intégrité physique et sur sa santé, nous te confions 
aujourd'hui spécialement les malades. Aide les Prêtres à cultiver en eux la 
charité ardente de Jésus thérapeute, pour les pauvres malades en qui Ils 
verront Jésus souffrant. Donne à chacun de faire un bon usage des moyens de 
communication, pour échanger des nouvelles avec ses proches et exercer 
l'office de consolateur ». 
Joseph, très courageux, prie pour nous ! 
Consolation des malheureux, prie pour nous ! 
Espérance des malades, prie pour nous ! 
Patron des mourants, prie pour nous ! 
Protecteur de la Sainte Eglise, prie pour nous ! 
Ainsi soit-il.
Notre Père, 10 Je vous salue Marie, Gloire au Père.
\n                                                
Abbé Christophe Beaublat – le 19 mars 2020 ''',
      priere: '''
 Prière d’intercession 
« Saint Joseph, père nourricier si fidèle de l’Enfant divin, époux virginal de 
la Mère de Dieu, puissant Protecteur de la sainte Eglise, nous venons vers Toi 
pour nous recommander à ta Protection spéciale. Tu n’as rien cherché en ce 
monde sinon la Gloire de Dieu et le bien du prochain. Tout donné au Sauveur, 
c’était ta joie de prier, de travailler, de te sacrifier et d’endurer pour Lui les 
difficultés de la vie. Tu étais inconnu en ce monde et cependant connu de 
Jésus : Ses regards reposaient avec complaisance sur ta vie simple et cachée 
en Lui ! Saint Joseph, tu as déjà aidé tant d’hommes, nous venons vers toi 
avec une grande confiance. Tu vois dans la Lumière de Dieu ce qui nous 
manque, tu connais nos soucis, nos difficultés, nos peines. Nous 
recommandons à ta sollicitude paternelle cette (ces) affaire(s) 
particulière(s)…… (mentionner ici nos intentions particulières, nos soucis de 
santé, de famille ou de travail). Nous la (les) mettons entre tes mains qui ont 
sauvé Jésus Enfant. Mais avant tout, obtiens-nous la Grâce de ne jamais être 
séparés de Jésus par le péché, de Le connaître et de L’aimer toujours plus, 
ainsi que sa Très Sainte Mère. Accorde-nous de vivre toujours en présence de 
Dieu, de tout faire pour sa Gloire et le bien des âmes, et d’arriver un jour à la vision 
bienheureuse de Dieu pour Le louer éternellement avec toi. Ainsi soit-il. » 
Frère Maximilien-Marie du Sacré-Cœur, fondateur du refuge de ND de la Compassion 
 Je te salue Joseph 
Je te salue Joseph, toi que la grâce divine a comblé ; le Sauveur a reposé dans 
tes bras et grandi sous tes yeux ; tu es béni entre tous les hommes et Jésus, 
l’Enfant divin de ta virginale Épouse est béni. 
Saint Joseph, donné pour père au Fils de Dieu, prie pour nous dans nos soucis 
de famille, de santé et de travail, jusqu’à nos derniers jours, et daigne nous 
secourir à l’heure de notre mort. Amen''',
    ),
    JourNeuvaine(
      numero: 3,
      titre: '  St Joseph, pilier des familles ',
      //verset: 'Matthieu 13, 55',
      meditation: '''
Saint Joseph, époux de la virginale Mère de Dieu, nous enseigne sans cesse 
toute la vérité divine et toute la dignité humaine contenues dans la vocation 
d’époux et de parents.  
St Joseph, obtiens de Dieu que nous puissions coopérer avec constance à la 
grâce du grand sacrement dans lequel homme et femme se promettent l’un à 
l’autre amour, fidélité et intégrité conjugale jusqu’à la mort. 
St Joseph, homme juste, nous apprend ce qu’est l’amour responsable envers 
ceux que Dieu nous confie d'une manière particulière : l’amour entre époux, 
l’amour entre parents et ceux à qui ils donnent la vie.  
St Joseph, enseigne-nous la responsabilité envers toute vie, du premier 
moment de sa conception jusqu’à son dernier souffle sur terre. Apprends-nous 
le grand respect à avoir pour le don de la vie. Apprends-nous à adorer 
profondément notre Créateur, Père et Donneur de vie.
Notre Père, 10 Je vous salue Marie, Gloire au Père.
\n 
Saint Jean-Paul II  ''',
      priere: '''
 Prière d’intercession 
« Saint Joseph, père nourricier si fidèle de l’Enfant divin, époux virginal de 
la Mère de Dieu, puissant Protecteur de la sainte Eglise, nous venons vers Toi 
pour nous recommander à ta Protection spéciale. Tu n’as rien cherché en ce 
monde sinon la Gloire de Dieu et le bien du prochain. Tout donné au Sauveur, 
c’était ta joie de prier, de travailler, de te sacrifier et d’endurer pour Lui les 
difficultés de la vie. Tu étais inconnu en ce monde et cependant connu de 
Jésus : Ses regards reposaient avec complaisance sur ta vie simple et cachée 
en Lui ! Saint Joseph, tu as déjà aidé tant d’hommes, nous venons vers toi 
avec une grande confiance. Tu vois dans la Lumière de Dieu ce qui nous 
manque, tu connais nos soucis, nos difficultés, nos peines. Nous 
recommandons à ta sollicitude paternelle cette (ces) affaire(s) 
particulière(s)…… (mentionner ici nos intentions particulières, nos soucis de 
santé, de famille ou de travail). Nous la (les) mettons entre tes mains qui ont 
sauvé Jésus Enfant. Mais avant tout, obtiens-nous la Grâce de ne jamais être 
séparés de Jésus par le péché, de Le connaître et de L’aimer toujours plus, 
ainsi que sa Très Sainte Mère. Accorde-nous de vivre toujours en présence de 
Dieu, de tout faire pour sa Gloire et le bien des âmes, et d’arriver un jour à la vision 
bienheureuse de Dieu pour Le louer éternellement avec toi. Ainsi soit-il. » 
Frère Maximilien-Marie du Sacré-Cœur, fondateur du refuge de ND de la Compassion 
 Je te salue Joseph 
Je te salue Joseph, toi que la grâce divine a comblé ; le Sauveur a reposé dans 
tes bras et grandi sous tes yeux ; tu es béni entre tous les hommes et Jésus, 
l’Enfant divin de ta virginale Épouse est béni. 
Saint Joseph, donné pour père au Fils de Dieu, prie pour nous dans nos soucis 
de famille, de santé et de travail, jusqu’à nos derniers jours, et daigne nous 
secourir à l’heure de notre mort. Amen''',
    ),
    JourNeuvaine(
      numero: 4,
      titre: ' St Joseph, modèle des travailleurs ',
     // verset: 'Luc 2, 51',
      meditation: '''
Ô saint Joseph, gardien de Jésus, époux très chaste de Marie, qui as passé 
votre vie à accomplir parfaitement ton devoir en entretenant par le travail de 
tes mains la Sainte Famille de Nazareth, daigne protéger ceux qui, avec 
confiance, se tournent vers toi.  
Tu connais leurs aspirations, leurs angoisses, leurs espérances ; ils recourent 
à toi, car ils savent qu’ils trouveront en toi quelqu’un qui les comprenne et les 
protège.  
Toi aussi, tu as connu l’épreuve, la fatigue, l’épuisement, mais, même au 
milieu de tes préoccupations de la vie matérielle, ton âme, comblée de la paix 
la plus profonde, exultait d’une joie indicible, à cause de l’intimité avec le 
Fils de Dieu confié à tes soins et avec Marie, sa douce Mère.  
Fais que tes protégés comprennent eux aussi qu’ils ne sont pas seuls dans leur 
travail, qu’ils sachent découvrir Jésus à côté d’eux, l’accueillir avec la grâce, 
le garder fidèlement comme tu l’as fait toi-même.  
Obtiens que, dans chaque famille, dans chaque atelier, dans chaque chantier, 
partout où un chrétien travaille, tout soit sanctifié dans la charité, dans la 
patience, dans la justice, dans la préoccupation de bien faire, afin que 
descendent en abondance, sur tous, les dons du céleste amour. 
Notre Père, 10 Je vous salue Marie, Gloire au Père.
\n    
Saint Jean XXIII  ''',
      priere: '''
 Prière d’intercession 
« Saint Joseph, père nourricier si fidèle de l’Enfant divin, époux virginal de 
la Mère de Dieu, puissant Protecteur de la sainte Eglise, nous venons vers Toi 
pour nous recommander à ta Protection spéciale. Tu n’as rien cherché en ce 
monde sinon la Gloire de Dieu et le bien du prochain. Tout donné au Sauveur, 
c’était ta joie de prier, de travailler, de te sacrifier et d’endurer pour Lui les 
difficultés de la vie. Tu étais inconnu en ce monde et cependant connu de 
Jésus : Ses regards reposaient avec complaisance sur ta vie simple et cachée 
en Lui ! Saint Joseph, tu as déjà aidé tant d’hommes, nous venons vers toi 
avec une grande confiance. Tu vois dans la Lumière de Dieu ce qui nous 
manque, tu connais nos soucis, nos difficultés, nos peines. Nous 
recommandons à ta sollicitude paternelle cette (ces) affaire(s) 
particulière(s)…… (mentionner ici nos intentions particulières, nos soucis de 
santé, de famille ou de travail). Nous la (les) mettons entre tes mains qui ont 
sauvé Jésus Enfant. Mais avant tout, obtiens-nous la Grâce de ne jamais être 
séparés de Jésus par le péché, de Le connaître et de L’aimer toujours plus, 
ainsi que sa Très Sainte Mère. Accorde-nous de vivre toujours en présence de 
Dieu, de tout faire pour sa Gloire et le bien des âmes, et d’arriver un jour à la vision 
bienheureuse de Dieu pour Le louer éternellement avec toi. Ainsi soit-il. » 
Frère Maximilien-Marie du Sacré-Cœur, fondateur du refuge de ND de la Compassion 
 Je te salue Joseph 
Je te salue Joseph, toi que la grâce divine a comblé ; le Sauveur a reposé dans 
tes bras et grandi sous tes yeux ; tu es béni entre tous les hommes et Jésus, 
l’Enfant divin de ta virginale Épouse est béni. 
Saint Joseph, donné pour père au Fils de Dieu, prie pour nous dans nos soucis 
de famille, de santé et de travail, jusqu’à nos derniers jours, et daigne nous 
secourir à l’heure de notre mort. Amen''',
    ),
    JourNeuvaine(
      numero: 5,
      titre: ' St Joseph, père de tendresse',
     // verset: 'Luc 2, 52',
      meditation: '''
Glorieux Saint Joseph, époux de Marie, accorde-nous ta protection paternelle, 
nous t’en supplions par le Cœur de Jésus et le Cœur Immaculé de Marie. Ô 
toi dont la puissance s’étend à toutes nos nécessités et sait rendre possibles les 
choses les plus impossibles, ouvre tes yeux de père sur les intérêts de tes 
enfants. Dans l’embarras et la peine qui nous pressent, nous recourons à toi 
avec confiance. Daigne prendre sous ta charitable conduite cet intérêt 
important et difficile, cause de notre inquiétude. Fais que son heureuse issue 
tourne à la Gloire de Dieu et au bien de ses dévoués serviteurs.  
Ô toi que l’on n’a jamais invoqué en vain, aimable Saint Joseph, toi dont le 
crédit est si puissant auprès de Dieu que l’on a pu dire « au Ciel Saint Joseph 
commande plutôt qu’il ne supplie », tendre père, prie pour nous Jésus, 
prie pour nous Marie. Sois notre avocat 
auprès de ce Divin Fils dont tu as été ici-bas 
le père nourricier si attentif, si aimant, et le 
protecteur fidèle. Sois notre avocat auprès 
de Marie, dont tu as été l’époux si aimant et 
si tendrement aimé. Ajoute à toutes tes 
gloires celle de gagner la cause difficile que 
nous te confions. 
Nous croyons, oui, nous croyons que tu 
peux exaucer nos vœux en nous délivrant 
des peines qui nous accablent et des 
amertumes dont notre âme est abreuvée. 
Nous avons de plus la ferme confiance que 
tu ne négligeras rien en faveur des affligés 
qui t’implorent. 
Humblement prosternés à tes pieds, bon 
Saint Joseph, nous t’en conjurons, aie pitié de nos gémissements et de nos 
larmes. Couvre-nous du manteau de tes miséricordes et bénis-nous. Amen
Notre Père, 10 Je vous salue Marie, Gloire au Père.
 \n
St François de Sales ''',
      priere: '''
 Prière d’intercession 
« Saint Joseph, père nourricier si fidèle de l’Enfant divin, époux virginal de 
la Mère de Dieu, puissant Protecteur de la sainte Eglise, nous venons vers Toi 
pour nous recommander à ta Protection spéciale. Tu n’as rien cherché en ce 
monde sinon la Gloire de Dieu et le bien du prochain. Tout donné au Sauveur, 
c’était ta joie de prier, de travailler, de te sacrifier et d’endurer pour Lui les 
difficultés de la vie. Tu étais inconnu en ce monde et cependant connu de 
Jésus : Ses regards reposaient avec complaisance sur ta vie simple et cachée 
en Lui ! Saint Joseph, tu as déjà aidé tant d’hommes, nous venons vers toi 
avec une grande confiance. Tu vois dans la Lumière de Dieu ce qui nous 
manque, tu connais nos soucis, nos difficultés, nos peines. Nous 
recommandons à ta sollicitude paternelle cette (ces) affaire(s) 
particulière(s)…… (mentionner ici nos intentions particulières, nos soucis de 
santé, de famille ou de travail). Nous la (les) mettons entre tes mains qui ont 
sauvé Jésus Enfant. Mais avant tout, obtiens-nous la Grâce de ne jamais être 
séparés de Jésus par le péché, de Le connaître et de L’aimer toujours plus, 
ainsi que sa Très Sainte Mère. Accorde-nous de vivre toujours en présence de 
Dieu, de tout faire pour sa Gloire et le bien des âmes, et d’arriver un jour à la vision 
bienheureuse de Dieu pour Le louer éternellement avec toi. Ainsi soit-il. » 
Frère Maximilien-Marie du Sacré-Cœur, fondateur du refuge de ND de la Compassion 
 Je te salue Joseph 
Je te salue Joseph, toi que la grâce divine a comblé ; le Sauveur a reposé dans 
tes bras et grandi sous tes yeux ; tu es béni entre tous les hommes et Jésus, 
l’Enfant divin de ta virginale Épouse est béni. 
Saint Joseph, donné pour père au Fils de Dieu, prie pour nous dans nos soucis 
de famille, de santé et de travail, jusqu’à nos derniers jours, et daigne nous 
secourir à l’heure de notre mort. Amen''',
    ),
    JourNeuvaine(
      numero: 6,
      titre: 'St Joseph, maître d’amour',
      //verset: 'Matthieu 2, 13-15',
      meditation: '''
Silence de présence et d’écoute, Saint Joseph, homme au cœur profond, tu 
communies à tous les mystères, au-delà des mots, tu te caches en Dieu même. 
Dans ce silence, la vie de la grâce se plaît, se déploie sans frein, porte du fruit. 
Enseigne-nous la vie intérieure, l’art de se diriger là où il faut, au cœur de 
notre cœur, à la rencontre de l’Ami véritable. Aide-nous à y demeurer, à y 
bâtir notre tente, à travers tout. Rappelle-nous, surtout, que la prière est 
présence au grand Présent, ardente compagnie à l’Hôte divin, qu’elle se 
nourrit de recueillement et de silence.  
Aide-nous à recevoir ce sens de Dieu et à approfondir le métier d’éternité qui 
sera le nôtre aux siècles des siècles : l’art d’aimer en se laissant aimer. 
Apprends-nous à aimer humainement dans la plénitude divine de toute 
affection authentique, à aimer comme Dieu aime, aimer infiniment, aimer en 
vérité, aimer dans le don de soi, aimer pour porter l’autre au sommet de lui
même jusqu’au niveau du cœur de Dieu.
Notre Père, 10 Je vous salue Marie, Gloire au Père.
 \n
Frère Marie-Pierre de l’Amour miséricordieux, o.c.d et l’Abbé Maurice Zundel  ''',
      priere: '''
 Prière d’intercession 
« Saint Joseph, père nourricier si fidèle de l’Enfant divin, époux virginal de 
la Mère de Dieu, puissant Protecteur de la sainte Eglise, nous venons vers Toi 
pour nous recommander à ta Protection spéciale. Tu n’as rien cherché en ce 
monde sinon la Gloire de Dieu et le bien du prochain. Tout donné au Sauveur, 
c’était ta joie de prier, de travailler, de te sacrifier et d’endurer pour Lui les 
difficultés de la vie. Tu étais inconnu en ce monde et cependant connu de 
Jésus : Ses regards reposaient avec complaisance sur ta vie simple et cachée 
en Lui ! Saint Joseph, tu as déjà aidé tant d’hommes, nous venons vers toi 
avec une grande confiance. Tu vois dans la Lumière de Dieu ce qui nous 
manque, tu connais nos soucis, nos difficultés, nos peines. Nous 
recommandons à ta sollicitude paternelle cette (ces) affaire(s) 
particulière(s)…… (mentionner ici nos intentions particulières, nos soucis de 
santé, de famille ou de travail). Nous la (les) mettons entre tes mains qui ont 
sauvé Jésus Enfant. Mais avant tout, obtiens-nous la Grâce de ne jamais être 
séparés de Jésus par le péché, de Le connaître et de L’aimer toujours plus, 
ainsi que sa Très Sainte Mère. Accorde-nous de vivre toujours en présence de 
Dieu, de tout faire pour sa Gloire et le bien des âmes, et d’arriver un jour à la vision 
bienheureuse de Dieu pour Le louer éternellement avec toi. Ainsi soit-il. » 
Frère Maximilien-Marie du Sacré-Cœur, fondateur du refuge de ND de la Compassion 
 Je te salue Joseph 
Je te salue Joseph, toi que la grâce divine a comblé ; le Sauveur a reposé dans 
tes bras et grandi sous tes yeux ; tu es béni entre tous les hommes et Jésus, 
l’Enfant divin de ta virginale Épouse est béni. 
Saint Joseph, donné pour père au Fils de Dieu, prie pour nous dans nos soucis 
de famille, de santé et de travail, jusqu’à nos derniers jours, et daigne nous 
secourir à l’heure de notre mort. Amen''',
    ),
    JourNeuvaine(
      numero: 7,
      titre: ' St Joseph, guide de vie intérieure',
     // verset: 'Matthieu 18, 21-22',
      meditation: '''
Joseph, on t’appelle le juste, le charpentier, le silencieux… Moi, je veux 
t’appeler mon ami. Avec Jésus, ton fils et mon Sauveur, avec Marie ton 
épouse et ma mère, tu as ta place dans mon cœur, tu as place dans ma vie. 
Prends ma main et conduis-moi lorsque l’ombre et la nuit rendent mes pas 
incertains. Toi qui as cherché le Seigneur, toi qui l’as trouvé, dis-moi où il 
est ! Dis-moi où il est quand les jours succèdent aux jours, remplis de travail 
et de soucis ou de solitude et d’ennui ! Dis-moi où il est quand l’épreuve et la 
souffrance sont le pain quotidien ! Dis-moi où il est quand l’espérance relève 
mon courage et m’invite à avancer avec plus d’entrain ! Dis-moi où il est 
quand mon cœur veut l’aimer, lui le premier et les autres, avec lui et en lui ! 
Dis-moi où il est quand on vient près de moi chercher réconfort, amitié et 
joie ! Joseph, mon ami, toi qui as cheminé à travers les rayons et les ombres, 
apprends-moi à rencontrer le Seigneur dans le quotidien de ma vie. Toi, le 
témoin étonné de l’action de l’Esprit, aide-moi à reconnaître ses merveilles et 
à lui être soumis. Toi, le grand attentif aux besoins des tiens, garde bien 
ouverts mon cœur et ma main. Amen.
Notre Père, 10 Je vous salue Marie, Gloire au Père.
 \n
Mgr Léon Soulier (1924-2016) 
''',
      priere: '''
 Prière d’intercession 
« Saint Joseph, père nourricier si fidèle de l’Enfant divin, époux virginal de 
la Mère de Dieu, puissant Protecteur de la sainte Eglise, nous venons vers Toi 
pour nous recommander à ta Protection spéciale. Tu n’as rien cherché en ce 
monde sinon la Gloire de Dieu et le bien du prochain. Tout donné au Sauveur, 
c’était ta joie de prier, de travailler, de te sacrifier et d’endurer pour Lui les 
difficultés de la vie. Tu étais inconnu en ce monde et cependant connu de 
Jésus : Ses regards reposaient avec complaisance sur ta vie simple et cachée 
en Lui ! Saint Joseph, tu as déjà aidé tant d’hommes, nous venons vers toi 
avec une grande confiance. Tu vois dans la Lumière de Dieu ce qui nous 
manque, tu connais nos soucis, nos difficultés, nos peines. Nous 
recommandons à ta sollicitude paternelle cette (ces) affaire(s) 
particulière(s)…… (mentionner ici nos intentions particulières, nos soucis de 
santé, de famille ou de travail). Nous la (les) mettons entre tes mains qui ont 
sauvé Jésus Enfant. Mais avant tout, obtiens-nous la Grâce de ne jamais être 
séparés de Jésus par le péché, de Le connaître et de L’aimer toujours plus, 
ainsi que sa Très Sainte Mère. Accorde-nous de vivre toujours en présence de 
Dieu, de tout faire pour sa Gloire et le bien des âmes, et d’arriver un jour à la vision 
bienheureuse de Dieu pour Le louer éternellement avec toi. Ainsi soit-il. » 
Frère Maximilien-Marie du Sacré-Cœur, fondateur du refuge de ND de la Compassion 
 Je te salue Joseph 
Je te salue Joseph, toi que la grâce divine a comblé ; le Sauveur a reposé dans 
tes bras et grandi sous tes yeux ; tu es béni entre tous les hommes et Jésus, 
l’Enfant divin de ta virginale Épouse est béni. 
Saint Joseph, donné pour père au Fils de Dieu, prie pour nous dans nos soucis 
de famille, de santé et de travail, jusqu’à nos derniers jours, et daigne nous 
secourir à l’heure de notre mort. Amen''',
    ),
    JourNeuvaine(
      numero: 8,
      titre: 'St Joseph, protecteur de l’Église',
     // verset: 'Luc 2, 51-52',
      meditation: '''
Ô Bienheureux Joseph, que Dieu a choisi pour porter le nom et la charge d'un 
père à l'égard de Jésus, toi qu'Il a donné comme époux très pur à Marie 
toujours vierge et comme chef à la Sainte Famille sur terre, toi que le Vicaire 
du Christ a choisi comme Patron et Avocat de l'Église universelle, fondée par 
le Christ Seigneur Lui-même, c'est avec la plus grande confiance possible que 
j'implore ton secours très puissant pour cette même Église qui lutte sur terre. 
Protège, je t’en supplie, d'une sollicitude particulière et de cet amour vraiment 
paternel dont tu brûles, le Pontife romain, tous les évêques et prêtres unis au 
Saint-Siège de Pierre. 
Sois le défenseur de tous ceux qui peinent pour sauver les âmes au milieu des 
angoisses et adversités de cette vie.
Fais que tous les peuples se soumettent spontanément à l'Église qui est le 
moyen absolument nécessaire pour obtenir le salut. 
Veux-tu aussi accepter et agréer, très saint Joseph, la donation de moi-même 
que je te fais pleinement et intégralement. Je me voue entièrement à toi, afin 
que tu sois toujours pour moi un père, un protecteur et un guide sur le chemin 
du salut. Obtiens-moi une grande pureté de cœur, un amour ardent de la vie 
intérieure. Fais que je suive aussi moi-même tes traces et que je dirige toutes 
mes actions à la plus grande gloire de Dieu en les unissant aux affections du 
divin Cœur de Jésus et du Cœur Immaculé de la Vierge-Mère. 
Prie enfin pour moi, afin que je puisse participer à la paix et à la joie, dont tu 
as joui toi-même autrefois, en mourant si saintement. Ainsi soit-il. 
Notre Père, 10 Je vous salue Marie, Gloire au Père.
\n
Pape Léon XIII  ''',
      priere: '''
 Prière d’intercession 
« Saint Joseph, père nourricier si fidèle de l’Enfant divin, époux virginal de 
la Mère de Dieu, puissant Protecteur de la sainte Eglise, nous venons vers Toi 
pour nous recommander à ta Protection spéciale. Tu n’as rien cherché en ce 
monde sinon la Gloire de Dieu et le bien du prochain. Tout donné au Sauveur, 
c’était ta joie de prier, de travailler, de te sacrifier et d’endurer pour Lui les 
difficultés de la vie. Tu étais inconnu en ce monde et cependant connu de 
Jésus : Ses regards reposaient avec complaisance sur ta vie simple et cachée 
en Lui ! Saint Joseph, tu as déjà aidé tant d’hommes, nous venons vers toi 
avec une grande confiance. Tu vois dans la Lumière de Dieu ce qui nous 
manque, tu connais nos soucis, nos difficultés, nos peines. Nous 
recommandons à ta sollicitude paternelle cette (ces) affaire(s) 
particulière(s)…… (mentionner ici nos intentions particulières, nos soucis de 
santé, de famille ou de travail). Nous la (les) mettons entre tes mains qui ont 
sauvé Jésus Enfant. Mais avant tout, obtiens-nous la Grâce de ne jamais être 
séparés de Jésus par le péché, de Le connaître et de L’aimer toujours plus, 
ainsi que sa Très Sainte Mère. Accorde-nous de vivre toujours en présence de 
Dieu, de tout faire pour sa Gloire et le bien des âmes, et d’arriver un jour à la vision 
bienheureuse de Dieu pour Le louer éternellement avec toi. Ainsi soit-il. » 
Frère Maximilien-Marie du Sacré-Cœur, fondateur du refuge de ND de la Compassion 
 Je te salue Joseph 
Je te salue Joseph, toi que la grâce divine a comblé ; le Sauveur a reposé dans 
tes bras et grandi sous tes yeux ; tu es béni entre tous les hommes et Jésus, 
l’Enfant divin de ta virginale Épouse est béni. 
Saint Joseph, donné pour père au Fils de Dieu, prie pour nous dans nos soucis 
de famille, de santé et de travail, jusqu’à nos derniers jours, et daigne nous 
secourir à l’heure de notre mort. Amen''',
    ),
    JourNeuvaine(
      numero: 9,
      titre: ' St Joseph, lumière sur notre chemin ',
     // verset: 'Luc 2, 51-52',
      meditation: '''
Saint Joseph, Toi qui as vécu la longue route d’un demain incertain dans ta 
marche vers l’Égypte inconnu, redis-nous, aujourd’hui les paroles de ton fils 
Jésus face à l’avenir : « Pourquoi avez-vous peur ainsi ? Comment n’avez
vous pas de foi ? » (Mc 4, 40).  
Saint Joseph, Toi qui t’es engagé concrètement à marcher, décidé, vers le pays 
inconnu « en prenant avec toi l’Enfant et sa mère » (Lc 2-12), redis-nous, 
aujourd’hui les paroles de ton fils Jésus face à l’avenir : « Ne vous inquiétez 
pas du lendemain. A chaque jour suffit sa peine » (Mt 6, 34).  
Saint Joseph, Toi qui es revenu de l’exil d’Égypte pour venir vivre, à nouveau, 
dans la ville de Nazareth et te faire proche des demandes de tes clients, redis
nous, aujourd’hui les paroles de ton fils Jésus face à l’avenir : « Avance en 
eau profonde » (Lc 5,4) pour « passer sur l’autre rive » (Mc 4, 35).  
Saint Joseph, Toi qui es monté vers Jérusalem pour y vivre avec les tiens la 
Pâque juive, quelle ne fut pas ton inquiétude en découvrant que Jésus n’était 
pas dans la caravane, redis-nous, aujourd’hui les paroles de ton fils Jésus face 
à l’avenir : « Éloigne de moi cette coupe ; pas ce que je veux, mais ce que tu 
veux » (Mc 14, 36). 
Saint Joseph, Toi qui as connu l’angoisse et, par la suite, la joie, en retrouvant 
Jésus enseignant, au Temple, au milieu des docteurs stupéfaits, redis-nous, 
aujourd’hui les paroles de ton fils Jésus face à l’avenir : « Ne craignez point. 
Allez annoncer à mes frères et sœurs qu’ils doivent partir pour la Galilée. Et 
là, ils me verront » (Mt 28, 10). Ainsi soit-il.
Notre Père, 10 Je vous salue Marie, Gloire au Père. 
 \n
Sœur Lise Berger de Saint-Joseph de Saint-Hyacinthe (s.j.s.h.) ''',
      priere: '''
 Prière d’intercession 
« Saint Joseph, père nourricier si fidèle de l’Enfant divin, époux virginal de 
la Mère de Dieu, puissant Protecteur de la sainte Eglise, nous venons vers Toi 
pour nous recommander à ta Protection spéciale. Tu n’as rien cherché en ce 
monde sinon la Gloire de Dieu et le bien du prochain. Tout donné au Sauveur, 
c’était ta joie de prier, de travailler, de te sacrifier et d’endurer pour Lui les 
difficultés de la vie. Tu étais inconnu en ce monde et cependant connu de 
Jésus : Ses regards reposaient avec complaisance sur ta vie simple et cachée 
en Lui ! Saint Joseph, tu as déjà aidé tant d’hommes, nous venons vers toi 
avec une grande confiance. Tu vois dans la Lumière de Dieu ce qui nous 
manque, tu connais nos soucis, nos difficultés, nos peines. Nous 
recommandons à ta sollicitude paternelle cette (ces) affaire(s) 
particulière(s)…… (mentionner ici nos intentions particulières, nos soucis de 
santé, de famille ou de travail). Nous la (les) mettons entre tes mains qui ont 
sauvé Jésus Enfant. Mais avant tout, obtiens-nous la Grâce de ne jamais être 
séparés de Jésus par le péché, de Le connaître et de L’aimer toujours plus, 
ainsi que sa Très Sainte Mère. Accorde-nous de vivre toujours en présence de 
Dieu, de tout faire pour sa Gloire et le bien des âmes, et d’arriver un jour à la vision 
bienheureuse de Dieu pour Le louer éternellement avec toi. Ainsi soit-il. » 
Frère Maximilien-Marie du Sacré-Cœur, fondateur du refuge de ND de la Compassion 
 Je te salue Joseph 
Je te salue Joseph, toi que la grâce divine a comblé ; le Sauveur a reposé dans 
tes bras et grandi sous tes yeux ; tu es béni entre tous les hommes et Jésus, 
l’Enfant divin de ta virginale Épouse est béni. 
Saint Joseph, donné pour père au Fils de Dieu, prie pour nous dans nos soucis 
de famille, de santé et de travail, jusqu’à nos derniers jours, et daigne nous 
secourir à l’heure de notre mort. Amen''',
    ),
  ],
),

// NEUVAINE 9 : Neuvaine à la Sainte Famille
Neuvaine(
  id: 'neuvaine_saint_joe',
  titre: 'Neuvaine à Saint Joseph',
  description: '9 jours pour priez le Seigneur à travers Saint Joseph pour la famille, le travail, la santé.',
  imageUrl: 'assets/images/neuvaine_famille.jpg',
  couleurHex: '0xFF0F8A84', // Bleu
  jours: [
    JourNeuvaine(
      numero: 1,
      titre: 'Saint Joseph, mémoire du Père ',
      //verset: 'Colossiens 3, 12-14',
      meditation: '''
« Joseph fit comme l’Ange du Seigneur lui avait prescrit : il prit chez lui son Epouse ; et sans qu’il l’eût connue, elle enfanta un fils, auquel il donna
le nom de Jésus.»  (Mt 1,24)
Tout arbre a ses racines propres, et chaque arbre donne un fruit qui lui est propre. Mais tout arbre ne se développe pas n’importe où, n’importe
comment ! Chaque terre a une consistance, une composition plus riche qu’une autre terre.
Il en est de même de notre filiation : « Généalogie de JésusChrist, fils de David, fils d’Abraham (…) Jacob engendra Joseph, l’époux de Marie
de laquelle naquit Jésus, que l’on appelle Christ. » (Mt 1,1 et 16)
Joseph est mémoire du Père, il reconnaît la voix du Père, se lève la nuit, se retire en Egypte : « D’Egypte j’ai appelé mon fils » (Os 11,1).
Puis il revient au pays d’Israël : « De toi sortira un chef qui sera pasteur de mon peuple Israël » (Mt 5,1).
Joseph permet donc que s’accomplisse l’oracle des prophètes : « Lorsqu’ils eurent accompli tout ce qui était conforme à la Loi du Seigneur »
(Lc 2,39) et « chaque année ses parents se rendaient à Jérusalem pour la fête de la Pâque » (Lc 2,41).
A l’image de Joseph, puissionsnous vivre nos vies dans l’écoute et le respect de nos pères et mères de la terre afin de faire mémoire de notre
créateur audelà de nos familles humaines.
Aujourd’hui, disons avec saint Joseph : « Je te fiance à moi pour toujours. Je te fiance à moi pour la justice et le droit, par la grâce et la
miséricorde, je te fiance à moi par la fidélité, et toi, tu connaîtras le Seigneur. » (Os 2,2122 )
Nous pouvons dire la prière de Jésus : « Jésus, Fils de Dieu, aie pitié de moi pêcheur »
Prière du jour à saint Joseph : Joseph, comme tu étais le père sur terre de Jésus, je te prends aussi pour père et pour modèle. Je te prie
assidument pour que tu viennes à mon secours et prennes ma défense. J’ai besoin de ta protection puissante pour traverser ces temps
difficiles. Je me rappelle ta totale soumission au Vouloir de Dieu. Apprendsmoi à dire avec un véritable esprit de foi « Que ta Volonté soit
faite, ô Seigneur ! ».Je te demande saint Joseph de multiplier cette invocation autant de fois qu’il y a d’hommes, en les rendant tous dociles
au Divin Vouloir. Que la force et le courage puissent abonder pour tous ceux qui travaillent à édifier un monde de sagesse selon l’Evangile.
O Saint Joseph, je désire, moi aussi, participer à ce mystère salvifique, pour que le Dieu de l’Incarnation puisse habiter en moi et que je
puisse être fidèle à tous ses projets. A ton image, saint Joseph, que je vive ma vie dans l’écoute et le respect de tous ceux et celles que je
rencontre. Aidemoi à me recevoir comme fils et fille du Père.
(Prendre un temps de silence et offrir à saint Joseph ma vie de ce temps, avec ses joies et ses difficultés).
Prières quotidiennes''',
      priere: '''
PRIERES POUR CHAQUE JOUR DE LA NEUVAINE
Le signe de la croix : Au Nom du Père et du Fils et du Saint Esprit
Le Je crois en Dieu
Prière à l’EspritSaint : Père Eternel, au Nom de JésusChrist et par l’intercession de Marie, la Vierge Immaculée, et de saint Joseph, son
époux, envoyezmoi le SaintEsprit.
Venez, SaintEsprit, dans mon cœur et sanctifiezle.
Venez, père des pauvres et soulagezmoi.
Venez, auteur de tout bien et consolezmoi.
Venez, lumière des esprits et éclairezmoi.
Venez, consolateur des âmes et réconfortezmoi.
Venez, doux hôte des cœurs et ne vous éloignez pas de moi.
Venez, vrai rafraichissement de ma vie et restaurez-moi.
Je vous salue Joseph
Je vous salue Joseph, vous que la grâce divine a comblé ; le Sauveur a reposé dans vos bras et grandi sous vos yeux ; vous êtes béni entre tous
les hommes et Jésus, l’Enfant divin de votre virginale Epouse est béni. Saint Joseph, donné pour père au Fils de Dieu, priez pour nous dans nos
soucis de famille, de santé et de travail, jusqu’à nos derniers jours, et daignez nous secourir à l’heure de notre mort. Amen
Une dizaine de chapelet : le Notre Père, dix Je vous salue Marie, le Gloire au Père''',
    ),
    JourNeuvaine(
      numero: 2,
      titre: 'Saint Joseph, un guide pour l’homme d’aujourd’hui ',
     // verset: 'Matthieu 18, 19-20',
      meditation: '''
« Marie sa mère était fiancée à Joseph. » (Mt 1,18)
Joseph fiancé, envisage Marie comme une épouse, une mère de famille pour qui il prépare un logis familial, il prépare un statut social : « Joseph
parce qu’il était de la maison de la lignée de David monta en Judée afin de s’y faire inscrire avec Marie » ( Lc 2,4 5)
Joseph, chaque matin œuvre physiquement, il a un métier dur. Il fournit à sa famille le pain quotidien et enseigne à Jésus la tradition. Il prépare et
danse le Shabbat, se rend au Temple et assure une vie sociale pour sa famille à Nazareth.
Il est frère consacré au monastère de Nazareth. Il est veilleur du silence. Mais en homme protecteur, il sera élève du Père pendant toute sa
retraite à Nazareth.
Fidèle et juste, saint Joseph va se souscrire aux temps de ce petit monastère, maison du Père sur terre.
Que saint Joseph nous enseigne le respect des temps de prière. N’hésitons pas à demander à saint Joseph d’être et de demeurer pour nous un
modèle d’homme, de père juste et responsable dont le monde d’aujourd’hui a besoin pour sauver la famille.
Prière du jour à saint Joseph : Joseph, modèle de tous les travailleurs, je te prie de donner ton amour du travail à tous ceux qui en ont un.
Qu’ils ne gaspillent ni les fatigues de leurs mains, ni celles de leur esprit, mais qu’en les offrant au Père, ils les transforment en une
précieuse monnaie, grâce à laquelle ils pourront mériter une récompense éternelle. Seigneur, par l’intercession de saint Joseph, modèle
des bons ouvriers, je t’en prie : enseignemoi l’amour pour mon travail. Que j’apprenne à l’accomplir avec justice et honnêteté. O Saint
Joseph, qu’à ton exemple, je sache travailler avec reconnaissance, joie, ordre, paix, modération et patience. Par mon labeur, apprendsmoi
à utiliser tous les dons reçus de Dieu. Avec Joseph, modèle des priants, Seigneur, je t’en prie : faismoi découvrir les paroles de louange
qui glorifient le seul vrai Dieu, de qui viennent toute sagesse et toute sainteté. O Saint Joseph, en dépit de tous les bruits de ce monde,
apprends-moi à prier avec le cœur et donnemoi d’aimer les moments précieux où j’invite Dieu à partager ma vie.
(Prendre un temps de silence et offrir à saint Joseph telle ou telle personne que vous savez en difficulté dans son travail).
Prières quotidiennes ''',
      priere: '''
PRIERES POUR CHAQUE JOUR DE LA NEUVAINE
Le signe de la croix : Au Nom du Père et du Fils et du Saint Esprit
Le Je crois en Dieu
Prière à l’EspritSaint : Père Eternel, au Nom de JésusChrist et par l’intercession de Marie, la Vierge Immaculée, et de saint Joseph, son
époux, envoyezmoi le SaintEsprit.
Venez, SaintEsprit, dans mon cœur et sanctifiezle.
Venez, père des pauvres et soulagezmoi.
Venez, auteur de tout bien et consolezmoi.
Venez, lumière des esprits et éclairezmoi.
Venez, consolateur des âmes et réconfortezmoi.
Venez, doux hôte des cœurs et ne vous éloignez pas de moi.
Venez, vrai rafraichissement de ma vie et restaurez-moi.
Je vous salue Joseph
Je vous salue Joseph, vous que la grâce divine a comblé ; le Sauveur a reposé dans vos bras et grandi sous vos yeux ; vous êtes béni entre tous
les hommes et Jésus, l’Enfant divin de votre virginale Epouse est béni. Saint Joseph, donné pour père au Fils de Dieu, priez pour nous dans nos
soucis de famille, de santé et de travail, jusqu’à nos derniers jours, et daignez nous secourir à l’heure de notre mort. Amen
Une dizaine de chapelet : le Notre Père, dix Je vous salue Marie, le Gloire au Père''',
    ),
    JourNeuvaine(
      numero: 3,
      titre: ' Saint Joseph et la maison familiale ',
      //verset: 'Matthieu 13, 55',
      meditation: '''
« Ils retournèrent en Galilée, à Nazareth, leur ville » (Lc 2,39)
Après le temps de l’exil, le temps du désert, l’inquiétude, saint Joseph nous montre le chemin de Nazareth. Pendant près de trente ans,
Joseph vit avec Jésus. S’il travaille, ce divin enfant travaille avec lui. S’il prie, s’il parle, s’il sort dans les rues de Nazareth, Jésus est avec lui.
A la table de famille, comme dans l’atelier, Jésus a sa place.
Nazareth est une école du silence, de la patience et de l’apprentissage à la pauvreté.
Nazareth est un atelier où se tisse le tissu le plus noble, l’écharpe royale ! Où se construit le tabernacle au bois le plus noble. Car tout se fait
en présence de Jésus.
Pouvonsnous sérieusement, comme saint Joseph, nous rendre le témoignage que Jésus est avec nous, depuis la première heure du jour,
jusqu’à la dernière ? L’invitonsnous à notre travail, à notre repos ? Lui offronsnous nos pensées, nos affections, nos paroles ? Marchons
nous en sa présence ? 
Saint Joseph, secours des faibles, aidenous à offrir à Jésus toute notre vie, toutes nos joies et nos épreuves. Je te prie pour tous ceux qui,
dans les difficultés, se laissent abattre. Donnenous la force nécessaire et la joie dans la douleur.
Prière du jour à saint Joseph
Saint Joseph, protecteur de la famille, aidenous à comprendre le sens de la paternité véritable afin que les pères de familles retrouvent leur
identité profonde. Enseignenous à éduquer nos enfants dans la foi, la pureté, le dévouement et le respect de tout ce qui est beau. Je te
consacre les pères de famille afin qu’ils soient tes imitateurs dans la direction de cette cellule de la société, qui a tant besoin d’être
assainie. 
(Prendre un temps de silence et offrir à saint Joseph tel ou tel papa qui a du mal avec ses enfants, avec l’éducation, ou des enfants
difficiles).
Par l’intercession de saint Joseph, modèle des soutiens de famille, Seigneur, nous t’en prions : donne à nos enfants une vision du monde
qui les engage à Te suivre dans le seul chemin qu’est la vérité. 
Prières quotidiennes ''',
      priere: '''
PRIERES POUR CHAQUE JOUR DE LA NEUVAINE
Le signe de la croix : Au Nom du Père et du Fils et du Saint Esprit
Le Je crois en Dieu
Prière à l’EspritSaint : Père Eternel, au Nom de JésusChrist et par l’intercession de Marie, la Vierge Immaculée, et de saint Joseph, son
époux, envoyezmoi le SaintEsprit.
Venez, SaintEsprit, dans mon cœur et sanctifiezle.
Venez, père des pauvres et soulagezmoi.
Venez, auteur de tout bien et consolezmoi.
Venez, lumière des esprits et éclairezmoi.
Venez, consolateur des âmes et réconfortezmoi.
Venez, doux hôte des cœurs et ne vous éloignez pas de moi.
Venez, vrai rafraichissement de ma vie et restaurez-moi.
Je vous salue Joseph
Je vous salue Joseph, vous que la grâce divine a comblé ; le Sauveur a reposé dans vos bras et grandi sous vos yeux ; vous êtes béni entre tous
les hommes et Jésus, l’Enfant divin de votre virginale Epouse est béni. Saint Joseph, donné pour père au Fils de Dieu, priez pour nous dans nos
soucis de famille, de santé et de travail, jusqu’à nos derniers jours, et daignez nous secourir à l’heure de notre mort. Amen
Une dizaine de chapelet : le Notre Père, dix Je vous salue Marie, le Gloire au Père''',
    ),
    JourNeuvaine(
      numero: 4,
      titre: 'Saint Joseph, modèle d’incarnation',
     // verset: 'Luc 2, 51',
      meditation: '''
« Joseph résolut de la répudier sans bruit. Il avait formé ce dessin, quand l’ange du Seigneur lui apparut en songe. » ( Mt 1,19 )
Saint Joseph, ton silence était voulu et désiré. Ce grand silence t’a permis d’écouter la Voix de Dieu qui te parlait en te guidant toujours et
partout. Tu étais un homme de prière et de recueillement. Ton âme s’entretenait dans les plus saintes pensées. Ton cœur laissait monter vers le
ciel les soupirs les plus ardents. Ton amour pour être caché, n’en était que plus vif.
Prière du jour à saint Joseph : Saint Joseph, devant l’Annonciation, tu te mets à l’école de l’acceptation d’une solitude humaine totale pour
vivre finalement avec Marie. Aidenous dans nos familles à triompher dans le silence, de toute solitude, de toute révolte, de tout divorce et
de toute séparation. A comprendre combien il est important de ne pas rompre des liens affectifs et conjugaux quand une difficulté, une
déception, un sentiment de solitude nous envahit. Car audelà de la souffrance, se présente à nous bien souvent le choix entre l’humilité et
l’orgueil ; le choix entre l’amour et la haine ; le choix entre la vie et la mort.
Je te prie pour tous les époux, afin qu’ils demeurent fidèles aux engagements assumés dans le mariage et que, dans la compréhension et le
support mutuels, ils puissent conduire leur mission à bonne fin. Je te prie particulièrement pour tel mari en difficulté (prendre un temps de
silence et offrir à saint Joseph tel ou tel mari que vous savez en difficulté).
Avec Joseph, modèle de la vie intérieure, Seigneur, je t’en prie : aidemoi à comprendre combien la vie chrétienne n’est rien d’autre que
l’amour de Dieu et du prochain.
Apprendsmoi à faire un peu de silence intérieur. Que par ton intercession j’obtienne cette belle vertu qui consiste à savoir se taire et
écouter.
Prières quotidiennes''',
      priere: '''
PRIERES POUR CHAQUE JOUR DE LA NEUVAINE
Le signe de la croix : Au Nom du Père et du Fils et du Saint Esprit
Le Je crois en Dieu
Prière à l’EspritSaint : Père Eternel, au Nom de JésusChrist et par l’intercession de Marie, la Vierge Immaculée, et de saint Joseph, son
époux, envoyezmoi le SaintEsprit.
Venez, SaintEsprit, dans mon cœur et sanctifiezle.
Venez, père des pauvres et soulagezmoi.
Venez, auteur de tout bien et consolezmoi.
Venez, lumière des esprits et éclairezmoi.
Venez, consolateur des âmes et réconfortezmoi.
Venez, doux hôte des cœurs et ne vous éloignez pas de moi.
Venez, vrai rafraichissement de ma vie et restaurez-moi.
Je vous salue Joseph
Je vous salue Joseph, vous que la grâce divine a comblé ; le Sauveur a reposé dans vos bras et grandi sous vos yeux ; vous êtes béni entre tous
les hommes et Jésus, l’Enfant divin de votre virginale Epouse est béni. Saint Joseph, donné pour père au Fils de Dieu, priez pour nous dans nos
soucis de famille, de santé et de travail, jusqu’à nos derniers jours, et daignez nous secourir à l’heure de notre mort. Amen
Une dizaine de chapelet : le Notre Père, dix Je vous salue Marie, le Gloire au Père''',
    ),
    JourNeuvaine(
      numero: 5,
      titre: 'Saint Joseph,  Lumière dans nos nuits',
     // verset: 'Luc 2, 52',
      meditation: '''
« Or, lorsque les Anges les eurent quittés pour le ciel, les bergers se dirent entre eux : allons donc à Bethléem…Ils vinrent donc en hâte et
trouvèrent Marie, Joseph et le nouveauné couché dans la crèche. » (Lc 2, 1516)
Quand nous désirons très fort quelque chose et que nous ne l’obtenons pas, la souffrance fait son apparition. Quand la nuit occulte nos pensées
et nos décisions, nous sommes dans un désarroi parfois proche du désespoir.
Saint Joseph dans l’inquiétude folle de ne pas offrir à sa famille un lieu pour la nativité, devant le non du monde et devant la nuit des cœurs des
hommes, reçoit dans l’obéissance et dans la confiance le lieu de l’oubli total : une crèche, un reposoir, un hôpital de pauvres.
C’est ce lieu d’aboutissement de toute inquiétude et de toute obscurité qui recevra l’éclairage le plus doux, la lumière la plus forte : l’étoile de la
Rédemption.
Audelà des nuits, saint Joseph nous apprend à adorer, à prendre Jésus contre notre cœur, à embrasser sa tête délicate.
Pour le feu que tu entretiens afin de garder la lampe allumée dans l’exil, dans Bethléem, à Nazareth : saint Joseph sois remercié !
Prière du jour à saint Joseph : Saint Joseph, berger de l’Agneau, tu as été dans l’inquiétude de ne pas offrir à ta famille un lieu pour la
nativité et tu as reçu dans l’obéissance et dans la confiance le lieu de l’oubli total : la crèche.
Audelà de nos nuits et de nos pauvretés, saint Joseph, apprendsmoi à accueillir l’EnfantJésus dans mon cœur et conduismoi au long des
nuits vers la crèche de ma vie. Saint Joseph, très chaste époux de la Vierge Marie, tu offris à Dieu de la manière la plus parfaite chacun de
tes sentiments, chacune de tes pensées et de tes œuvres, en gardant sans tâche ton corps et ton cœur. Avec Joseph, modèle pour tous
ceux qui cherchent la pureté d’âme, Seigneur, je t’en prie : enseignemoi l’amour véritable, pour que je puisse reconnaître Ta présence dans
la fidélité et le respect de mes promesses et de mes engagements.
(Prendre un temps de silence et offrir à saint Joseph tel ou tel parent qui se pose la question de l’avenir face à cette crise qui n’en finit pas,
avec beaucoup d’incertitude pour l’avenir).
O Saint Joseph, toi qui as ouvert la voie au salut du monde par la pureté de ton amour, rendsmoi capable d’être un véritable témoin du Fils
de Dieu dans le monde d’aujourd’hui.
Je te prie pour les jeunes qui, poussés par le désir de se marier ou des tentations, oublient la loi de Dieu, surtout le sixième
Commandement. 
Prières quotidiennes''',
      priere: '''
PRIERES POUR CHAQUE JOUR DE LA NEUVAINE
Le signe de la croix : Au Nom du Père et du Fils et du Saint Esprit
Le Je crois en Dieu
Prière à l’EspritSaint : Père Eternel, au Nom de JésusChrist et par l’intercession de Marie, la Vierge Immaculée, et de saint Joseph, son
époux, envoyezmoi le SaintEsprit.
Venez, SaintEsprit, dans mon cœur et sanctifiezle.
Venez, père des pauvres et soulagezmoi.
Venez, auteur de tout bien et consolezmoi.
Venez, lumière des esprits et éclairezmoi.
Venez, consolateur des âmes et réconfortezmoi.
Venez, doux hôte des cœurs et ne vous éloignez pas de moi.
Venez, vrai rafraichissement de ma vie et restaurez-moi.
Je vous salue Joseph
Je vous salue Joseph, vous que la grâce divine a comblé ; le Sauveur a reposé dans vos bras et grandi sous vos yeux ; vous êtes béni entre tous
les hommes et Jésus, l’Enfant divin de votre virginale Epouse est béni. Saint Joseph, donné pour père au Fils de Dieu, priez pour nous dans nos
soucis de famille, de santé et de travail, jusqu’à nos derniers jours, et daignez nous secourir à l’heure de notre mort. Amen
Une dizaine de chapelet : le Notre Père, dix Je vous salue Marie, le Gloire au Père''',
    ),
    JourNeuvaine(
      numero: 6,
      titre: 'Saint Joseph, protecteur dans la maladie',
      //verset: 'Matthieu 2, 13-15',
      meditation: '''
« Joseph, fils de David, ne crains point de prendre chez toi Marie, ton épouse : car ce qui a été engendré en elle vient de l’Esprit Saint ; elle
enfantera un fils auquel tu donneras le nom de Jésus. » (Mt 1,20)
Toute atteinte physique ou psychologique peut entraver notre marche. Tout état de douleur ou de souffrance peut éveiller en nous dépit, rejet, voir
désir de mort. Tout ce qui nous semble acquis, réussi, peut soudainement basculer, disparaître, s’anéantir, devenir le vide total.
Saint Joseph en présentant Jésus au Temple, avec Marie, donne le nom de Jésus au monde. Audelà de toute souffrance, saint Joseph nous
désigne le Sauveur. Il nous montre le Père. Il dit oui, il se laisse couvrir par l’Esprit, il reconnaît le nom de Dieu.
Saint Joseph, humble devant Dieu, devant le prochain, bien qu’étant de souche royale, tu voulus être considéré comme un simple ouvrier.
Tu ne demandas rien pour toi : ni richesses, ni honneurs, heureux seulement de te sacrifier pour les deux êtres les plus sublimes que le Seigneur
t’avait confiés.
Prière du jour à saint Joseph : Saint Joseph, aidemoi à ne pas me replier sur moimême dans l’épreuve, dans la maladie, encouragemoi à
m’ouvrir à la seule volonté du Père. Je te confie spécialement tous les malades. Avec Joseph, modèle d’obéissance, Seigneur, je t’en prie :
enseignemoi le partage, qui est une des formes de l’amour, pour que je puisse faire, avec joie, la volonté de ton Père qui nous aime
tellement. O Saint Joseph, je veux passer tout le reste de ma vie en accord avec le projet du Créateur pour moi. Aidemoi, afin que chaque
jour, je sois fidèle à Son Amour et à Sa Volonté.
(Prendre un temps de silence et confier à saint Joseph telle ou telle personne malade que nous connaissons, que jamais elle ne désespère
et pense à la mort comme seule issue mais garde toujours le regard tourné vers le Christ).
Prières quotidiennes ''',
      priere: '''
PRIERES POUR CHAQUE JOUR DE LA NEUVAINE
Le signe de la croix : Au Nom du Père et du Fils et du Saint Esprit
Le Je crois en Dieu
Prière à l’EspritSaint : Père Eternel, au Nom de JésusChrist et par l’intercession de Marie, la Vierge Immaculée, et de saint Joseph, son
époux, envoyezmoi le SaintEsprit.
Venez, SaintEsprit, dans mon cœur et sanctifiezle.
Venez, père des pauvres et soulagezmoi.
Venez, auteur de tout bien et consolezmoi.
Venez, lumière des esprits et éclairezmoi.
Venez, consolateur des âmes et réconfortezmoi.
Venez, doux hôte des cœurs et ne vous éloignez pas de moi.
Venez, vrai rafraichissement de ma vie et restaurez-moi.
Je vous salue Joseph
Je vous salue Joseph, vous que la grâce divine a comblé ; le Sauveur a reposé dans vos bras et grandi sous vos yeux ; vous êtes béni entre tous
les hommes et Jésus, l’Enfant divin de votre virginale Epouse est béni. Saint Joseph, donné pour père au Fils de Dieu, priez pour nous dans nos
soucis de famille, de santé et de travail, jusqu’à nos derniers jours, et daignez nous secourir à l’heure de notre mort. Amen
Une dizaine de chapelet : le Notre Père, dix Je vous salue Marie, le Gloire au Père''',
    ),
    JourNeuvaine(
      numero: 7,
      titre: 'Saint Joseph, protecteur de l’Église ',
     // verset: 'Matthieu 18, 21-22',
      meditation: '''
« Après leur départ, l’ange du Seigneur apparaît en songe à Joseph et lui dit : “Lèvetoi, prends l’enfant et sa mère et fuis en Egypte” » (Mt 2,13)
L’Ange du Seigneur apparaît en songe à Joseph et lui dit : « Lèvetoi, prends l’enfant et sa mère, et reviens au pays d’Israël » (Mt 2,1920)
La sainte Eglise a pour mission particulière de diriger le corps mystique de Jésus, dont les fidèles sont les membres, de garder le corps
réel et eucharistique du Sauveur dont elle a reçu le dépôt sacré, de maintenir et de faire croître la vie divine de Jésus dans les âmes. Mais
n’estce pas là toute la vie de Joseph. Pourraiton trouver parmi les hommes un meilleur modèle ? Ainsi, saint Joseph, gardien de l’Agneau,
est devenu par la grâce du Père le gardien de l’Eglise.
Pie IX a été le pontife choisi par Dieu pour donner à la gloire de Joseph un nouvel éclat. Il a décrété le 8 décembre 1870 que saint Joseph
serait regardé et invoqué comme le « Patron de l’Eglise catholique »
Prière du jour à saint Joseph : 
Saint Joseph, tendre époux de l’Epouse de Dieu, avec Marie, tu partageas les peines et les joies de la vie pour mieux garder l’Agneau de
Dieu et le faire grandir.
Saint Joseph, enseignemoi à respecter l’Eglise, à lui être toujours obéissant, fidèle dans l’Eucharistie et dans la prière. Que je lui témoigne
toujours mon amour inconditionnel.
(Prendre un temps de silence et confier à saint Joseph les prêtres de sa paroisse, qu’il les garde toujours sous sa protection pour qu’ils
restent fidèles et fermes dans la foi).
Prières quotidiennes. 
''',
      priere: '''
PRIERES POUR CHAQUE JOUR DE LA NEUVAINE
Le signe de la croix : Au Nom du Père et du Fils et du Saint Esprit
Le Je crois en Dieu
Prière à l’EspritSaint : Père Eternel, au Nom de JésusChrist et par l’intercession de Marie, la Vierge Immaculée, et de saint Joseph, son
époux, envoyezmoi le SaintEsprit.
Venez, SaintEsprit, dans mon cœur et sanctifiezle.
Venez, père des pauvres et soulagezmoi.
Venez, auteur de tout bien et consolezmoi.
Venez, lumière des esprits et éclairezmoi.
Venez, consolateur des âmes et réconfortezmoi.
Venez, doux hôte des cœurs et ne vous éloignez pas de moi.
Venez, vrai rafraichissement de ma vie et restaurez-moi.
Je vous salue Joseph
Je vous salue Joseph, vous que la grâce divine a comblé ; le Sauveur a reposé dans vos bras et grandi sous vos yeux ; vous êtes béni entre tous
les hommes et Jésus, l’Enfant divin de votre virginale Epouse est béni. Saint Joseph, donné pour père au Fils de Dieu, priez pour nous dans nos
soucis de famille, de santé et de travail, jusqu’à nos derniers jours, et daignez nous secourir à l’heure de notre mort. Amen
Une dizaine de chapelet : le Notre Père, dix Je vous salue Marie, le Gloire au Père ''',
    ),
    JourNeuvaine(
      numero: 8,
      titre: 'Saint Joseph est au cœur de la communion fraternelle.',
     // verset: 'Luc 2, 51-52',
      meditation: '''
« Mon enfant, …vois ! Ton père et moi, nous te cherchions. » (Lc 2,48)
Saint Joseph, père admirable de l’Enfant Jésus, combien fut grand ton bonheur de pouvoir Le serrer entre tes bras. Le Père et le Fils, dans un
don intime échangeaient les plus tendres sentiments.
Par notre union avec le Cœur de Marie vient le règne d’amour du Cœur doux et humble de Jésus, par l’union aux Cœurs de Jésus et de Marie,
nous communions au cœur doux et juste de Joseph. Par cette sainte communion familiale, nous reconnaissons l’union de tous les cœurs au nom
du Père.
Prière du jour à saint Joseph : Avec Joseph, modèle d’espérance, Seigneur, nous t’en prions : laisse éclater en nous ta force et nous irons,
comme Joseph, là où tu le désires, bâtir avec nos frères une cité plus humaine, et façonner le Royaume où règne ta justice. O Saint Joseph,
puissionsnous apprendre de toi à espérer, et que cette espérance puisse nous transformer et nous donner le goût du combat et de l’action
! Saint Joseph, apprendsmoi à rendre grâce pour la communion fraternelle au sein de ma famille. Je te consacre tous ceux que j’aime et
tous ceux que j’aime moins. Je te demande la grâce pour qu’entre parents et enfants, il y ait cette compréhension affectueuse et sincère qui
les rende bons les uns envers les autres.
Par l’union aux Cœurs de Jésus et de Marie, je communie au cœur doux et juste de Joseph. Saint Joseph, apprendsmoi à être amour et
instrument de paix dans ma vie quotidienne pour tous ceux et celles qui attendent mon aide.
(Prendre un temps de silence et confier à saint Joseph nos familles, qu’elles restent unies, confier nos communautés paroissiales, qu’elles
restent unies).
Prières quotidiennes ''',
      priere: '''
PRIERES POUR CHAQUE JOUR DE LA NEUVAINE
Le signe de la croix : Au Nom du Père et du Fils et du Saint Esprit
Le Je crois en Dieu
Prière à l’EspritSaint : Père Eternel, au Nom de JésusChrist et par l’intercession de Marie, la Vierge Immaculée, et de saint Joseph, son
époux, envoyezmoi le SaintEsprit.
Venez, SaintEsprit, dans mon cœur et sanctifiezle.
Venez, père des pauvres et soulagezmoi.
Venez, auteur de tout bien et consolezmoi.
Venez, lumière des esprits et éclairezmoi.
Venez, consolateur des âmes et réconfortezmoi.
Venez, doux hôte des cœurs et ne vous éloignez pas de moi.
Venez, vrai rafraichissement de ma vie et restaurez-moi.
Je vous salue Joseph
Je vous salue Joseph, vous que la grâce divine a comblé ; le Sauveur a reposé dans vos bras et grandi sous vos yeux ; vous êtes béni entre tous
les hommes et Jésus, l’Enfant divin de votre virginale Epouse est béni. Saint Joseph, donné pour père au Fils de Dieu, priez pour nous dans nos
soucis de famille, de santé et de travail, jusqu’à nos derniers jours, et daignez nous secourir à l’heure de notre mort. Amen
Une dizaine de chapelet : le Notre Père, dix Je vous salue Marie, le Gloire au Père''',
    ),
    JourNeuvaine(
      numero: 9,
      titre: 'Saint Joseph, patron de la bonne mort et des âmes du Purgatoire.',
     // verset: 'Luc 2, 51-52',
      meditation: '''
Que l’aspect du Christ Jésus vous soit au moment de la mort, une douceur et une fête !
La sainte Ecriture ne nous dit rien de la mort de saint Joseph, mais la tradition de toute l’Eglise nous le montre expirant entre les bras de Jésus
et de Marie. Si le cœur d’un fils se révèle tout entier au moment de la mort d’un père bien aimé, quelle part dut prendre le cœur de Jésus à cette
douloureuse séparation ? Joseph n’a cessé, à la crèche, en Egypte, à Nazareth, d’assister Jésus de son amour. Jésus qui est la
reconnaissance même, assiste à la mort de Joseph en répandant sur lui les meilleures bénédictions de son cœur. Voilà pourquoi saint Joseph
peut nous tendre la main au moment de notre mort physique. Il peut intercéder pour nous quand nous prions pour nos fidèles défunts.
Saint Joseph est le protecteur des âmes du purgatoire, car il veut augmenter la gloire du Sacré Cœur de Jésus, en les lui amenant. Saint Joseph
les voit, connaît leurs douleurs, accueille leurs soupirs, plaide leur cause et hâte de ses prières le moment de leur heureuse délivrance.
Prière du jour à saint Joseph : O Saint Joseph, patron de la bonne mort, ta mort fut un doux passage entre les bras de Jésus et de Marie, je
te recommande ma dernière heure icibas. Au moment de mon trépas, augmente en moi le désir du Ciel, que ma mort soit sereine et douce
comme la tienne. 
Jésus, Marie, Joseph, priez pour moi et tous les membres de ma famille au moment de la mort. Je vous confie spécialement tous ceux et
celles qui me sont chers, surtout mes défunts. Que le Seigneur les accueille dans son paradis où tous ensemble ils jouissent de la béatitude
éternelle.
Marie et Joseph, offerts sur la terre d’Israël, Marie et Joseph morts à euxmêmes, source du blé nouveau, source de l’Amour divin sur terre,
engendrezmoi dans votre trinité sur terre à la sainteté. Faites que je puisse me revêtir des vêtements blancs de la naissance et de la
Résurrection.
Délivrez toutes les âmes du purgatoire de leur douloureux exil.
Prières quotidiennes
Prière finale : O Joseph, père virginal de Jésus, très pur époux de la Vierge Marie, chaque jour, prie pour nous Jésus luimême, le Fils de Dieu,
afin que, fortifié par sa grâce, nous puissions lutter comme il convient dans la vie, et être couronnés par lui dans la mort.
Jésus, Marie, Joseph, je vous confie mon cœur et mon âme !
Jésus, Marie, Joseph, assistezmoi jusqu’à mon dernier soupir !
Jésus, Marie, Joseph, que mon âme puisse partir en paix vers vous !
Seigneur, ayez pitié de nous.
Jésus-Christ, ayez pitié de nous.
Seigneur, ayez pitié de nous.
Jésus-Christ, écouteznous.
Jésus-Christ, exauceznous.
Père céleste, qui êtes Dieu, ayez pitié de nous.
Fils Rédempteur du monde, qui êtes Dieu, ayez pitié de nous.
Esprit Saint, qui êtes Dieu, ayez pitié de nous.
Trinité sainte, qui êtes un seul Dieu, ayez pitié de nous.
Saint Joseph, le plus illustre des Patriarches, priez pour nous.
Saint Joseph, père nourricier de l’Enfant Jésus, ...
Saint Joseph, honoré de la présence du Verbe incarné, ...
Saint Joseph, conducteur de la Sainte Famille, ...
Saint Joseph, imitateur fidèle de Jésus et de Marie, ...
Saint Joseph, comblé des dons de l’Esprit Saint, ...
Saint Joseph, émulateur de la pureté des Anges, ...
Saint Joseph, modèle d’humilité et de patience, ...
Saint Joseph, image parfaite de la vie intérieure, ...
Saint Joseph, ministre des volontés du TrèsHaut, ...
Saint Joseph, l’époux de la plus pure des Vierges, ...
Saint Joseph, vous avez porté dans vos bras le Fils de l’Eternel, ...
Saint Joseph, vous avez partagé l’exil de Jésus et de Marie en Egypte, ...
Saint Joseph, vous avez eu la joie de retrouver Jésus dans le temple, ...
Saint Joseph, à qui le Roi de gloire et la Reine des cieux voulurent être soumis, ...
Saint Joseph, vous avez été admis à contempler la profondeur des conseils divins, ....
Saint Joseph, vous avez eu le bonheur d’expirer entre les bras de Jésus et de Marie, ...
Saint Joseph, le canal par où découlent sur nous les faveurs du ciel, ...
Saint Joseph, soutien puissant de l’Eglise de JésusChrist, ...
Saint Joseph, notre protecteur à l’heure de notre mort, ...
Agneau de Dieu, qui effacez les péchés du monde, pardonneznous Seigneur.
Agneau de Dieu, qui effacez les péchés du monde, exauceznous Seigneur.
Agneau de Dieu, qui effacez les péchés du monde, ayez pitié de nous Seigneur.
JésusChrist, écouteznous.
JésusChrist, exauceznous.
Priez pour nous, ô bienheureux Joseph, afin que nous soyons dignes des promesses de JésusChrist. 
Prions : Dieu des miséricordes, qui avez élevé le bienheureux Joseph à la gloire d’être le tuteur de votre divin Fils et l’époux de la Très
Sainte Vierge, accordeznous, par l’intercession de ce grand saint, la grâce de conserver nos cœurs sans tache ; afin que nous puissions
paraître un jour devant vous, revêtus de la robe d’innocence, et être admis au banquet céleste. Nous vous demandons ces grâces par
JésusChrist Notre Seigneur. Amen.''',
      priere: '''
PRIERES POUR CHAQUE JOUR DE LA NEUVAINE
Le signe de la croix : Au Nom du Père et du Fils et du Saint Esprit
Le Je crois en Dieu
Prière à l’EspritSaint : Père Eternel, au Nom de JésusChrist et par l’intercession de Marie, la Vierge Immaculée, et de saint Joseph, son
époux, envoyezmoi le SaintEsprit.
Venez, SaintEsprit, dans mon cœur et sanctifiezle.
Venez, père des pauvres et soulagezmoi.
Venez, auteur de tout bien et consolezmoi.
Venez, lumière des esprits et éclairezmoi.
Venez, consolateur des âmes et réconfortezmoi.
Venez, doux hôte des cœurs et ne vous éloignez pas de moi.
Venez, vrai rafraichissement de ma vie et restaurez-moi.
Je vous salue Joseph
Je vous salue Joseph, vous que la grâce divine a comblé ; le Sauveur a reposé dans vos bras et grandi sous vos yeux ; vous êtes béni entre tous
les hommes et Jésus, l’Enfant divin de votre virginale Epouse est béni. Saint Joseph, donné pour père au Fils de Dieu, priez pour nous dans nos
soucis de famille, de santé et de travail, jusqu’à nos derniers jours, et daignez nous secourir à l’heure de notre mort. Amen
Une dizaine de chapelet : le Notre Père, dix Je vous salue Marie, le Gloire au Père''',
    ),
  ],
),

  ];

  static List<Neuvaine> getNeuvainesEnCours() {
    return toutesLesNeuvaines.where((n) => n.enCours).toList();
  }

  static Neuvaine? getNeuvaineParId(String id) {
    try {
      return toutesLesNeuvaines.firstWhere((n) => n.id == id);
    } catch (e) {
      return null;
    }
  }
}