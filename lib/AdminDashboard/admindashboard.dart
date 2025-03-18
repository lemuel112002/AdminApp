import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DOPEFITSPH", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: Drawer(  // Side Navigation Drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              child: Text("Menu", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            _buildDrawerItem(Icons.dashboard, "Dashboard", () {}),
            _buildDrawerItem(Icons.shopping_cart, "Orders", () {}),
            _buildDrawerItem(Icons.person, "Users", () {}),
            _buildDrawerItem(Icons.store, "Products", () {}),
            _buildDrawerItem(Icons.inventory, "Inventory", () {}),
            const Divider(),  // Line separator
            _buildDrawerItem(Icons.logout, "Logout", () {}),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                children: [
                  _buildDashboardCard(Icons.shopping_cart, "Orders"),
                  _buildDashboardCard(Icons.person, "Users"),
                  _buildDashboardCard(Icons.store, "Products"),
                  _buildDashboardCard(Icons.inventory, "Inventory"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(IconData icon, String label) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.red),
          const SizedBox(height: 10),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

 Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: onTap, // Add navigation logic inside onTap
    );
  }
