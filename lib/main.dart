import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Root of the app - just sets up the MaterialApp and points to our screen
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Widget Demo',
      debugShowCheckedModeBanner: false,
      home: const ProfileScreen(),
    );
  }
}

// We use StatefulWidget here because we need to update the Card properties
// live during the demo. A StatelessWidget can't rebuild itself on user interaction.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  // elevation controls how much shadow appears beneath the card.
  // Think of it like lifting the card off the screen — the higher the value,
  // the more shadow and the more "raised" it looks. Default is 8.
  double cardElevation = 8;

  // color sets the background color of the card surface.
  // Useful when you want to visually distinguish cards — for example,
  // highlighting a selected user or flagging an error state. Default is white.
  Color cardColor = Colors.white;

  // shape controls the corner style of the card.
  // We use RoundedRectangleBorder with a borderRadius to round the corners.
  // A radius of 0 gives sharp corners, 32 gives a very rounded pill-like look.
  // Default is 16 — moderately rounded.
  double cardRadius = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget Demo'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // This is the Card widget — the main focus of this demo.
          // It wraps the profile content and gives it a Material Design look.
          Center(
            child: Card(
              elevation: cardElevation, // controls shadow depth
              color: cardColor,         // controls background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cardRadius), // controls corner style
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Profile avatar
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.indigo,
                      child: Icon(Icons.person, size: 40, color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    // Name
                    const Text(
                      'Hasbiyallah',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Role
                    Text(
                      'Flutter Developer',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4),
                    // Location
                    Text(
                      'Kigali, Rwanda',
                      style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Demo control buttons — these let us change each Card property live.
          // Each button calls setState(), which tells Flutter to rebuild the
          // widget with the new value, so the change appears instantly.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [

                // Buttons to demo the elevation property
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('elevation',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        _demoButton('0 (flat)', () {
                          setState(() => cardElevation = 0);
                        }),
                        const SizedBox(width: 8),
                        _demoButton('8 (default)', () {
                          setState(() => cardElevation = 8);
                        }),
                        const SizedBox(width: 8),
                        _demoButton('20 (high)', () {
                          setState(() => cardElevation = 20);
                        }),
                      ],
                    ),
                  ],
                ),

                const Divider(height: 24),

                // Buttons to demo the color property
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('color',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        _demoButton('white', () {
                          setState(() => cardColor = Colors.white);
                        }),
                        const SizedBox(width: 8),
                        _demoButton('amber', () {
                          setState(() => cardColor = Colors.amber[100]!);
                        }),
                        const SizedBox(width: 8),
                        _demoButton('blue', () {
                          setState(() => cardColor = Colors.blue[50]!);
                        }),
                      ],
                    ),
                  ],
                ),

                const Divider(height: 24),

                // Buttons to demo the shape property
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('shape',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        _demoButton('sharp', () {
                          setState(() => cardRadius = 0);
                        }),
                        const SizedBox(width: 8),
                        _demoButton('default', () {
                          setState(() => cardRadius = 16);
                        }),
                        const SizedBox(width: 8),
                        _demoButton('pill', () {
                          setState(() => cardRadius = 32);
                        }),
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }

  // A reusable helper that builds a small indigo button.
  // Takes a label and a function to run when tapped.
  Widget _demoButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        textStyle: const TextStyle(fontSize: 12),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      child: Text(label),
    );
  }
}