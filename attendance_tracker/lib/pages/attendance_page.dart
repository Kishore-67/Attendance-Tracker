import 'package:flutter/material.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  // Dummy class and student data
  final Map<String, List<String>> classes = {
    'Class 10-A': ['Alice', 'Bob', 'Charlie'],
    'Class 9-B': ['David', 'Eva', 'Frank'],
    'Class 8-C': ['Grace', 'Harry', 'Ivy'],
  };

  // Attendance tracking
  final Map<String, Map<String, bool>> attendance = {};
  final Map<String, bool> submitted = {};

  @override
  void initState() {
    super.initState();
    for (var className in classes.keys) {
      attendance[className] = {};
      for (var student in classes[className]!) {
        attendance[className]![student] = false;
      }
      submitted[className] = false;
    }
  }

  // Get formatted date
  String get formattedDate {
    final now = DateTime.now();
    return '${_getWeekday(now.weekday)}, ${_getMonth(now.month)} ${now.day}, ${now.year}';
  }

  String _getWeekday(int weekday) {
    return ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'][weekday % 7];
  }

  String _getMonth(int month) {
    return [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ][month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            '📅 $formattedDate',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...classes.keys.map((className) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      className,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    ...classes[className]!.map((student) {
                      final isPresent = attendance[className]![student]!;
                      return ListTile(
                        title: Text(student),
                        trailing: submitted[className]!
                            ? Text(isPresent ? 'Present' : 'Absent')
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      if (!submitted[className]!) {
                                        setState(() {
                                          attendance[className]![student] = true;
                                        });
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: isPresent ? Colors.green : Colors.grey,
                                    ),
                                    child: const Text('Present'),
                                  ),
                                  const SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (!submitted[className]!) {
                                        setState(() {
                                          attendance[className]![student] = false;
                                        });
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: !isPresent ? Colors.red : Colors.grey,
                                    ),
                                    child: const Text('Absent'),
                                  ),
                                ],
                              ),
                      );
                    }).toList(),
                    const SizedBox(height: 10),
                    if (!submitted[className]!)
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            submitted[className] = true;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Attendance submitted for $className')),
                          );
                        },
                        icon: const Icon(Icons.check_circle),
                        label: const Text('Submit Attendance'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                      )
                    else
                      const Text(
                        '✅ Attendance Submitted',
                        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
