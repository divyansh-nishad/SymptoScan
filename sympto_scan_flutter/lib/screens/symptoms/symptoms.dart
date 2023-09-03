import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Symptoms extends StatefulWidget {
  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  TextEditingController _symptomsController = TextEditingController();
  String _predictedDisease = "";

  Future<void> _predictDisease() async {
    String userSymptoms = _symptomsController.text;
    List<String> userSymptomsList = userSymptoms.split(",");
    print(userSymptomsList);

    final response = await http.post(
      Uri.parse("http://127.0.0.1:5000/predict"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'symptoms': userSymptomsList,
      }),
    );

    print(response.body);
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      setState(() {
        _predictedDisease = data["predicted_disease"];
      });
    } else {
      setState(() {
        _predictedDisease = "Error predicting disease";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD0F0E3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "Sympto-Scan",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: const Text(
                "What symptoms troubling you today?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            TextField(
              controller: _symptomsController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Enter symptoms (comma-separated)",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _predictDisease,
              child: const Text(
                "Predict Disease",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Predicted Disease: $_predictedDisease",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
