import 'package:flutter/material.dart';

void main() {
  runApp(const FreeFireTournamentApp());
}

class FreeFireTournamentApp extends StatelessWidget {
  const FreeFireTournamentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Free Fire Tournaments',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const TournamentHomePage(),
    );
  }
}

class TournamentHomePage extends StatefulWidget {
  const TournamentHomePage({super.key});

  @override
  State<TournamentHomePage> createState() => _TournamentHomePageState();
}

class _TournamentHomePageState extends State<TournamentHomePage> {
  final List<Map<String, String>> tournaments = [
    {
      'name': 'Free Fire Weekend Clash',
      'date': 'Every Saturday, 2 PM - 5 PM',
      'entry': 'Free Entry - Register via App',
      'rewards': 'Up to 5000 Diamonds + BP Points',
    },
    {
      'name': 'Daily Free Tournament',
      'date': 'Daily, 8 PM - 10 PM',
      'entry': 'No Cost - Open to All',
      'rewards': 'Gold Coins & Exclusive Skins',
    },
    {
      'name': 'Beginner Friendly Free Tourney',
      'date': 'Sundays, 10 AM - 12 PM',
      'entry': 'Free - Level 10+ Required',
      'rewards': 'Starter Packs & Emotes',
    },
  ];

  void _refreshTournaments() {
    // Placeholder for refresh logic (e.g., fetch from API later)
    setState(() {
      // Could add loading state or new data here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Free Tournaments in Free Fire'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder(
        itemCount: tournaments.length,
        itemBuilder: (context, index) {
          final tournament = tournaments[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tournament['name']!,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Date: ${tournament['date']}', style: Theme.of(context).textTheme.bodyMedium),
                  Text('Entry: ${tournament['entry']}', style: Theme.of(context).textTheme.bodyMedium),
                  Text('Rewards: ${tournament['rewards']}', style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      // Placeholder for registration or details navigation
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Register for ${tournament['name']}')),
                      );
                    },
                    child: const Text('Register Now'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshTournaments,
        tooltip: 'Refresh Tournaments',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}