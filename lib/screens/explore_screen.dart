import 'package:flutter/material.dart';
import '../widgets/blog_post_card.dart';
import '../widgets/marketplace_item_card.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFF222222),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              hintText: 'Search plants, blogs, marketplace',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Color(0xFF4AE54A),
          labelColor: Color(0xFF4AE54A),
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: 'Community & Blogs'),
            Tab(text: 'Marketplace'),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fern_background.jpg'),
            fit: BoxFit.cover,
            opacity: 0.1,
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: [
            // Community & Blogs Tab
            ListView(
              padding: EdgeInsets.all(16),
              children: [
                BlogPostCard(
                  authorName: 'Emma Johnson',
                  authorAvatar: 'assets/images/avatar1.jpg',
                  timePosted: '2 hours ago',
                  title: 'How to care for your indoor plants during winter',
                  content:
                      'Winter can be tough for houseplants with less light and dry air from heating. Here are my top tips to keep your green friends happy...',
                  imageUrl: 'assets/images/winter_plants.jpg',
                  likes: 124,
                  comments: 32,
                ),
                SizedBox(height: 16),
                BlogPostCard(
                  authorName: 'Michael Chen',
                  authorAvatar: 'assets/images/avatar2.jpg',
                  timePosted: '1 day ago',
                  title: 'Ultimate guide to propagating Monstera plants',
                  content:
                      'Propagating Monstera is easier than you think! In this guide I\'ll show you step-by-step how to get new plants from your existing ones...',
                  imageUrl: 'assets/images/monstera.jpg',
                  likes: 287,
                  comments: 56,
                ),
                SizedBox(height: 16),
                BlogPostCard(
                  authorName: 'Sarah Williams',
                  authorAvatar: 'assets/images/avatar3.jpg',
                  timePosted: '3 days ago',
                  title: 'My top 5 low-maintenance plants for beginners',
                  content:
                      'New to plants? Don\'t worry! These 5 houseplants are perfect for beginners and nearly impossible to kill...',
                  imageUrl: 'assets/images/beginner_plants.jpg',
                  likes: 342,
                  comments: 47,
                ),
              ],
            ),

            // Marketplace Tab
            GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                List<Map<String, dynamic>> items = [
                  {
                    'name': 'Monstera Deliciosa',
                    'price': 34.99,
                    'seller': 'Green Thumb',
                    'imageUrl': 'assets/images/monstera_sale.jpg',
                  },
                  {
                    'name': 'Snake Plant',
                    'price': 22.50,
                    'seller': 'Plant Paradise',
                    'imageUrl': 'assets/images/snake_plant.jpg',
                  },
                  {
                    'name': 'Fiddle Leaf Fig',
                    'price': 49.99,
                    'seller': 'Urban Jungle',
                    'imageUrl': 'assets/images/fiddle_leaf.jpg',
                  },
                  {
                    'name': 'Pothos',
                    'price': 18.99,
                    'seller': 'Green Thumb',
                    'imageUrl': 'assets/images/pothos.jpg',
                  },
                  {
                    'name': 'ZZ Plant',
                    'price': 27.99,
                    'seller': 'Plant Paradise',
                    'imageUrl': 'assets/images/zz_plant.jpg',
                  },
                  {
                    'name': 'Peace Lily',
                    'price': 24.50,
                    'seller': 'Urban Jungle',
                    'imageUrl': 'assets/images/peace_lily.jpg',
                  },
                ];

                return MarketplaceItemCard(
                  name: items[index]['name'],
                  price: items[index]['price'],
                  seller: items[index]['seller'],
                  imageUrl: items[index]['imageUrl'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
