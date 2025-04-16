class CatModel {
  final String breedName;
  final String country;
  final String description;
  final String lifespan;
  final String imageUrl;

  CatModel({
    required this.breedName,
    required this.country,
    required this.description,
    required this.lifespan,
    required this.imageUrl,
  });

  factory CatModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> breeds = json['breeds'][0];

    return CatModel(
      breedName: breeds['name'],
      country: breeds['origin'],
      description: breeds['description'],
      lifespan: breeds['life_span'],
      imageUrl: json['url'],
    );
  }
}
