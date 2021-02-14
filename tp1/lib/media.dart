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
          'https://fr.web.img2.acsta.net/pictures/18/07/23/11/26/3445791.jpg',
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
          'https://fr.web.img5.acsta.net/pictures/19/07/22/09/56/1827026.jpg',
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
        'https://images-na.ssl-images-amazon.com/images/I/6199ZN-rw7L._AC_SY679_.jpg',
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
    imageUrl: 'https://m.media-amazon.com/images/I/510shbs+JmL._AC_.jpg',
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
        'https://fr.web.img6.acsta.net/pictures/20/01/10/10/21/2604988.jpg',
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
        'https://fr.web.img4.acsta.net/pictures/18/10/30/14/28/5858042.jpg',
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
      imageUrl:
          'https://fr.web.img2.acsta.net/pictures/19/04/04/09/04/0472053.jpg',
      title: 'Avengers EndGame',
      description:
          "Le Titan Thanos, ayant réussi à s'approprier les six Pierres d'Infinité et à les réunir sur le Gantelet doré, a pu réaliser son objectif de pulvériser la moitié de la population de l'Univers. Cinq ans plus tard, Scott Lang, alias Ant-Man, parvient à s'échapper de la dimension subatomique où il était coincé. Il propose aux Avengers une solution pour faire revenir à la vie tous les êtres disparus, dont leurs alliés et coéquipiers : récupérer les Pierres d'Infinité dans le passé.",
      sortie: '24 avril 2019',
      producteur: 'Joe Russo',
      acteur: 'Chris Evans , Robert Downey Jr. , Chris Hemsworth',
      duree: '181 minutes'),
  MediaModel(
      imageUrl:
          'https://img-4.linternaute.com/cip2YBDZkVvjU4a2tqiFIaf6Yhw=/1240x/a9bfc660898e44a19d2d36f463c9c955/ccmcms-linternaute/124775.jpg',
      title: 'Avatar ',
      description:
          "Malgré sa paralysie, Jake Sully, un ancien marine immobilisé dans un fauteuil roulant, est resté un combattant au plus profond de son être. Il est recruté pour se rendre à des années-lumière de la Terre, sur Pandora, où de puissants groupes industriels exploitent un minerai rarissime destiné à résoudre la crise énergétique sur Terre. Parce que l'atmosphère de Pandora est toxique pour les humains, ceux-ci ont créé le Programme Avatar, qui permet à des ' pilotes ' humains de lier leur esprit à un avatar, un corps biologique commandé à distance, capable de survivre dans cette atmosphère létale. Ces avatars sont des hybrides créés génétiquement en croisant l'ADN humain avec celui des Na'vi, les autochtones de Pandora.",
      sortie: '16 décembre 2009',
      producteur: 'James Cameron',
      acteur: 'Sam Worthington , Zoe Saldana , Sigourney Weaver',
      duree: '162 minutes'),
  MediaModel(
      imageUrl:
          'https://fr.web.img4.acsta.net/pictures/14/10/14/09/50/570218.jpg',
      title: 'American Sniper',
      description:
          "Bouleversé par l'attaque de l'ambassade américaine en Tanzanie et au Kenya en 1998, Chris Kyle, star du rodéo, choisit de changer le cours de sa vie. À 30 ans, il quitte son Texas natal et s'engage chez les Navy Seals. Le jeune homme devient l'un des meilleurs snipers de son unité. Au lendemain des attentats du 11 septembre, Kyle est envoyé en Irak.",
      sortie: '18 février 2015',
      producteur: 'Clint Eastwood',
      acteur: 'Bradley Cooper , Bradley Cooper , Luke Grimes ',
      duree: '132 minutes'),
  MediaModel(
      imageUrl:
          'https://fr.web.img2.acsta.net/pictures/19/10/25/11/18/5224976.jpg',
      title: 'Titanic',
      description:
          "En 1997, l'épave du Titanic est l'objet d'une exploration fiévreuse, menée par des chercheurs de trésor en quête d'un diamant bleu qui se trouvait à bord. Frappée par un reportage télévisé, l'une des rescapés du naufrage, âgée de 102 ans, Rose DeWitt, se rend sur place et évoque ses souvenirs. 1912. Fiancée à un industriel arrogant, Rose croise sur le bateau un artiste sans le sou.",
      sortie: '7 janvier 1998',
      producteur: 'James Cameron',
      acteur: 'Kate Winslet , Leonardo DiCaprio , Billy Zane',
      duree: '195 minutes'),
  MediaModel(
      imageUrl:
          'https://fr.web.img3.acsta.net/medias/nmedia/18/83/56/27/20158098.jpg',
      title: 'Batman : The Dark Night Rises',
      description:
          "Il y a huit ans, Batman a disparu dans la nuit : lui qui était un héros est alors devenu un fugitif. L'arrivée d'une féline et fourbe cambrioleuse au mystérieux dessein chamboule l'ordre établi. Bien plus dangereuse encore est l'apparition de Bane, terroriste masqué dont l'impitoyable projet pour Gotham pousse Bruce à sortir de l'exil qu'il s'est imposé. Mais bien qu'il reprenne cape et masque, Batman pourrait ne pas être un adversaire à la taille de Bane..",
      sortie: '25 juillet 2012',
      producteur: 'Christopher nolan',
      acteur: 'Christian Bale , Anne Hathaway , Tom Hardy',
      duree: '164 minutes'),
  MediaModel(
      imageUrl:
          'https://img-4.linternaute.com/hjM5dgLFPajbUWUmTVDwLHOqt3c=/1240x/19547719906f480d80a7c0a77d93f6be/ccmcms-linternaute/127232.jpg',
      title: 'Inception',
      description:
          "Dom Cobb est un voleur expérimenté dans l'art périlleux de `l'extraction' : sa spécialité consiste à s'approprier les secrets les plus précieux d'un individu, enfouis au plus profond de son subconscient, pendant qu'il rêve et que son esprit est particulièrement vulnérable. Très recherché pour ses talents dans l'univers trouble de l'espionnage industriel, Cobb est aussi devenu un fugitif traqué dans le monde entier. Cependant, une ultime mission pourrait lui permettre de retrouver sa vie d'avant.",
      sortie: '21 juillet 2010',
      producteur: 'Christopher nolan',
      acteur: 'Leonardo DiCaprio , Joseh Gordon , Marion Cotillard  ',
      duree: '147 minutes'),
];

