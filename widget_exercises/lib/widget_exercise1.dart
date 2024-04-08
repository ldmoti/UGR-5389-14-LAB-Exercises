import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarDetailsPage(),
    );
  }
}

class CarDetailsPage extends StatelessWidget {
  const CarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        actions: const [
          IconButton(
            icon: Icon(Icons.upload),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: null,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150.0,
              width: double.infinity,
              child: Image.asset(
                'assets/porche.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '1975 Porsche 911 Carrera',
              style: TextStyle(
                fontSize: 44.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Row(
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: null,
                ),
                Text('0'),
                SizedBox(width: 16.0),
                IconButton(
                  icon: Icon(Icons.chat_bubble_outline),
                  onPressed: null,
                ),
                Text('0'),
                SizedBox(width: 16.0),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: null,
                ),
                Text('Share'),
              ],
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Essential Information',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text('1 of 3 done'),
            const SizedBox(height: 16.0),
            const EssentialInfoItem(
              title: 'Year, Make, Model, VIN',
              details: [
                'Year: 1975',
                'Make: Porsche',
                'Model: 911 Carrera',
                'VIN: 9115400029',
              ],
            ),
            const EssentialInfoItem(
              title: 'Description',
              details: [],
            ),
            const EssentialInfoItem(
              title: 'Photos',
              details: [],
            ),
          ],
        ),
      ),
    );
  }
}

class EssentialInfoItem extends StatelessWidget {
  const EssentialInfoItem({
    super.key,
    required this.title,
    required this.details,
  });

  final String title;
  final List<String> details;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.green),
            const SizedBox(width: 8.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const IconButton(
              icon: Icon(Icons.edit),
              onPressed: null,
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        ...details.map((detail) => Text(detail)).toList(),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
