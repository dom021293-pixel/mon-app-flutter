import 'package:joe/models/priere_model.dart';


class PrieresData {
  static Priere? getPriereDuJour() {
  if (toutesLesPrieres.isEmpty) return null;
  final jour = DateTime.now().day;
  return toutesLesPrieres[jour % toutesLesPrieres.length];
}
  static List<Priere> toutesLesPrieres = [
    // Prières quotidiennes
    Priere(
      id: 'priere_matin',
      titre: 'Prière du matin à Saint Joseph',
      sousTitre: 'Pour commencer la journée',
      categorie: 'quotidiennes',
      texte: '''
Ô glorieux Saint Joseph,
je vous offre les pensées, les paroles et les actions de cette journée.
Obtenez-moi la grâce de la vivre dans l'amour de Dieu
et le service de mes frères.

Protégez ma famille et bénissez mon travail.
Que tout ce que je ferai aujourd'hui soit pour la plus grande gloire de Dieu.

Saint Joseph, modèle des travailleurs, priez pour nous.
Amen.''',
      intentions: [
        'Pour la protection de ma famille',
        'Pour la bénédiction de mon travail',
        'Pour vivre dans l\'amour de Dieu'
      ],
      imageUrl: 'assets/images/priere_matin.jpg',
    ),

    Priere(
      id: 'priere_soir',
      titre: 'Prière du soir à Saint Joseph',
      sousTitre: 'Action de grâce',
      categorie: 'quotidiennes',
      texte: '''
Saint Joseph, père aimant,
je vous rends grâce pour cette journée qui s'achève.
Protégez mon repos et celui de mes proches.

Veillez sur nous durant la nuit
et faites que nous puissions nous réveiller
pour servir Dieu avec un cœur nouveau.

Saint Joseph, patron de la bonne mort, priez pour nous.
Amen.''',
      imageUrl: 'assets/images/priere_soir.jpg',
    ),

    // Prières pour intentions spéciales
    Priere(
      id: 'priere_travail',
      titre: 'Pour le travail',
      sousTitre: 'Saint Joseph, modèle des travailleurs',
      categorie: 'intentions',
      texte: '''
Saint Joseph, vous qui avez travaillé
pour subvenir aux besoins de la Sainte Famille,
soyez mon guide et mon protecteur dans mon travail.

Obtenez-moi la grâce d'accomplir mes tâches
avec conscience et amour.
Bénissez mes efforts et mes projets.

Que mon travail soit source de joie
et contribue au bien de tous.

Saint Joseph, priez pour nous.
Amen.''',
      intentions: [
        'Pour trouver un emploi',
        'Pour la réussite professionnelle',
        'Pour l\'harmonie au travail'
      ],
    ),

    Priere(
      id: 'priere_famille',
      titre: 'Pour la famille',
      sousTitre: 'Saint Joseph, protecteur des familles',
      categorie: 'intentions',
      texte: '''
Saint Joseph, père nourricier de Jésus,
veillez sur notre famille comme vous avez veillé
sur la Sainte Famille de Nazareth.

Protégez nos enfants, guidez nos choix,
apaisez nos conflits et renforcez notre amour.
Faites de notre foyer un lieu de paix et de prière.

Saint Joseph, priez pour notre famille.
Amen.''',
    ),

    // Prières traditionnelles
    Priere(
      id: 'je_vous_salue_joseph',
      titre: 'Je vous salue Joseph',
      sousTitre: 'Prière traditionnelle',
      categorie: 'traditionnelles',
      texte: '''
Je vous salue, Joseph,
vous que la grâce divine a comblé.
Le Sauveur a reposé dans vos bras
et a grandi sous vos yeux.
Vous êtes béni entre tous les hommes,
et Jésus, l'Enfant divin de votre virginale Épouse,
est béni.

Saint Joseph, donné pour père au Fils de Dieu,
priez pour nous dans nos soucis de famille,
de santé et de travail,
jusqu'à nos derniers jours,
et daignez nous secourir
à l'heure de notre mort. Amen.''',
      audioUrl: 'assets/audio/je_vous_salue_joseph.mp3',
    ),

    Priere(
      id: 'souvenez_vous',
      titre: 'Souvenez-vous',
      sousTitre: 'Ô très chaste époux',
      categorie: 'traditionnelles',
      texte: '''
Souvenez-vous, ô très chaste époux de la Vierge Marie,
ô mon aimable protecteur Saint Joseph,
qu'on n'a jamais entendu dire
que quelqu'un ait invoqué votre protection,
demandé votre secours,
et n'ait pas été consolé.

Animé d'une pareille confiance,
je viens à vous et je me recommande à vous avec ferveur.
Ah ! ne méprisez pas ma prière,
mère du Sauveur, mais daignez l'accueillir avec bonté.
Amen.''',
    ),

    // Litanies
    Priere(
      id: 'litanies',
      titre: 'Litanies de Saint Joseph',
      sousTitre: 'Approuvées par le Pape Saint Pie X',
      categorie: 'litanies',
      texte: '''
Seigneur, ayez pitié de nous.
Ô Christ, ayez pitié de nous.
Seigneur, ayez pitié de nous.
Jésus-Christ, écoutez-nous.
Jésus-Christ, exaucez-nous.

Père céleste qui êtes Dieu, ayez pitié de nous.
Fils Rédempteur du monde qui êtes Dieu, ayez pitié de nous.
Esprit-Saint qui êtes Dieu, ayez pitié de nous.
Trinité Sainte qui êtes un seul Dieu, ayez pitié de nous.

Sainte Marie, priez pour nous.
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

Agneau de Dieu qui effacez les péchés du monde,
pardonnez-nous, Seigneur.
Agneau de Dieu qui effacez les péchés du monde,
exaucez-nous, Seigneur.
Agneau de Dieu qui effacez les péchés du monde,
ayez pitié de nous, Seigneur.

Priez pour nous, Saint Joseph,
afin que nous devenions dignes des promesses de Jésus-Christ.

Prions :
Ô Dieu qui, par une providence ineffable,
avez daigné choisir le bienheureux Joseph
pour époux de votre très Sainte Mère,
accordez-nous, nous vous en supplions,
que, vénérant sur terre comme notre protecteur,
nous méritions de l'avoir pour intercesseur dans les cieux.
Vous qui vivez et régnez dans les siècles des siècles.
Amen.''',
    ),
    // À ajouter dans la liste des prières
Priere(
  id: 'priere_confiance',
  titre: 'Acte de confiance à Saint Joseph',
  sousTitre: 'Pour les moments difficiles',
  categorie: 'intentions',
  texte: '''
Saint Joseph, père bien-aimé,
je me jette en toute confiance entre vos bras.
Vous qui n'avez jamais abandonné ceux qui vous invoquent,
regardez ma détresse et venez à mon secours.

Je vous confie mes peines, mes inquiétudes,
mes combats de chaque jour.
Vous qui avez connu l'inquiétude et la peur,
vous comprenez mon cœur angoissé.

Obtenez-moi la force de tenir bon,
la lumière pour discerner le chemin,
la paix qui dépasse toute intelligence.

Je vous confie particulièrement cette intention :
(mentionnez ici votre intention)

Saint Joseph, je ne serai pas déçu de ma confiance en vous.
Amen.''',
),

Priere(
  id: 'priere_action_graces',
  titre: 'Action de grâces à Saint Joseph',
  sousTitre: 'Pour remercier après une grâce reçue',
  categorie: 'intentions',
  texte: '''
Saint Joseph, père reconnaissant,
je viens vous remercier du fond du cœur.
Vous avez présenté ma demande à Jésus,
et il m'a exaucé au-delà de mes espérances.

Merci pour votre intercession puissante,
merci pour votre protection discrète,
merci pour votre amour de père.

Je ne vous oublierai pas dans mes prières,
et je ferai connaître à tous
votre bonté et votre puissance.

Continuez à veiller sur moi et sur ma famille.
Je veux, comme vous, être fidèle
dans les petites choses de chaque jour.

Saint Joseph, je vous aime et je vous remercie.
Amen.''',
),

Priere(
  id: 'priere_vocation',
  titre: 'Prière pour les vocations',
  sousTitre: 'Par l\'intercession de Saint Joseph',
  categorie: 'intentions',
  texte: '''
Saint Joseph, vous qui avez répondu "oui"
à l'appel de Dieu sans hésiter,
obtenez pour l'Église de nombreuses et saintes vocations.

Que des jeunes hommes généreux
répondent à l'appel du sacerdoce,
pour être d'autres Joseph,
pères et pasteurs selon le cœur de Dieu.

Que des âmes consacrées
se donnent sans réserve dans la vie religieuse,
témoignant de l'amour du Christ
par leur vie cachée et féconde.

Que des époux chrétiens
vivent leur mariage comme une vocation,
à l'image de la Sainte Famille de Nazareth.

Saint Joseph, priez pour ceux que Dieu appelle.
Amen.''',
),

Priere(
  id: 'priere_enfants',
  titre: 'Prière pour les enfants',
  sousTitre: 'À réciter avec ses enfants',
  categorie: 'intentions',
  texte: '''
Cher Saint Joseph,
toi qui as protégé l'enfant Jésus,
protège aussi tous les enfants du monde.

Veille sur ceux qui grandissent,
aide-les à devenir grands et forts,
sages et aimants comme Jésus à Nazareth.

Protège les enfants malades,
ceux qui souffrent, ceux qui sont tristes.
Console ceux qui n'ont pas de papa,
ceux qui se sentent seuls ou abandonnés.

Apprends à tous les parents
à aimer leurs enfants comme tu as aimé Jésus.
Et nous, les enfants,
apprends-nous à obéir avec joie,
comme Jésus t'obéissait.

Saint Joseph, bénis tous les enfants.
Amen.''',
),
Priere(
  id: 'priere_menteau',
  titre: 'Prière au menteau de Saint Joseph',
  sousTitre: 'Dévotion au Saint manteau de Saint Joseph',
  categorie: 'intentions',
  texte: '''
Au nom du Père, du Fils et du Saint Esprit. Amen.
Jésus, Marie, Joseph, je vous donne mon cœur et mon âme.
(Réciter 3 Gloire au Père à notre Père céleste, en action de grâces pour avoir conféré à Saint 
Joseph une dignité si exceptionnelle.)

Ô glorieux Patriarche Saint Joseph, je me prosterne humblement devant vous. Je prie le 
Seigneur Jésus, le Cœur Immaculé de la Vierge Marie et tous les anges et les saints de la cour 
céleste de se joindre à moi dans cette prière. J’offre cette prière à votre manteau précieux et je 
promets mon dévouement et une foi sincère. Je m’engage à faire tout ce qui est en mon pouvoir 
pour vous honorer toute ma vie et vous prouver mon amour.
Aidez-moi, Saint Joseph. Aidez-moi maintenant et tout au long de ma vie, mais surtout à l’heure 
de ma mort, comme vous avez été aidé par Jésus et Marie, afin que je sois un jour uni à vous au 
Ciel, pour vous honorer pour toute l’éternité. Amen.

Ô glorieux Patriarche Saint Joseph, prosterné devant vous et votre divin Fils Jésus, je vous 
offre, avec une dévotion sincère, ce précieux trésor de prière. Vous avez non seulement été 
entouré de la splendeur lumineuse des rayons du soleil divin de Jésus, mais vous avez aussi été 
magnifiquement éclairé par le clair de lune mystique de la Bienheureuse Vierge Marie. Ô glorieux 
Patriarche, je vous présente ce manteau précieux en votre honneur. Accordez-moi, ô grand Saint 
Joseph, votre regard bienveillant. Je vous supplie, ô glorieux Patriarche, afin que par votre 
intercession, le Seigneur ne me laisse jamais en exil dans cette vallée de larmes.
Je veux être considéré comme l’un de vos fidèles serviteurs qui vivent avec sérénité sous votre 
patronage et votre Saint manteau. Faites que je vive toujours sous votre protection, tous les jours 
de ma vie et surtout au moment de mon dernier souffle. Amen.

Ô glorieux Saint Joseph, vous êtes, après Marie, le Saint le plus digne de notre amour et de 
notre dévotion. Vous êtes seul, au-dessus de tous les Saints, à avoir été choisi pour avoir 
l’honneur suprême d’élever, de nourrir et même d’embrasser le Messie, que tant de rois et de 
prophètes auraient aimé rencontrer.
Saint Joseph, sauvez mon âme et obtenez de la Miséricorde de Dieu un soulagement pour les 
âmes du Purgatoire.
(3 Gloire au Père)

Ô puissant Saint Joseph, vous avez été proclamé patron de l’Eglise universelle ; par 
conséquent, je demande l’aide de votre Cœur généreux, toujours prêt pour nous aider. Vers vous, 
ô glorieux Saint Joseph, les veuves, les orphelins, les abandonnés, les affligés, les opprimés, se 
tournent tous. Il n’existe pas de douleur, de détresse ou de souffrance que vous n’ayez pas 
consolée. Daignez, je vous prie, présenter ma requête devant Dieu, jusqu’à ce que j’obtienne la 
grâce dont j’ai besoin, et n’oubliez pas non plus les âmes du Purgatoire. Saint Joseph, écoutez
moi !
(3 Gloire au Père)

Ô puissant Saint Joseph, innombrables sont ceux qui vous ont prié et qui ont reçu la paix, les 
grâces et vos faveurs. Mon cœur, si triste et douloureux, n’arrive pas à trouver le repos. Saint 
Joseph, vous connaissez tous mes besoins, même avant que je ne les exprime dans ma prière. 
Vous savez combien cette demande est importante pour moi. Je m’incline devant vous. Vous seul 
pouvez m’aider dans mon chagrin. Saint Joseph, je vous en prie, entendez mon cri ! Sainte 
Thérèse a dit : “ Tout ce que vous demandez à Saint Joseph, il vous l’accordera ”. Ô Saint Joseph, 
consolateur des affligés, ayez pitié de ma tristesse et des pauvres âmes qui ont mis tellement 
d’espoir en vous.
(3 Gloire au Père)

Ô Sublime Patriarche Saint Joseph, par votre obéissance parfaite à Dieu, intercédez pour moi. 
Par votre vie sainte pleine de grâce et de mérite, entendez ma prière. Par votre nom suave, aidez
moi. Par vos larmes saintes, soutenez-moi. Par vos sept douleurs, intercédez pour moi. Par vos 
sept joies, consolez-moi. De tous les maux du corps et de l’âme, délivrez-moi. De tous les dangers 
et les catastrophes, sauvez-moi. Aidez-moi par votre puissante intercession et obtenez pour moi 
tout ce qui est nécessaire pour le salut, et en particulier pour cette grâce dont j’ai tant besoin 
(nommer cette grâce).
(3 Gloire au Père)

Ô glorieux Saint Joseph, innombrables sont les grâces et les faveurs que vous avez obtenues 
pour les âmes troublées, l’assistance aux malades, l’aide aux opprimés, aux persécutés, aux 
trahis, aux dépouillés de tout confort humain, aux affamés... ; tous ont imploré votre puissante 
intercession et ont été réconfortés dans leurs afflictions. Ô Saint Joseph, ne permettez pas que je 
sois le seul à ne pas ressentir votre aide. Montrez-moi votre gentillesse et votre générosité, de 
sorte que je puisse m’écrier : “ Gloire éternelle à notre Saint Patriarche Saint Joseph, mon grand 
protecteur de la Terre et le défenseur des âmes du Purgatoire. ”
(3 Gloire au Père)

Père Eternel, qui êtes aux Cieux, par les mérites de Jésus et de Marie, je vous prie d’exaucer 
ma demande. Au nom de Jésus et de Marie, je m’incline devant votre divine présence et je vous 
prie d’accepter ma demande, plein d’espoir, afin d’être compté parmi la multitude de ceux qui 
vivent sous le patronage de Saint Joseph. Etendez votre bénédiction sur ma prière, que je vous 
offre aujourd’hui comme un gage de mon dévouement.
(3 Gloire au Père)

Invocations en l’honneur de la vie cachée de Saint Joseph avec Jésus et Marie :
Saint Joseph, priez pour que Jésus vienne dans mon âme et me sanctifie. Saint Joseph, priez 
pour que Jésus vienne dans mon cœur et m’inspire la charité.
Saint Joseph, priez pour que Jésus vienne dans mon esprit et m’instruise. Saint Joseph, priez 
pour que Jésus me guide et renforce ma volonté.
Saint Joseph, priez pour que Jésus dirige mes pensées et les purifie.
Saint Joseph, priez pour que Jésus m’oriente et dirige mes désirs.
Saint Joseph, priez pour que Jésus regarde mes actions et étende ses bénédictions sur moi.
Saint Joseph, priez pour que Jésus me comble d’amour pour lui.
Saint Joseph, demandez à Jésus pour moi l’imitation de vos vertus.
Saint Joseph, demandez à Jésus pour moi un véritable esprit d’humilité. Saint Joseph, 
demandez à Jésus pour moi la douceur de son cœur.
Saint Joseph, demandez à Jésus pour moi la paix de l’esprit.
Saint Joseph, demandez à Jésus pour moi la sainte crainte du Seigneur.
Saint Joseph, demandez à Jésus pour moi un désir de perfection.
Saint Joseph, demandez à Jésus pour moi la douceur de cœur.
Saint Joseph, demandez à Jésus pour moi un cœur pur et bienfaisant.
Saint Joseph, demandez à Jésus pour moi la sagesse de la foi.
Saint Joseph, demandez à Jésus pour moi la bénédiction et la persévérance dans les bonnes 
œuvres.
Saint Joseph, demandez à Jésus pour moi la force de porter mes croix.
Saint Joseph, demandez à Jésus pour moi le mépris pour les biens matériels de ce monde.
Saint Joseph, demandez à Jésus pour moi la grâce de toujours marcher sur la route étroite vers 
le Ciel.
Saint Joseph, demandez à Jésus pour moi la grâce d’éviter toutes les occasions de pécher.
Saint Joseph, demandez à Jésus pour moi un saint désir de la béatitude éternelle.
Saint Joseph, demandez à Jésus pour moi la grâce de la persévérance finale. Saint Joseph, ne 
m’abandonnez pas.
Saint Joseph, priez pour que mon cœur ne cesse jamais de vous aimer et de vous louer.
Saint Joseph, par l’amour que vous avez pour Jésus, faites que je puisse apprendre à l’aimer.
Saint Joseph, acceptez-moi comme votre dévot fidèle.
Saint Joseph, je me donne à vous, acceptez mes prières et entendez-les. Saint Joseph, ne 
m’abandonnez pas à l’heure de ma mort.
Jésus, Marie et Joseph, je vous donne mon cœur et mon âme.
(3 Gloire au Père)

Souvenez-vous, ô très chaste époux de la Vierge Marie, mon aimable protecteur, Saint Joseph, 
qu’on n’a jamais entendu dire que quelqu’un a invoqué votre protection et demandé votre secours 
sans avoir été consolé. Animé d’une pareille confiance, je viens à vous et me recommande à vous 
de toute la ferveur de mon âme. Ne rejetez pas ma prière, ô père virginal du Rédempteur, mais 
daignez l’accueillir avec bonté. Amen.

Glorieux Saint Joseph, époux de la Bienheureuse Vierge Marie et père virginal de Jésus, 
sauvez-moi et prêtez attention à mes besoins urgents. Enlevez les obstacles et les difficultés 
rencontrés dans ma prière et accordez-moi une réponse heureuse à ma demande, pour la plus 
grande gloire de Dieu et mon salut étemel. En signe de ma gratitude, je vous promets de diffuser 
les merveilles de votre gloire, tout en remerciant le Seigneur.

Prière finale au Saint manteau de Saint Joseph :
Ô glorieux Patriarche Saint Joseph, vous qui avez été choisi par Dieu pardessus tous les 
hommes de la terre, je vous prie de m’accepter dans les plis de votre Saint manteau, et d’être le 
gardien de mon âme. Je vous choisis comme mon père, mon protecteur, mon conseiller, mon saint 
patron. Regardez-moi comme l’un de vos enfants, sauvez-moi de la trahison de mes ennemis, 
visibles ou invisibles, aidez-moi à tout moment dans tous mes besoins, réconfortez-moi dans 
l’amertume de ma vie, et surtout au moment de ma mort. Dites seulement un mot pour moi au 
divin Rédempteur qui vous a jugé digne de le tenir dans vos bras et d’être le digne époux de la 
Bienheureuse Vierge Marie. Demandez pour moi les bénédictions qui me mèneront au salut. 
Veuillez inclure mon nom parmi ceux qui vous sont les plus chers et je me montrerai digne de votre 
protection toute spéciale.
Amen.''',
),
Priere(
  id: 'priere_infaillible',
  titre: 'Prière diverse à Saint Joseph',
  sousTitre: 'Cette prière à Saint Joseph est réputée infaillible',
  categorie: 'intentions',
  texte: '''
Ô Saint Joseph dont la protection est si 
grande, si forte et si prompte devant le trône de 
Dieu, je mets en toi tous mes intérets et désirs. 
Ô Saint Joseph, assiste-moi par ta puissante 
intercession et obtiens pour moi de ton divin 
Fils toutes les bénédictions spirituelles par 
Jésus Christ notre Seigneur, de telle manière 
qu’ayant engagé ici-bas ton pouvoir celeste, je 
puisse offrir mes remerciements et mon 
hommage au Père qui nous aime. 
Ô Saint Joseph, je ne me fatigue jamais de 
vous contempler toi et Jésus endormi dans tes 
bras ; je n’ose pas approcher pendant qu’il se 
repose près de ton Coeur. Embrassse-Le en mon 
nom et baise sa tête delicate pour moi et 
demande-lui de m’embrasser à son tour lors de 
mon dernier soupir. Saint Jospeh, patron des 
âmes du purgatoire, prie pour moi !''',
),
Priere(
  id: 'priere_coeur',
  titre: 'Prière au coeur très doux et très pur de Saint Joseph',
  sousTitre: 'Prière de demande',
  categorie: 'intentions',
  texte: '''
Ô Saint Joseph dont la protection est si 
grande, si forte et si prompte devant le trône de 
Dieu, je mets en toi tous mes intérets et désirs. 
Ô Saint Joseph, assiste-moi par ta puissante 
intercession et obtiens pour moi de ton divin 
Fils toutes les bénédictions spirituelles par 
Jésus Christ notre Seigneur, de telle manière 
qu’ayant engagé ici-bas ton pouvoir celeste, je 
puisse offrir mes remerciements et mon 
hommage au Père qui nous aime. 
Ô Saint Joseph, je ne me fatigue jamais de  
vous contempler toi et Jésus endormi dans tes 
bras ; je n’ose pas approcher pendant qu’il se 
repose près de ton Coeur. Embrassse-Le en mon 
nom et baise sa tête delicate pour moi et 
demande-lui de m’embrasser à son tour lors de 
mon dernier soupir. Saint Jospeh, patron des 
âmes du purgatoire, prie pour moi !''',
),
Priere(
  id: 'priere_glorieux',
  titre: 'Glorieux Saint Joseph',
  sousTitre: 'Prière de protection',
  categorie: 'intentions',
  texte: '''
Glorieux Saint Joseph, fils de David, homme 
juste et chaste, digne protecteur de Jésus le 
Christ et de la Sainte Église, nous te supplions 
de demander à Dieu le Père Tout Puissant de 
nous faire miséricorde et de nous obtenir par 
Jésus le Christ son Fils bien-aimé, la grâce de la 
paix. Protège-nous contre les forces du mal et 
les embûches de l’ennemi. Au sein du bonheur 
dont tu jouis auprès de Dieu, pense aux pèlerins 
de la terre qui sont dans les épreuves et la 
souffrance, dans la tribulation et les angoisses. 
Sensible à nos prières, grâce à ton secours et à 
celui de ton épouse la Sainte Vierge Marie, que 
Dieu le Père tout-puissant réponde à notre 
confiance et nous donne ainsi de vivre dans la 
paix et dans la joie. Amen ! ''',
),
Priere(
  id: 'priere_salut',
  titre: 'Salut Saint Joseph',
  sousTitre: 'Prière de Saint Louis Marie Grignion de Montfort',
  categorie: 'intentions',
  texte: '''
Salut Saint Joseph, homme juste, la Sagesse 
est avec Toi, Tu es béni sur tous les hommes et 
béni est Jésus le fruit de Marie, ta fidèle épouse ! 
Saint Joseph, digne Père protecteur de Jésus
Christ, prie pour nous pauvres pécheurs, et 
obtiens-nous de Dieu la divine sagesse, 
maintenant et à l’heure de notre mort. Amen ! ''',
),
Priere(
  id: 'priere_gardien',
  titre: 'Salut gardien du Rédempteur',
  sousTitre: 'Prière du Pape François à Saint Joseph',
  categorie: 'intentions',
  texte: '''
Salut gardien du Rédempteur, époux de la 
Vierge Marie. À toi Dieu a confié son Fils ; en 
toi Marie a remis sa confiance ; avec toi le 
Christ est devenu homme. Ô bienheureux 
Joseph, montre-toi aussi un père pour nous, et 
conduis-nous sur le chemin de la vie. Obtiens
nous grâce, miséricorde et courage, et défends
nous de tout mal. Amen ''',
),
Priere(
  id: 'priere_epoux',
  titre: 'Saint Joseph, époux de Marie',
  sousTitre: 'Prière de demande',
  categorie: 'intentions',
  texte: '''
Ô Saint Joseph, époux de Marie, Toi qui as 
écouté jusqu’au bout le dessein de Dieu à 
travers ton épouse, aide-nous à prendre chez 
nous, Marie, pour la laisser faire et vivre de sa 
foi silencieuse. 
Nous te recevons pour toujours comme 
Père et protecteur. Nous confions à ton cœur 
attentif notre famille et nos besoins matériels. 
Ô Saint Joseph, toi qui as veillé avec 
Marie sur la croissance de Jésus, veille sur la 
croissance humaine et spirituelle de notre 
famille.  
Ô Saint Joseph, Patron de l’Église 
Universelle, protège-nous contre les attaques 
de 
l’ennemi. Enseigne-nous avec Sainte 
Thérèse la voie de pauvreté confiante qui seule 
mène à l’amour pour faire un seul corps et un 
seul cœur dans l’Esprit. Amen ! ''',
),

Priere(id: 'priere_salutation',
 titre: 'Je vous salue Joseph',
   sousTitre: 'Je vous salue, Joseph, Image de Dieu le Père',
     categorie: 'intentions',
     texte: '''
     Je vous salue, Joseph, Image de Dieu le Père. 
Je vous salue, Joseph, Sanctuaire du Saint 
Esprit. 
33 
ITE AD JOSEPH (ALLEZ À SAINT JOSEPH) 
Je vous salue, Joseph, Bien-aimé de la Très 
Sainte Trinité. 
Je vous salue, Joseph, très fidèle coadjuteur 
du Grand Conseil. 
Je vous salue, Joseph, très digne époux de la 
Vierge Mère. 
Je vous salue, Joseph, Père de tous les 
fidèles.  
Je vous salue, Joseph, Gardien de ceux qui 
ont embrassé la Sainte Virginité. 
Je vous salue, Joseph, fidèle observateur du 
silence sacré. 
Je vous salue, Joseph, Amant de la sainte 
pauvreté. 
Je vous salue, Joseph, Modèle de douceur et 
de patience. 
Je vous salue, Joseph, Miroir d’humilité et 
d’obéissance. 
Vous êtes Béni entre tous les hommes. 
Et Bénis soient vos yeux qui ont vu ce que vous 
avez vu. 
Et Bénies soient les oreilles qui ont entendu 
ce que vous avez entendu. 
Et Bénies soient vos mains qui ont touché le 
Verbe fait chair. 
Et Bénis soient vos bras qui ont porté Celui 
qui porte toutes choses. 
Et Bénie soit votre poitrine, sur laquelle le 
Fils de Dieu a pris un doux repos. 
Et Béni soit votre cœur embrasé pour lui du 
plus ardent amour. 
Et Béni soit le Père Éternel qui vous a 
sanctifié. 
Et Bénie soit Marie Votre Épouse, qui vous a 
chéri comme un Époux et comme un Frère. 
Et Béni soit l’Ange qui Vous a servi de 
Gardien. 
Et Bénis soient à jamais tous ceux qui vous 
aiment et qui Vous bénissent. Amen !''',
   ),
   Priere(
  id: 'priere_delivrance',
  titre: 'Prière de délivrance',
  sousTitre: 'Prière de délivrance à Saint Joseph, terreur des démons',
  categorie: 'intentions',
  texte: '''
Nous recourons à vous dans notre tribulation, ô 
Bienheureux Joseph, et après avoir imploré le 
secours de votre Sainte Épouse, nous sollicitons 
aussi avec confiance, votre patronage. Par 
l’affection qui vous a uni à la Vierge Immaculée, 
Mère de Dieu, par l’amour paternel dont vous avez 
entouré l’Enfant Jésus, nous vous supplions de 
regarder avec bonté l’héritage que Jésus-Christ a 
conquis au prix de son sang, et de nous assister 
dans nos besoins. Protégez, ô très sage gardien de 
la divine Famille, la race élue de toute souillure 
d’erreur et de corruption, soyez-nous favorable, ô 
notre très puissant libérateur. Du haut du ciel, 
protégez-nous dans le combat que nous livrons à la 
puissance des ténèbres. Et de même que vous avez 
arraché autrefois l’Enfant Jésus au péril de la mort, 
défendez aujourd’hui la Sainte Église de Dieu des 
embûches de l’ennemi et de toute adversité. 
Couvrez chacun de nous de votre perpétuelle 
protection, afin que, à votre exemple, et soutenus 
par votre secours, nous puissions vivre saintement, 
pieusement mourir, et parvenir à la béatitude 
éternelle. Ainsi soit-il. ''',
),
Priere(
  id: 'priere_consécration',
  titre: 'Prière de consécration',
  sousTitre: 'Acte de consécration à Saint Joseph, ',
  categorie: 'intentions',
  texte: '''
Ô grand Saint, digne entre tous les saints 
d’être vénéré, aimé et invoqué, tant pour 
l’excellence de vos vertus, que pour l’éminence 
de votre gloire et la puissance de votre 
intercession ; moi……………. En présence de 
Jésus qui vous a choisi pour Père, et Marie qui 
vous a accepté pour époux, je vous prends 
aujourd’hui pour mon avocat auprès de l’un et 
de l’autre, pour mon protecteur et mon Père ; je 
me propose fermement de ne vous abandonner 
jamais, et de vous honorer tous les jours de ma 
vie. Je vous établis le gardien de la pureté de 
mon âme, ne permettez pas qu’elle soit jamais 
souillée par le péché, surtout le péché mortel. Je 
remets entre vos mains mon cœur, mon corps, 
mon âme, ma vie, mes travaux, mes peines, mes 
souffrances, vous priant, ô mon bienheureux 
Patron, de les présenter vous-même, avec 
Marie, votre glorieuse épouse, au divin Jésus 
que je veux aimer et servir, et à qui je veux être 
entièrement consacré. Daignez donc, je vous en 
prie, daignez m’accorder votre protection 
spéciale, et m’admettre au nombre de vos 
dévoués serviteurs. Assistez-moi dans toutes 
mes actions, soyez-moi favorable auprès de 
Jésus et de Marie, et ne m’abandonnez pas à 
l’heure de ma mort. Ainsi soit-t-il !''',
),
Priere(
  id: 'priere_patriarche',
  titre: 'Glorieux Patriarche',
  sousTitre: 'Glorieux Patriarche Saint Joseph',
  categorie: 'intentions',
  texte: '''
Glorieux Patriarche Saint Joseph dont la 
puissance sait rendre possibles les choses 
impossibles, viens à mon aide en ces moments 
d’angoisse et de difficulté. Prends sous ta 
protection les situations si graves et difficiles 
que je te recommande, afin qu’elles aient une 
heureuse issue. 
Mon bien-aimé Père, toute ma confiance est en 
toi. Qu’il ne soit pas dit que je t’ai invoqué en 
vain, et puisque tu peux tout auprès de Jésus et de 
Marie, montre-moi que ta bonté est aussi grande 
que ton pouvoir. Amen »''',
),
Priere(
  id: 'priere_miraculeuse',
  titre: 'Prière à Saint Joseph',
  sousTitre: 'Prière très efficace et miraculeuse à Saint Joseph',
  categorie: 'intentions',
  texte: '''
Saint Joseph, père nourricier si fidèle de 
l’enfant divin, époux virginal de la mère de 
Dieu, protecteur puissant de la Sainte Église, 
nous venons vers vous pour nous recommander 
à votre protection spéciale. 
Vous n’avez rien cherché en ce monde sinon 
la gloire de Dieu et le bien du prochain. Tout 
donné au sauveur, c’était votre joie de prier, de 
travailler, de vous sacrifier, de souffrir, de 
mourir pour lui. 
Vous étiez inconnu en ce monde et cependant 
connu de Jésus, ses regards reposaient avec 
complaisance sur votre vie simple et cachée en 
lui. Saint Joseph, vous avez déjà aidé tant 
d’hommes, nous venons vers vous avec une 
grande confiance. 
Vous voyez dans la lumière de Dieu ce qui 
nous manque, vous connaissez nos soucis, nos 
difficultés, nos peines. Nous recommandons à 
votre 
sollicitude 
paternelle 
cette 
affaire 
particulière (exprimez votre demande). 
Nous la mettons entre vos mains qui ont 
sauvé Jésus-enfant, mais avant tout implorez 
pour nous la grâce de ne jamais nous séparer de 
Jésus par le péché mortel, de le connaître et de 
l’aimer toujours plus, ainsi que sa sainte mère, 
de vivre toujours en présence de Dieu, de tout 
faire pour sa gloire et le bien des âmes, et 
d’arriver un jour à la vision bienheureuse de 
Dieu pour le louer éternellement avec vous. 
Ainsi soit-il. 
Notre Père qui est aux cieuX...?
Je vous salue Marie...,  
Gloire au Père et au fils et au Saint 
Esprit, comme il était au commencement, 
maintenant et toujours, et dans les siècles des 
siècles. Amen.  ''',
),

  ];

  static List<Priere> getPrieresParCategorie(String categorie) {
    return toutesLesPrieres.where((p) => p.categorie == categorie).toList();
  }

  static List<Priere> getPrieresFavorites() {
    return toutesLesPrieres.where((p) => p.estFavori).toList();
  }

  static Priere? getPriereParId(String id) {
    try {
      return toutesLesPrieres.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
}