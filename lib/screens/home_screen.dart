import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../models/category.dart';
import '../widgets/pet_card.dart';
import 'explore_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy featured pets for "Trending now"
    final trendingPets = pets.take(3).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header & Search
              Row(
                children: [
                   const Icon(Icons.pets, color: Color(0xFF8B5F43), size: 32),
                   const SizedBox(width: 16),
                   Expanded(
                     child: Container(
                       padding: const EdgeInsets.symmetric(horizontal: 16),
                       height: 50,
                       decoration: BoxDecoration(
                         color: Colors.grey[100],
                         borderRadius: BorderRadius.circular(25),
                       ),
                       child: Row(
                         children: const [
                           Icon(Icons.search, color: Colors.grey),
                           SizedBox(width: 8),
                           Expanded(
                             child: TextField(
                               decoration: InputDecoration(
                                 hintText: 'Search Product or Brand',
                                 border: InputBorder.none,
                                 hintStyle: TextStyle(color: Colors.grey),
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                ],
              ),
              const SizedBox(height: 24),

              // Banner
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: const Color(0xFF4DB6AC), // Teal-ish color from image
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -20,
                      bottom: -20,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.white.withValues(alpha: 0.1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Canagan Dental',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Get Up To 40% OFF',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Image would go here if we had assets
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Trending Now
              _buildSectionHeader('Trending now', () {}),
              const SizedBox(height: 16),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trendingPets.length,
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 160,
                      margin: const EdgeInsets.only(right: 16),
                      child: PetCard(pet: trendingPets[index]),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),

              // Browse Pet Types
              _buildSectionHeader('Browse pet types', () {}),
              const SizedBox(height: 16),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final cat = categories[index];
                    return Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: _getCategoryColor(index),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(cat.icon, style: const TextStyle(fontSize: 32)),
                          const SizedBox(height: 8),
                          Text(
                            cat.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),

              // New Arrivals (All Pets)
              _buildSectionHeader('New Arrivals', () {
                // Navigate to Explore tab (simple way: just switch tab if we had access to controller, 
                // or push ExploreScreen. For now we just push explore screen)
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ExploreScreen()),
                 );
              }),
              const SizedBox(height: 16),
              // Use shrinkWrap true and physics NeverScrollableScrollPhysics to put grid inside Listview
              GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                // Show all pets
                itemCount: pets.length,
                itemBuilder: (context, index) {
                  // reverse list to show different pets or just show all
                  final reversedPets = pets.reversed.toList();
                  return PetCard(pet: reversedPets[index]);
                },
              ),
               const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, VoidCallback onSeeAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        TextButton(
          onPressed: onSeeAll,
          child: const Text(
            'See all',
            style: TextStyle(color: Color(0xFFFE7D55)),
          ),
        ),
      ],
    );
  }

  Color _getCategoryColor(int index) {
    // Alternating pastel colors for categories
    final colors = [
      const Color(0xFFFFF3E0), // Orange tint
      const Color(0xFFE8F5E9), // Green tint
      const Color(0xFFE3F2FD), // Blue tint
      const Color(0xFFF3E5F5), // Purple tint
    ];
    return colors[index % colors.length];
  }
}
