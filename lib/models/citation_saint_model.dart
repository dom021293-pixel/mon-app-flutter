// lib/models/citation_saint_model.dart
class CitationSaint {
  final String saint;
  final String texte;
  final String reference;
  final String imageUrl;

  CitationSaint({
    required this.saint,
    required this.texte,
    required this.reference,
    required this.imageUrl,
  });
}

class CitationsSaintsData {
  static List<CitationSaint> toutes = [
    CitationSaint(
      saint: 'Sainte Thérèse de Lisieux',
      texte: 'Je n\'ai jamais rien demandé à saint Joseph sans être exaucée. Il est vraiment le père des âmes intérieures, celui qui sait protéger dans les difficultés et obtenir les grâces nécessaires.',
      reference: 'Histoire d\'une âme',
      imageUrl: 'assets/images/therese.jpg',
    ),
    CitationSaint(
      saint: 'Saint François de Sales',
      texte: 'Saint Joseph est le modèle des parfaits chrétiens. Il a vécu dans l\'union intime avec Jésus et Marie, et c\'est pourquoi il est si puissant auprès d\'eux.',
      reference: 'Sermons',
      imageUrl: 'assets/images/francois_sales.jpg',
    ),
    CitationSaint(
      saint: 'Saint Bernard de Clairvaux',
      texte: 'Pourquoi craindrais-je d\'aller à Joseph ? Jésus l\'a aimé non seulement comme ami, mais comme père. Il ne peut rien refuser à celui qui l\'a porté dans ses bras.',
      reference: 'Homélies',
      imageUrl: 'assets/images/bernard.jpg',
    ),
    CitationSaint(
      saint: 'Saint Josémaria Escriva',
      texte: 'Saint Joseph est vraiment un père et un seigneur. Il protège ceux qui le vénèrent avec la même tendresse qu\'il a eue pour Jésus. En lui, Dieu a mis un cœur de père.',
      reference: 'Forge',
      imageUrl: 'assets/images/josemaria.jpg',
    ),
    CitationSaint(
      saint: 'Saint Jean Chrysostome',
      texte: 'Si le charpentier n\'avait pas émigré en Égypte, le Christ n\'aurait pas été sauvé. Joseph a contribué au salut du monde par son obéissance et son travail.',
      reference: 'Homélies sur Matthieu',
      imageUrl: 'assets/images/chrysostome.jpg',
    ),
    CitationSaint(
      saint: 'Saint Augustin',
      texte: 'Joseph fut appelé juste parce qu\'il possédait toutes les vertus. Sa justice n\'était pas une simple observance extérieure, mais une adhésion profonde à la volonté de Dieu.',
      reference: 'Sermons',
      imageUrl: 'assets/images/augustin.jpg',
    ),
    CitationSaint(
      saint: 'Saint Jean-Paul II',
      texte: 'Joseph est le gardien du mystère de Dieu. Par son travail, par son silence, par son obéissance, il a protégé le Fils de Dieu et sa Mère. Qu\'il protège aussi l\'Église.',
      reference: 'Redemptoris Custos',
      imageUrl: 'assets/images/jean_paul2.jpg',
    ),
    CitationSaint(
      saint: 'Pape François',
      texte: 'Joseph est un père aimé, un père tendre et obéissant, un père accueillant. Dans l\'ombre de Nazareth, il a protégé et éduqué le Fils de Dieu.',
      reference: 'Patris corde',
      imageUrl: 'assets/images/pape_francois.jpg',
    ),
  ];

  static CitationSaint getAleatoire() {
    final random = DateTime.now().millisecondsSinceEpoch % toutes.length;
    return toutes[random];
  }
}