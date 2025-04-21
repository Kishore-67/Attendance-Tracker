import 'package:flutter/material.dart';

class MarksPage extends StatelessWidget {
  final List<Map<String, dynamic>> marksData = [
    {"subject": "Math", "marks": 95},
    {"subject": "Science", "marks": 88},
    {"subject": "English", "marks": 92},
    {"subject": "History", "marks": 85},
  ];

  MarksPage({super.key});

  @override
  Widget build(BuildContext context) {
num total = marksData.fold(0, (sum, item) => sum + item['marks']);
double percentage = (total / (marksData.length * 100)) * 100;


    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Marks"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...marksData.map((data) => Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: ListTile(
                    leading: const Icon(Icons.book, color: Colors.indigo),
                    title: Text(
                      data['subject'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "${data['marks']}/100",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                )),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.indigo.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    "Total Marks",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "$total / ${marksData.length * 100}",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                 Text(
  "Percentage: ${percentage.toStringAsFixed(2)}%",
  style: const TextStyle(
    fontSize: 18,
    color: Colors.indigo,
  ),
),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
