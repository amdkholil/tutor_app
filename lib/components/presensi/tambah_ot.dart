part of '../../pages/presensi_input.dart';

class TambahOT extends StatelessWidget {
  const TambahOT({Key? key, required this.data}) : super(key: key);
  final List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
          child: Observer(
            builder: (BuildContext context) {
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 12,
                    ),
                    child: Text(
                      "Kelebihan/kekurangan sesi",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SelectOption(
                    items: [
                      for (String t in data)
                        DropdownMenuItem(
                          child: Text(t),
                          value: t,
                        )
                    ],
                    label: 'Tanggal',
                    onChanged: (v) {
                      spresensi.tglOt = v;
                    },
                  ),
                  SelectOption(
                    items: [
                      for (Map l in spresensi.oTlatis)
                        DropdownMenuItem(
                          child: Text(l['text']),
                          value: l['ot'],
                        )
                    ],
                    label: 'Sesi',
                    onChanged: (v) {
                      spresensi.otSesi = v;
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        color: Colors.grey,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Batal',
                        ),
                      ),
                      MaterialButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {
                          if (spresensi.otSesi.isNotEmpty &&
                              spresensi.tglOt.isNotEmpty) {
                            spresensi.addOTForm(
                                spresensi.tglOt, spresensi.otSesi);
                          }
                          spresensi.tglOt = '';
                          spresensi.otSesi = '';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PresensiInput()),
                          );
                        },
                        child: const Text('Tambahkan'),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
