import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TimezoneConverter(),
    );
  }
}

class TimezoneConverter extends StatefulWidget {
  @override
  _TimezoneConverterState createState() => _TimezoneConverterState();
}

class _TimezoneConverterState extends State<TimezoneConverter> {
  DateTime _selectedDate = DateTime.now();
  String _selectedTimezone = 'UTC';
  String _convertedTime = '';

  // This map contains the time zones for various time zones
  final Map<String, String> _timezones = {
    'UTC': 'UTC',
    'EST': 'America/Newrk',
    'JST': 'Asia/Tokyo',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timezone Converter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select a date and time'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text('Select Date and Time'),
            ),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: _selectedTimezone,
              onChanged: (newValue) {
                setState(() {
                  _selectedTimezone = newValue!;
                  _convertTime();
                });
              },
              items:
                  _timezones.keys.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
          
          ],
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDate),
      );
      if (pickedTime != null) {
        setState(() {
          _selectedDate = DateTime(
            picked.year,
            picked.month,
            picked.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          _convertTime();
        });
      }
    }
  }

  void _convertTime() {
    // Get the time zone for the selected time zone
    // Format the converted date and time
    String formattedDateTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(_selectedDate);

// Update the state with the converted time
    setState(() {
      _convertedTime = formattedDateTime;
    });
  }
}
