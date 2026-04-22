// lib/views/a_propos_page.dart
import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'package:share_plus/share_plus.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class MenteauPage extends StatefulWidget {
  @override
  _MenteauPageState createState() => _MenteauPageState();
}

class _MenteauPageState extends State<MenteauPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manteau de Saint Joseph'),
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
            // En-tête avec logo
            _buildHeader(),
            
            const SizedBox(height: 24),
            
            // Section Mes coordonnées
            _buildCoordonneesSection(),
            
            const SizedBox(height: 16),
            
            // Description de l'application
            _buildSection(
              icon: Icons.info_outline,
              title: 'Prière au Menteau de Saint Joseph',
              content: '''
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
Amen. ''',
            ),
            
            const SizedBox(height: 16),

          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Column(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.brown.shade300, Colors.brown.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Center(
              child: Icon(
                Icons.church,
                color: Colors.white,
                size: 60,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Prière à Saint Joseph',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
          ),
          const SizedBox(height: 8),
       
        ],
      ),
    );
  }

  Widget _buildCoordonneesSection() {
    return Card(
      elevation: 4,
      shadowColor: Colors.brown.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.brown.shade100, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.brown.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.brown,
                      size: 24,
                    ),
                  ),
                  
                
                ],
              ),
              const SizedBox(height: 16),
           
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildSection({
    required IconData icon,
    required String title,
    required String content,
    bool isList = false,
    List<String>? items,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.brown.shade100,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: Colors.brown.shade700,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown.shade800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (!isList)
              Text(
                content,
                style: const TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.black87,
                ),
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: items!.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• ',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.brown.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                )).toList(),
              ),
          ],
        ),
      ),
    );
  }


}