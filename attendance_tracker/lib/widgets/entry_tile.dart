import 'package:flutter/material.dart';
import '../models/attendance_entry.dart';

class EntryTile extends StatelessWidget {
  final AttendanceEntry entry;

  EntryTile({required this.entry});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(entry.studentName),
      subtitle: Text('Date: ${entry.date.toLocal()}'),
      trailing: Icon(
        entry.present ? Icons.check_circle : Icons.cancel,
        color: entry.present ? Colors.green : Colors.red,
      ),
    );
  }
}
