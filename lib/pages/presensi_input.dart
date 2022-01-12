import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:latis_tutor/components/presensi/presensi_comp.dart';
import 'package:latis_tutor/pages/presensi.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../components/global/input.dart';
import '../store/spresensi.dart';
import '../components/presensi/additional_ot.dart';
part '../components/presensi/tambah_ot.dart';
part '../components/presensi/tambah_canceling.dart';

final spresensi = SPresensi();

class PresensiInput extends StatefulWidget {
  const PresensiInput({Key? key}) : super(key: key);

  @override
  State<PresensiInput> createState() => _PresensiInputState();
}

class _PresensiInputState extends State<PresensiInput> {
  datePicker(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Observer(
            builder: (context) {
              return SizedBox(
                height: 400,
                child: SfDateRangePicker(
                  showActionButtons: true,
                  showNavigationArrow: true,
                  initialSelectedDates: spresensi.tglMengajarArr,
                  minDate: DateTime(2021, 10, 29),
                  maxDate: DateTime(2021, 11, 28),
                  selectionMode: DateRangePickerSelectionMode.multiple,
                  onSubmit: (v) {
                    spresensi.updateTglMengajar(v);
                    Navigator.pop(context);
                  },
                  onCancel: () => Navigator.pop(context),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black12,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context, const Presesnsi()),
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black87,
          ),
        ),
        title: const Text(
          "Input Presensi",
          style: TextStyle(color: Colors.black87),
        ),
      ),
      // #######################################################################
      // #######################################################################
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(4),
          child: Observer(builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectOption(
                  onChanged: (v) {},
                  value: null,
                  label: 'Siswa',
                  items: [
                    for (var i = 0; i < 5; i++)
                      DropdownMenuItem(
                        value: i.toString(),
                        child: Text('Siswa $i'),
                      ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
                  child: Text('Tgl. Mengajar'),
                ),
                BtnInputText(
                  value: spresensi.tglMengajar,
                  onTap: () => datePicker(context),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 0),
                  child: Text(
                    'Apakah ada kelebihan/kekurangan sesi?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  children: [
                    RadioBtn(
                      label: 'Ya',
                      value: 'ya',
                      groupValue: spresensi.isOT,
                      onChange: (v) => spresensi.setIsOT(v),
                    ),
                    const SizedBox(width: 40),
                    RadioBtn(
                      label: 'Tidak',
                      value: 'tidak',
                      groupValue: spresensi.isOT,
                      onChange: (v) => spresensi.setIsOT(v),
                    )
                  ],
                ),
                if (spresensi.isOT == 'ya')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var d in spresensi.oTform)
                        AdditionalOT(
                          data: d,
                          onClose: () {
                            spresensi.removeOTForm(d['id'], d['tgl']);
                            setState(() {});
                          },
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: MaterialButton(
                          onPressed: () {
                            // otModal(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TambahOT(
                                  data: spresensi.complementTglOtSelected(),
                                ),
                              ),
                            );
                          },
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: const Text('Tambah'),
                        ),
                      ),
                    ],
                  ),
                // Text("otForm: " + spresensi.oTform.toString()),
                const Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 0),
                  child: Text(
                    'Apakah ada Canceling?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  children: [
                    RadioBtn(
                      label: 'Ya',
                      value: 'ya',
                      groupValue: spresensi.isCanceling,
                      onChange: (v) => spresensi.setCanceling(v),
                    ),
                    const SizedBox(width: 40),
                    RadioBtn(
                      label: 'Tidak',
                      value: 'tidak',
                      groupValue: spresensi.isCanceling,
                      onChange: (v) => spresensi.setCanceling(v),
                    )
                  ],
                ),
                if (spresensi.isCanceling == 'ya')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var can in spresensi.canceling)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Container(
                                  width: size.width - 97,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black26),
                                  ),
                                  child: Text(
                                    can['tanggal'] + ', ' + can['alasan'],
                                    style: const TextStyle(fontSize: 16),
                                    maxLines: 3,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      spresensi.removeCanceling(can['id']);
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const TambahCanceling(),
                              ),
                            );
                          },
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: const Text('Tambah'),
                        ),
                      ),
                    ],
                  ),
                // SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.fromLTRB(12, 16, 12, 0),
                  child: Text(
                    'Keterangan',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    onChanged: (e) {
                      spresensi.setKeterangan(e);
                    },
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "Keterangan",
                      hintText: "Keterangan",
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      border: OutlineInputBorder(
                        gapPadding: 1,
                        borderSide: BorderSide(
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PresesnsiInputPreview(),
                            ),
                          );
                        },
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 50,
                        ),
                        textColor: Colors.white,
                        color: Colors.lightBlue,
                        child: const Text(
                          "Selanjutnya",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class PresesnsiInputPreview extends StatelessWidget {
  const PresesnsiInputPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black12,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.black87,
            ),
          ),
          title: const Text(
            "Input Presensi Preview",
            style: TextStyle(color: Colors.black87),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
            child: Observer(builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total sesi : " + spresensi.totalOT().toString() + " sesi",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  IPPtext(
                    label: "Nama :",
                    value: spresensi.name,
                  ),
                  IPPtext(
                    label: "Kelas :",
                    value: spresensi.kelas,
                  ),
                  IPPtext(
                    label: "Kurikulum :",
                    value: spresensi.kurikulum,
                  ),
                  IPPtext(
                    label: "Jumlah Siswa :",
                    value: spresensi.jumlahSiswa,
                  ),
                  IPPtext(
                    label: "Tgl. Mengajar :",
                    value: spresensi.tglMengajar,
                  ),
                  IPPtext(
                    label: "Keterangan :",
                    value: spresensi.keterangan,
                  ),
                ],
              );
            }),
          ),
        ));
  }
}

class IPPtext extends StatelessWidget {
  IPPtext({
    required this.label,
    required this.value,
    Key? key,
  }) : super(key: key);
  String label;
  String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            height: 1.5,
          ),
          text: "$label \n",
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
