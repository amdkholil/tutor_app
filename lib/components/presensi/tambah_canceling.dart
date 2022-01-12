part of '../../pages/presensi_input.dart';

class TambahCanceling extends StatefulWidget {
  const TambahCanceling({Key? key}) : super(key: key);

  @override
  State<TambahCanceling> createState() => _TambahCancelingState();
}

class _TambahCancelingState extends State<TambahCanceling> {
  DateTime selectedDate = DateTime.now();
  String tglCancel = "";
  String alasanSelected = '';

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2022, 1, 31),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        tglCancel = picked.toString().substring(0, 10);
      });
    }
  }

  List alasan = [
    "Saya sudah diperjalanan tiba-tiba \n dari pihak siswa meminta cancel",
    "saya sudah dirumah siswa tiba-tiba \n dari pihak siswa meminta cancel"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Tanggal dan alasan canceling",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
                child: Text('Tgl. Canceling'),
              ),
              BtnInputText(
                value: tglCancel == '' ? "Pilih tanggal canceling" : tglCancel,
                onTap: () => _selectDate(context),
              ),
              SelectOption(
                items: [
                  for (var alasn in alasan)
                    DropdownMenuItem(
                      value: alasn,
                      child: Text(
                        alasn,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                ],
                label: "Alasan cnceling",
                onChanged: (v) {
                  setState(() {
                    alasanSelected = v.replaceAll("\n", " ");
                  });
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
                      if (tglCancel != '' || alasanSelected != '') {
                        spresensi.addCanceling(tglCancel, alasanSelected);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PresensiInput(),
                          ),
                        );
                      }
                    },
                    child: const Text('Tambahkan'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
