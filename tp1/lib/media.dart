class MediaModel {
  String imageUrl;
  String title;
  String description;
  String saison;
  String episode;

  // Constructor
  MediaModel(
      {this.imageUrl, this.title, this.description, this.saison, this.episode});
}

final series = [
  MediaModel(
    imageUrl:
        'https://m.media-amazon.com/images/M/MV5BNzRlNGUzMmEtYTg0Ni00N2U2LTg4YWEtNDdlNmMwYjBlZDQ0XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_FMjpg_UY864_.jpg',
    title: 'Lupin',
    description:
        "Série Netflix blablablablablablablab dhfoiuqhedfhqdibvfiudsqbhfliuvhqdmuvfhcqkfhfvjkcnqbdfmuvqùishfu khgfihz jhdsgifluczel jhsdgicqgsd  skgdfius LJHEGFUYD UYGFDUG IF jergf lkuegf lqljyfg qhgfqdk jhdgfc jdsw ljdhfg ldg ldjgf lqjdsg fjld gfluyqg ifydqg uysdg uyg dsouyg udyg iug iosyfg idgqg eo dfqo eydgf oyig",
    saison: '12',
    episode: '12',
  ),
  MediaModel(
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/fr/6/67/StrangerThingslogo.png',
    title: 'Stranger Things',
    description: "Série Netflix ...",
    saison: '12',
    episode: '12',
  ),
  MediaModel(
    imageUrl:
        'https://static.wikia.nocookie.net/amazons-the-boys/images/0/06/The_Boys_infobox.jpg/revision/latest/scale-to-width-down/1000?cb=20200708001204',
    title: 'The Boys',
    description: "Série Amazon ...",
    saison: '12',
    episode: '12',
  ),
];

final films = [
  MediaModel(
    imageUrl: 'images/bds/aldebaran.jpg',
    title: 'Aldébaran',
    description: "Les mondes d'Aldébaran ...",
    saison: '12',
    episode: '12',
  ),
  MediaModel(
    imageUrl: 'images/bds/le_tueur.jpg',
    title: 'Le tueur',
    description: "Bd cynique sur le monde...",
    saison: '12',
    episode: '12',
  ),
];

final manga = [
  MediaModel(
    imageUrl: 'images/bds/aldebaran.jpg',
    title: 'Aldébaran',
    description: "Les mondes d'Aldébaran ...",
    saison: '12',
    episode: '12',
  ),
  MediaModel(
    imageUrl: 'images/bds/le_tueur.jpg',
    title: 'Le tueur',
    description: "Bd cynique sur le monde...",
    saison: '12',
    episode: '12',
  ),
];
