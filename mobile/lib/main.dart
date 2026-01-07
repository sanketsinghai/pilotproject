import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digamber Jain',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        cardTheme: CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Digamber Jain Community',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey.shade100,
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            FeatureCard(
              title: 'Temples',
              subtitle: 'Find temples near you',
              icon: Icons.temple_buddhist,
              color: Colors.deepOrange,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TempleScreen()),
              ),
            ),
            const SizedBox(height: 12),
            FeatureCard(
              title: 'Sacred Texts',
              subtitle: 'Read holy scriptures',
              icon: Icons.library_books,
              color: Colors.amber,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TexasScreen()),
              ),
            ),
            const SizedBox(height: 12),
            FeatureCard(
              title: 'Trip Planner',
              subtitle: 'Plan your pilgrimage',
              icon: Icons.map,
              color: Colors.brown,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TripScreen()),
              ),
            ),
            const SizedBox(height: 12),
            FeatureCard(
              title: 'Learn',
              subtitle: 'Educational content',
              icon: Icons.school,
              color: Colors.blueGrey,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LearnScreen()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const FeatureCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Card(
          elevation: isHovered ? 8 : 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  widget.color.withOpacity(0.1),
                  widget.color.withOpacity(0.05),
                ],
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: widget.color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    widget.icon,
                    size: 40,
                    color: widget.color,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: widget.color,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TempleScreen extends StatelessWidget {
  const TempleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final temples = [
      {
        'name': 'Ancient Mahavira Temple',
        'location': '123 Temple Road, City',
        'distance': '2.5 km',
        'rating': '4.5',
        'reviews': '128',
      },
      {
        'name': 'Golden Jain Temple',
        'location': '456 Holy Street, District',
        'distance': '5.2 km',
        'rating': '4.8',
        'reviews': '256',
      },
      {
        'name': 'Sacred Digamber Temple',
        'location': '789 Faith Avenue, Region',
        'distance': '8.1 km',
        'rating': '4.3',
        'reviews': '95',
      },
      {
        'name': 'Shrine of Peace',
        'location': '321 Spiritual Lane, Area',
        'distance': '12.5 km',
        'rating': '4.6',
        'reviews': '178',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Temples'),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: temples.length,
        itemBuilder: (context, index) {
          final temple = temples[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          temple['name']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star, size: 16, color: Colors.orange),
                            const SizedBox(width: 4),
                            Text(
                              temple['rating']!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          temple['location']!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '📍 ${temple['distance']}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '👥 ${temple['reviews']} reviews',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      onPressed: () {},
                      child: const Text('View Details'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TexasScreen extends StatelessWidget {
  const TexasScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final texts = [
      {
        'title': 'Bhaktamber Stotra',
        'author': 'Acharya Kundakunda',
        'description': 'Sacred hymn praising the 24 Tirthankaras',
        'pages': '45',
        'hindi': 'भक्तामर स्तोत्र\n\nहे भूयोदरी! हे अभयोदरी! हे परमानन्दी! हे परमार्थी!\nहे सर्वग्य! हे सर्वदर्शी! हे सर्वशक्तिमान! हे परमेश्वरी!\n\nआपकी भक्ति से ही सभी दुःख दूर होते हैं। आपके चरणों में ही सच्ची शांति है।\nयह स्तोत्र 24 तीर्थंकरों की महिमा का वर्णन करता है।'
      },
      {
        'title': 'Tattvartha Sutra',
        'author': 'Umaswami',
        'description': 'A fundamental philosophical text of Jainism',
        'pages': '256',
        'hindi': 'तत्त्वार्थ सूत्र\n\nजैन धर्म के मूल सिद्धांत\n\n1. जीव - आत्मा\n2. अजीव - निर्जीव पदार्थ\n3. आस्रव - कर्मों का प्रवेश\n4. बंध - कर्मों का बंधन\n5. संवर - कर्मों को रोकना\n6. निर्जरा - कर्मों का नाश\n7. मोक्ष - मुक्ति'
      },
      {
        'title': 'Uttaradhyayana Sutra',
        'author': 'Anonymous',
        'description': 'Important teachings on monastic discipline',
        'pages': '342',
        'hindi': 'उत्तराध्यायन सूत्र\n\nमुनियों के आचार नियम\n\n• अहिंसा - किसी को हानि न पहुंचाना\n• सत्य - सच्ची बातें करना\n• अचौर्य - चोरी न करना\n• ब्रह्मचर्य - शुद्ध जीवन\n• अपरिग्रह - कुछ न रखना'
      },
      {
        'title': 'Bhagavati Sutra',
        'author': 'Mahavira',
        'description': 'Dialogues and teachings of Lord Mahavira',
        'pages': '498',
        'hindi': 'भगवती सूत्र\n\nभगवान महावीर की शिक्षाएं\n\nमहावीर ने कहा:\n"सभी प्राणियों में आत्मा है। सभी समान हैं।\nकिसी को दर्द न दो। सभी को प्यार करो।\nयह ही सच्चा धर्म है।"'
      },
      {
        'title': 'Karmasiddhi Shastra',
        'author': 'Gundhara',
        'description': 'Explanation of karma theory',
        'pages': '178',
        'hindi': 'कर्म सिद्धि शास्त्र\n\nकर्म का सिद्धांत\n\nजो कर्म तुम करोगे, वही फल भोगोगे।\nभले कर्म - खुशी देते हैं\nबुरे कर्म - दर्द देते हैं\n\nइसलिए हमेशा अच्छे कर्म करो।'
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Sacred Texts')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: texts.length,
        itemBuilder: (context, index) {
          final text = texts[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text['title']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'by ${text['author']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    text['description']!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '📖 ${text['pages']} pages',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.amber,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                text['title']!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              content: SingleChildScrollView(
                                child: Text(
                                  text['hindi']!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    height: 1.8,
                                    color: Colors.black87,
                                  ),
                                  textDirection: TextDirection.ltr,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text('Read'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TripScreen extends StatelessWidget {
  const TripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trips = [
      {
        'title': 'Sacred Temple Journey',
        'destinations': '5 temples in 7 days',
        'cost': '\$1,200',
        'difficulty': 'Medium',
        'spots': '23/50 booked',
      },
      {
        'title': 'Pilgrimage to Gaya',
        'destinations': 'Ancient spiritual sites',
        'cost': '\$950',
        'difficulty': 'Easy',
        'spots': '45/60 booked',
      },
      {
        'title': 'Mountain Retreat',
        'destinations': '3 hill temples',
        'cost': '\$1,500',
        'difficulty': 'Hard',
        'spots': '8/25 booked',
      },
      {
        'title': 'Coastal Temples Tour',
        'destinations': 'Seaside shrines exploration',
        'cost': '\$1,100',
        'difficulty': 'Easy',
        'spots': '52/70 booked',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Trip Planner')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: trips.length,
        itemBuilder: (context, index) {
          final trip = trips[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trip['title']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    trip['destinations']!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Chip(
                        label: Text(trip['difficulty']!),
                        backgroundColor: trip['difficulty'] == 'Easy'
                            ? Colors.green.shade100
                            : trip['difficulty'] == 'Medium'
                                ? Colors.amber.shade100
                                : Colors.red.shade100,
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        label: Text(trip['cost']!),
                        backgroundColor: Colors.blue.shade100,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        trip['spots']!,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: const Text('Book Now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class LearnScreen extends StatelessWidget {
  const LearnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lessons = [
      {
        'title': 'Introduction to Jainism',
        'category': 'History',
        'ageGroup': 'Ages 8-10',
        'duration': '5 min',
        'difficulty': '⭐ Easy',
      },
      {
        'title': 'The Path of Non-Violence',
        'category': 'Philosophy',
        'ageGroup': 'Ages 11-13',
        'duration': '10 min',
        'difficulty': '⭐⭐ Medium',
      },
      {
        'title': 'Life of Lord Mahavira',
        'category': 'Biography',
        'ageGroup': 'Ages 8-10',
        'duration': '7 min',
        'difficulty': '⭐ Easy',
      },
      {
        'title': 'Karma and Destiny',
        'category': 'Philosophy',
        'ageGroup': 'Ages 14+',
        'duration': '12 min',
        'difficulty': '⭐⭐⭐ Hard',
      },
      {
        'title': 'Jain Festivals',
        'category': 'Culture',
        'ageGroup': 'Ages 8-10',
        'duration': '6 min',
        'difficulty': '⭐ Easy',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Learning Hub')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          lesson['title']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const Icon(Icons.play_circle_outline,
                          color: Colors.blueGrey, size: 24),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      Chip(
                        label: Text(lesson['category']!),
                        backgroundColor: Colors.blue.shade100,
                        labelStyle: const TextStyle(fontSize: 12),
                      ),
                      Chip(
                        label: Text(lesson['ageGroup']!),
                        backgroundColor: Colors.green.shade100,
                        labelStyle: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lesson['duration']!,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            lesson['difficulty']!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: const Text('Start'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
