import 'package:flutter/material.dart';
import '../models/attendance_entry.dart';
import '../widgets/entry_tile.dart';

class AttendancePage extends StatefulWidget {
  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  List<AttendanceEntry> attendanceList = [];
  final TextEditingController nameController = TextEditingController();
  bool present = false;

  void addAttendance() {
    final name = nameController.text;
    if (name.isNotEmpty) {
      setState(() {
        attendanceList.add(AttendanceEntry(
          studentName: name,
          present: present,
          date: DateTime.now(),
        ));
        nameController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mark Attendance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Student Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            SwitchListTile(
              title: Text('Present'),
              value: present,
              onChanged: (bool value) {
                setState(() {
                  present = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: addAttendance,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Add Attendance',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: attendanceList.length,
                itemBuilder: (context, index) {
                  return EntryTile(entry: attendanceList[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
