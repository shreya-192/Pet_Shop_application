import 'package:flutter/material.dart';
import 'login_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50], // Slightly off-white background
      appBar: AppBar(
        title: const Text(
          'My Account',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Header
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    // backgroundImage: NetworkImage('https://via.placeholder.com/150'), 
                    // Use icon for now since we don't have a reliable dummy image url that won't 404
                    backgroundColor: Color(0xFFFE7D55),
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Shreya Patel',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'shreya@example.com',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            
            // Menu Options
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  _buildListTile(context, Icons.shopping_bag_outlined, 'My Orders', () {}),
                  const Divider(height: 1, indent: 60),
                  _buildListTile(context, Icons.location_on_outlined, 'Shipping Address', () {}),
                  const Divider(height: 1, indent: 60),
                  _buildListTile(context, Icons.payment_outlined, 'Payment Methods', () {}),
                  const Divider(height: 1, indent: 60),
                  _buildListTile(context, Icons.favorite_border, 'Wishlist', () {}), 
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            Container(
              color: Colors.white,
              child: Column(
                children: [
                   _buildListTile(context, Icons.settings_outlined, 'Settings', () {}),
                   const Divider(height: 1, indent: 60),
                   _buildListTile(context, Icons.help_outline, 'Help & Support', () {}),
                   const Divider(height: 1, indent: 60),
                   _buildListTile(context, Icons.info_outline, 'About Us', () {}),
                ],
              ),
            ),

            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                     // Navigate back to Login Screen
                     Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                       (Route<dynamic> route) => false,
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: const BorderSide(color: Color(0xFFFE7D55)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                      color: Color(0xFFFE7D55),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
             const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFFE7D55).withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFFFE7D55), size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
