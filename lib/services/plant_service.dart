import '../models/plant.dart';

class PlantService {
  // Simulate a database of plants
  final List<Plant> _plants = [
    Plant(
      id: '1',
      name: 'Monstera Deliciosa',
      scientificName: 'Monstera deliciosa',
      imageUrl: 'assets/images/monstera.jpg',
      type: 'Houseplant',
      description:
          'Known for its large, glossy, perforated leaves, the Monstera is a popular houseplant that adds a tropical touch to any room.',
      care:
          'Water when top inch of soil is dry, provide bright indirect light, and high humidity.',
      isHealthy: true,
      lastWatered: DateTime.now().subtract(Duration(days: 4)),
      nextWatering: DateTime.now().add(Duration(days: 3)),
      location: 'Living Room',
    ),
    Plant(
      id: '2',
      name: 'Snake Plant',
      scientificName: 'Sansevieria trifasciata',
      imageUrl: 'assets/images/snake_plant.jpg',
      type: 'Houseplant',
      description:
          'The Snake Plant is one of the most tolerant houseplants you can grow, making it perfect for beginners.',
      care:
          'Water sparingly, allow soil to dry completely between waterings. Tolerates low light conditions.',
      isHealthy: true,
      lastWatered: DateTime.now().subtract(Duration(days: 12)),
      nextWatering: DateTime.now().add(Duration(days: 8)),
      location: 'Bedroom',
    ),
    Plant(
      id: '3',
      name: 'Fiddle Leaf Fig',
      scientificName: 'Ficus lyrata',
      imageUrl: 'assets/images/fiddle_leaf.jpg',
      type: 'Houseplant',
      description:
          'The Fiddle Leaf Fig is a popular indoor tree with large, violin-shaped leaves that grow upright.',
      care:
          'Water when top inch of soil is dry, provide bright indirect light, and moderate humidity.',
      isHealthy: false,
      lastWatered: DateTime.now().subtract(Duration(days: 7)),
      nextWatering: DateTime.now().add(Duration(days: 0)),
      location: 'Living Room',
    ),
  ];

  // Get all plants
  List<Plant> getAllPlants() {
    return _plants;
  }

  // Get user's plants
  List<Plant> getUserPlants() {
    return _plants;
  }

  // Get plant by ID
  Plant? getPlantById(String id) {
    try {
      return _plants.firstWhere((plant) => plant.id == id);
    } catch (e) {
      return null;
    }
  }

  // Add a new plant
  void addPlant(Plant plant) {
    _plants.add(plant);
  }

  // Update plant details
  void updatePlant(Plant updatedPlant) {
    final index = _plants.indexWhere((plant) => plant.id == updatedPlant.id);
    if (index != -1) {
      _plants[index] = updatedPlant;
    }
  }

  // Delete a plant
  void deletePlant(String id) {
    _plants.removeWhere((plant) => plant.id == id);
  }

  // Get plants that need watering today
  List<Plant> getPlantsNeedingWater() {
    final now = DateTime.now();
    return _plants
        .where((plant) =>
            plant.nextWatering.year == now.year &&
            plant.nextWatering.month == now.month &&
            plant.nextWatering.day == now.day)
        .toList();
  }

  // Get plants with health issues
  List<Plant> getUnhealthyPlants() {
    return _plants.where((plant) => !plant.isHealthy).toList();
  }

  // Analyze plant image and return identification results
  // This is a mock implementation - in a real app, this would call an ML model
  Future<Map<String, dynamic>> analyzePlantImage(String imagePath) async {
    // Simulate a delay for processing
    await Future.delayed(Duration(seconds: 2));

    // Mock result - in a real app, this would be the result from an ML model
    return {
      'name': 'Monstera Deliciosa',
      'scientificName': 'Monstera deliciosa',
      'health': 'Healthy',
      'waterIn': '3 days',
      'light': 'Indirect sunlight',
      'temperature': '18-27°C',
      'humidity': 'High',
      'confidenceScore': 0.95,
    };
  }
}
