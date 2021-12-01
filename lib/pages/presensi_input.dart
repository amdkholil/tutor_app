import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:latis_tutor/pages/presensi.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../components/global/input.dart';
import '../store/spresensi.dart';
import '../components/presensi/otform.dart';

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
        });
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
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
                        value: i,
                        child: Text('Siswa $i'),
                      ),
                  ],
                ),
                const InputText(
                  label: 'Kelas',
                  readOnly: true,
                ),
                const InputText(
                  label: 'Kurikulum',
                  readOnly: true,
                ),
                const InputText(
                  label: 'Jumlah Siswa',
                  readOnly: true,
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
                    children: [
                      OTForm(
                        onTap: () {
                          spresensi.addOTForm();
                          setState(() {});
                        },
                        icon: Icons.add,
                      ),
                      for (var x in spresensi.oTform)
                        OTForm(
                          onTap: () {
                            spresensi.removeOTForm(x);
                            setState(() {});
                          },
                          icon: Icons.close,
                          color: Colors.red,
                        ),
                    ],
                  ),

                ///
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
                Row(
                  children: [
                    Expanded(
                      flex: 40,
                      child: SelectOption(
                        onChanged: (v) {},
                        value: null,
                        label: 'Tanggal',
                        items: [
                          for (var i = 0; i < 5; i++)
                            DropdownMenuItem(
                              value: i,
                              child: Text('2021-11-$i'),
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 40,
                      child: SelectOption(
                        onChanged: (v) {},
                        value: null,
                        label: 'Menit',
                        items: [
                          for (var i = 0; i < 5; i++)
                            DropdownMenuItem(
                              value: i,
                              child: Text('Menit $i'),
                            ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                    )
                  ],
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
