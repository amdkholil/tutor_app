part of './presensi_comp.dart';

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
