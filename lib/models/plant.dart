class Plant {
  final String id;
  final String name;
  final String scientificName;
  final String imageUrl;
  final String type;
  final String description;
  final String care;
  final bool isHealthy;
  final DateTime lastWatered;
  final DateTime nextWatering;
  final String location;

  Plant({
    required this.id,
    required this.name,
    required this.scientificName,
    required this.imageUrl,
    required this.type,
    required this.description,
    required this.care,
    required this.isHealthy,
    required this.lastWatered,
    required this.nextWatering,
    required this.location,
  });
}
