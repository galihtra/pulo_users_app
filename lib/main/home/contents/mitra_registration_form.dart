import 'package:flutter/material.dart';

class MitraRegistration extends StatelessWidget {
  const MitraRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Pendaftaran Mitra'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nama Toko'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(labelText: 'Deskripsi Toko'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Jenis Toko'),
              value: null,
              items: ['Kuliner', 'Online Shop', 'Layanan Jasa']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                // Handle dropdown value change
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Alamat Toko'),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit button
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                      200, 50), // Atur lebar dan tinggi sesuai kebutuhan
                ),
                child: const Text('Daftar Menjadi Mitra'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