final manga = [
  MediaModel(
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/I/913tiXjkVxL.jpg',
    title: 'One Piece',
    description:
        "Avant son exécution, le pirate légendaire Gold Roger lance une chasse au trésor sans précédent et stimule ainsi les pirates du monde entier. Luffy, transformé en homme élastique après avoir mangé un fruit du démon, rêve de devenir le roi des pirates et de trouver le mystérieux “One Piece”. L’ère des pirates bat son plein, Luffy au chapeau de paille et son équipage affronteront des ennemis hauts en couleurs et vivront des aventures rocambolesques ",
    saison: '98',
    episode: '961',
    producteur: 'Eiichiro Oda',
    sortie: '22 juillet 97',
  ),
  MediaModel(
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/I/81HZk+jg63L.jpg',
    title: 'Naruto',
    description:
        "Naruto est un garçon un peu spécial. Solitaire au caractère fougueux, il n'est pas des plus appréciés dans son village. Malgré cela, il garde au fond de lui une ambition: celle de devenir un 'maître Hokage', la plus haute distinction dans l'ordre des ninjas, et ainsi obtenir la reconnaissance de ses pairs mais cela ne sera pas de tout repos.",
    saison: '72',
    episode: '720',
    producteur: 'Masashi Kishimoto',
    sortie: '20 septembre 1999',
  ),
  MediaModel(
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/I/818iOY65dfL.jpg',
    title: 'Death Note',
    description:
        "Light Yagami, un jeune étudiant surdoué, ramasse un jour le 'Death Note', un carnet abandonné par un dieu de la mort, Ryuk, qui apparemment s'ennuyait dans son monde. Il suffit d'écrire le nom d'une personne dans ce carnet, et celle-ci meurt. C'est ainsi qu'avec le 'Death Note' entre les mains, Light décide de débarrasser la planète de tous les criminels pour en faire un monde juste, un monde parfait.",
    saison: '13',
    episode: '37',
    producteur: 'Takeshi Obata',
    sortie: '1er décembre 2003',
  ),
  MediaModel(
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/116335/DIG023934._SX1280_QL80_TTD_.jpg',
    title: 'Hunter X Hunter',
    description:
        "Le jeune Gon vit sur une petite île avec sa tante. Abandonné par son père qui est un Hunter, à la fois un aventurier et un chasseur de primes, Gon décide à l'âge de 12 ans de partir pour devenir un Hunter. Cela ne sera pas chose aisée, il devra passer une suite de tests et examens en compagnie de milliers d'autres prétendants au titre de Hunter. Il sera aidé par de nouvelles connaissances qui aspirent au même but que lui tel que Kurapika, Leorio et Killua.",
    saison: '36',
    episode: '62',
    producteur: 'Yoshihiro Togashi',
    sortie: '3 mars 1998',
  ),
  MediaModel(
    imageUrl:
        'https://www.glenat.com/sites/default/files/styles/large/public/images/livres/couv/9782723457897-001-G.jpeg',
    title: 'Dragon Ball Z',
    description:
        "Cinq ans après le mariage de Son Gokû, Raditz, un mystérieux guerrier de l'espace, arrive sur Terre. Il apprend à Son Gôku qu'il ne reste plus que quatre survivant sur leur planète et que ce dernier avait été envoyé sur terre pour la détruire…",
    saison: '',
    episode: '291',
    producteur: 'Takao Koyama',
    sortie: '26 avril 1989',
  ),
  MediaModel(
    imageUrl:
        'https://www.pika.fr/sites/default/files/images/livres/couv/9782811611699-T.jpg',
    title: "L'attaque des titans",
    description:
        "Dans un monde ravagé par des titans mangeurs d’homme depuis plus d’un siècle, les rares survivants de l’Humanité n’ont d’autre choix pour survivre que de se barricader dans une cité-forteresse. Le jeune Eren, témoin de la mort de sa mère dévorée par un titan, n’a qu’un rêve : entrer dans le corps d’élite chargé de découvrir l’origine des Titans et les annihiler jusqu’au dernier…",
    saison: '34',
    episode: '75',
    producteur: 'Yasuko Kobayashi',
    sortie: '9 septembre 2009',
  ),
];
