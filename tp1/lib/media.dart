class MediaModel {
  String imageUrl;
  String title;
  String description;
  String saison;
  String episode;
  String sortie;
  String producteur;
  String acteur;
  String duree;

  // Constructor
  MediaModel(
      {this.imageUrl,
      this.title,
      this.description,
      this.saison,
      this.episode,
      this.sortie,
      this.producteur,
      this.acteur,
      this.duree});
}

final series = [
  MediaModel(
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Breaking_Bad_logo.svg/1024px-Breaking_Bad_logo.svg.png',
      title: 'Breaking bad',
      description:
          "Un professeur de chimie atteint d'un cancer s'associe à un ancien élève pour fabriquer et vendre de la méthamphétamine afin d'assurer l'avenir financier de sa famille",
      saison: '5',
      episode: '62',
      sortie: '20 janvier 2008',
      producteur: 'Mark Johnson',
      acteur: 'Bryan Cranston , Aaron Paul , Anna Gunn '),
  MediaModel(
      imageUrl:
          'https://www.clipartkey.com/mpngs/m/174-1740888_la-casa-de-papel.png',
      title: 'La Casa de Papel',
      description:
          "Huit voleurs font une prise d'otages dans la Maison royale de la Monnaie d'Espagne, tandis qu'un génie du crime manipule la police pour mettre son plan à exécution.",
      saison: '5',
      episode: '38',
      sortie: '20 décembre 2017',
      producteur: 'Alex Pina',
      acteur: 'Alvaro Morte , Ursula Corbe , Itziar Ituno'),
  MediaModel(
    imageUrl:
        'https://i.pinimg.com/originals/da/48/d4/da48d46c45c07f4f9fa41abbeb791e0a.png',
    title: 'Game of Throne',
    description:
        "Neuf familles nobles rivalisent pour le contrôle du Trône de Fer dans les sept royaumes de Westeros. Pendant ce temps, des anciennes créatures mythiques oubliées reviennent pour faire des ravages.",
    saison: '8',
    episode: '73',
    sortie: '17 avril 2011',
    producteur: 'Mark Huffam',
    acteur: 'Kit Harington , Peter Dinklage , Emilia Clarke ',
  ),
  MediaModel(
    imageUrl:
        'https://i.pinimg.com/originals/23/51/f5/2351f5a67ebaacf28ff440179903fa64.png',
    title: 'Peaky Blinders',
    description:
        "Birmingham, en 1919. Un gang familial règne sur un quartier de la ville : les Peaky Blinders, ainsi nommés pour les lames de rasoir qu'ils cachent dans la visière de leur casquette.",
    saison: '5',
    episode: '30',
    sortie: '13 septembre 2013',
    producteur: 'Katie Swinden',
    acteur: 'Cillian Murphy , Helen McCroy , Paul Anderson ',
  ),
  MediaModel(
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/8/8a/Brooklyn_Nine-Nine_Logo.png',
    title: 'Brooklyn 99',
    description:
        "Cette comédie chorale suit les personnages et les affaires d'un commissariat de Brooklyn, loin des dangers et des affaires plus spectaculaires du très chic Manhattan.",
    saison: '7',
    episode: '143',
    sortie: '17 septembre 2013',
    producteur: 'Dan Goor',
    acteur: 'Andy Samberg  , Stephanie Beatriz , Stephanie Beatriz ',
  ),
  MediaModel(
    imageUrl:
        'https://seeklogo.com/images/P/prison-break-logo-9E647F5A39-seeklogo.com.png',
    title: 'Prison Break',
    description:
        "Son frère injustement accusé de meurtre, un ingénieur en génie civil décide de le faire évader de prison.",
    saison: '5',
    episode: '90',
    sortie: '29 août 2005',
    producteur: 'Paul Scheuring',
    acteur: 'Wentworth Miller , Dominic Purcell , Dominic Purcell',
  )
];

final films = [
  MediaModel(
      imageUrl: 'images/bds/aldebaran.jpg',
      title: 'Aldébaran',
      description: "Les mondes d'Aldébaran ...",
      sortie: '',
      producteur: '12',
      acteur: '12',
      duree: '12'),
  MediaModel(
      imageUrl: 'images/bds/le_tueur.jpg',
      title: 'Le tueur',
      description: "Bd cynique sur le monde...",
      sortie: '',
      producteur: '12',
      acteur: '12',
      duree: '12'),
];

final manga = [
  MediaModel(
    imageUrl: 'images/bds/aldebaran.jpg',
    title: 'Aldébaran',
    description: "Les mondes d'Aldébaran ...",
    saison: '12',
    episode: '12',
    producteur: '12',
    acteur: '12',
  ),
  MediaModel(
    imageUrl: 'images/bds/le_tueur.jpg',
    title: 'Le tueur',
    description: "Bd cynique sur le monde...",
    saison: '12',
    episode: '12',
    sortie: '',
    producteur: '',
  ),
];
