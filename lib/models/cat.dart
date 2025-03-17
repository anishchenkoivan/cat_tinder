class Cat {
  final String breedName;
  final String country;
  final String description;
  final String lifespan;
  final String wikipediaArticle;
  final String imageUrl;

  Cat({
    required this.breedName,
    required this.country,
    required this.description,
    required this.lifespan,
    required this.wikipediaArticle,
    required this.imageUrl,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> breeds = json['breeds'][0];

    return Cat(
      breedName: breeds['name'],
      country: breeds['origin'],
      description: breeds['description'],
      lifespan: breeds['life_span'],
      wikipediaArticle: breeds['wikipedia_url'],
      imageUrl: json['url'],
    );
  }
}