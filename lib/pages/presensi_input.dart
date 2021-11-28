import 'package:flutter/material.dart';
import 'package:latis_tutor/pages/presensi.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../components/global/input.dart';

class PresensiInput extends StatelessWidget {
  const PresensiInput({Key? key}) : super(key: key);

  datePicker(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SfDateRangePicker(
              showActionButtons: true,
              showNavigationArrow: true,
              selectionMode: DateRangePickerSelectionMode.multiple,
              onSubmit: (_) => Navigator.pop(context),
              onCancel: () => Navigator.pop(context),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var _currencies = [
      "Food",
      "Transport",
      "Personal",
      "Shopping",
      "Medical",
      "Rent",
      "Movie",
      "Salary"
    ];
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
          child: Column(
            children: [
              const SelectOption(),
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
              TextButton(
                onPressed: () => datePicker(context),
                child: const Text("Select date"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
