import 'package:flutter/material.dart';
import '../models/plant.dart';
import '../widgets/my_plant_card.dart';
import '../widgets/category_count_card.dart';
import '../widgets/plant_alert_card.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Plants',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'View all',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fern_background.jpg'),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      MyPlantCard(
                        imageUrl: 'assets/images/peperomia.jpg',
                        name: 'Peperomia',
                        type: 'Houseplant',
                        status: 'I am well',
                        backgroundColor: Colors.green[800]!,
                      ),
                      SizedBox(width: 16),
                      MyPlantCard(
                        imageUrl: 'assets/images/aglaonema.jpg',
                        name: 'Aglaonema',
                        type: 'Houseplant',
                        status: 'I need help!',
                        backgroundColor: Colors.red[800]!,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CategoryCountCard(
                        count: 2,
                        title: 'Plants',
                        subtitle: 'Living Room',
                        icon: Icons.grid_view,
                        color: Colors.amber[700]!,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: CategoryCountCard(
                        count: 1,
                        title: 'Plant',
                        subtitle: 'Kitchen',
                        icon: Icons.kitchen,
                        color: Colors.blue[700]!,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CategoryCountCard(
                        count: 2,
                        title: 'Plants',
                        subtitle: 'Drawing Room',
                        icon: Icons.weekend,
                        color: Colors.orange[700]!,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: CategoryCountCard(
                        count: 3,
                        title: 'Plants',
                        subtitle: 'Backyard',
                        icon: Icons.yard,
                        color: Colors.purple[700]!,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Alerts for today',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'View all',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                PlantAlertCard(
                  title: 'Water your Cactus today (living room)',
                  description:
                      'It\'s 2 weeks old, you have to water it twice a week',
                  icon: Icons.water_drop,
                ),
                SizedBox(height: 12),
                PlantAlertCard(
                  title: 'Prune the dead branches of Bamboo tree',
                  description:
                      'It\'s been 2 weeks since you have pruned, time to do it again',
                  icon: Icons.content_cut,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
