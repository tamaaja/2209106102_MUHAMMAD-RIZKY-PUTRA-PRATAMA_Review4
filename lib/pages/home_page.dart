import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/widget/custom_button.dart';
import 'package:flutter_application_1/widget/custom_text_field.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  String ? _selectedGender;
  bool _setuju = false;
  String _result = ''; // Variabel untuk menyimpan hasil inputan

  void _submit() {
    setState(() {
      _result = 'Username: ${username.text}\n'
                //'Password: ${password.text}\n'
                'Gender: ${_selectedGender ?? "Belum memilih"}\n'
                'Setuju: ${_setuju ? "Ya" : "Tidak"}\n';
      username.clear();
      password.clear();
      _selectedGender = null;
      _setuju = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: MyTextField(
                controller: username,
                hintText: "Masukan nama anda....",
                labelText: "Username")),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Radio<String>(
                  value: 'Cowo', // Nilai yang akan disimpan jika dipilih
                  groupValue: _selectedGender, // Grup nilai radio button
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value; // Mengubah nilai yang dipilih
                    });
                  },
                ),
                Text(
                  'Laki-laki',
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ],
            ),
            Row(
              children: [
                Radio<String>(
                  value: 'Cewe', // Nilai yang akan disimpan jika dipilih
                  groupValue: _selectedGender, // Grup nilai radio button
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value; // Mengubah nilai yang dipilih
                    });
                  },
                ),
                Text(
                  'Cewe',
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Checkbox(
                  value: _setuju,
                  onChanged: (bool? value) {
                    setState(() {
                      _setuju = value ?? false; // Update status checkbox
                    });
                  },
                ),
                Text(
                  "Accept of aggrement",
                  style: GoogleFonts.poppins(fontSize: 16),
                )
              ],
            ),
          ),
        MyCustomButton(
          onPressed: _submit, 
          text: "Masuk"),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 110,
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD18E),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Hasil jawaban',
                      style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _result,
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    ));
  }
}