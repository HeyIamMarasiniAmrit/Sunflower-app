import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.yellow.shade700,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Amrit Marasini"),
              accountEmail: Text("amritmaraasi163@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.black),
              ),
            ),
            ListTile(
              title: Text('Purchase', style: GoogleFonts.lato()),
              subtitle: const Text('Purchase Item'),
              leading: const Icon(Icons.shopping_cart),
              onTap: () => debugPrint("Purchase pressed"),
            ),
            ListTile(
              title: Text('Sales', style: GoogleFonts.lato()),
              subtitle: const Text('Sales Item'),
              leading: const Icon(Icons.sell),
              onTap: () => debugPrint("Sales pressed"),
            ),
            ListTile(
              title: Text('Report', style: GoogleFonts.lato()),
              subtitle: const Text('Report Item'),
              leading: const Icon(Icons.report),
              onTap: () => debugPrint("Report pressed"),
            ),
            ListTile(
              title: Text('Users', style: GoogleFonts.lato()),
              subtitle: const Text('User Management'),
              leading: const Icon(Icons.supervised_user_circle),
              onTap: () => debugPrint("Users pressed"),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          "Welcome to SunFlower App 🌻",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
