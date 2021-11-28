import 'package:flutter/material.dart';
import 'package:latis_tutor/pages/home.dart';
import 'package:latis_tutor/pages/presensi_input.dart';
import '../components/presensi/list_presensi.dart';

class Presesnsi extends StatelessWidget {
  const Presesnsi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black12,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context, const Home()),
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black87,
          ),
        ),
        title: const Text(
          'Presensi',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Cari Presensi',
            icon: const Icon(
              Icons.search,
              color: Colors.black87,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const PresensiInput(),
              ),
            ),
            padding: const EdgeInsets.only(right: 12),
            tooltip: 'Tambah Presensi',
            icon: const Icon(
              Icons.add,
              color: Colors.black87,
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              for (var i = 0; i < 10; i++) ListPresensi(index: i),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
