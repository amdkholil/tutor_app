// ignore_for_file: unused_import
// import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:latis_tutor/components/presensi/otform.dart';
import 'package:mobx/mobx.dart';

part 'spresensi.g.dart';

class SPresensi = _SPresensi with _$SPresensi;

abstract class _SPresensi with Store {
  @observable
  String fullName = "";

  @observable
  String username = "";

  @observable
  String kelas = "";

  @observable
  String jumlahSiswa = "";

  @observable
  String kurikulum = "";

  @observable
  List<DateTime> tglMengajarArr = [];

  @observable
  String tglMengajar = 'Pilih tgl. mengajar';

  @observable
  List tglMengajarArrStr = [];

  @action
  void setUsername(String name){
    fullName = name;
    var q = RegExp(r'\(([^)]*)\)').allMatches(name).map((m) => m.group(0)).join(' ');
    username =  q.replaceAll('(','').replaceAll(')', "");
  }

  @action
  void updateTglMengajar(var newTglMengajar) {
    tglMengajarArr = newTglMengajar;
    List tgl_ = [];
    for (var e in newTglMengajar) {
      var tmp = e.toString().split(' ');
      tgl_.add(tmp[0]);
    }
    tglMengajarArrStr = tgl_;
    tglMengajar = tglMengajarArrStr.join(', ');
  }

  /* ==================================== */

  @observable
  String isOT = 'tidak';

  @observable
  List oTform = [
    // {"id": 0, "tgl": null, "sesi": null}
  ];

  @observable
  int otCounter = 0;

  @observable
  String tglOt = '';

  @observable
  String otSesi = '';

  @observable
  List tglOtSelected = [];

  @observable
  List<TextEditingController> controlersOt = [];

  List<Map> oTlatis = [
    {"ot": "-0.5", "text": "-60 menit (-0.5 sesi)"},
    {"ot": "0.5", "text": "60 menit (0.5 sesi)"},
    {"ot": "1", "text": "120 menit (1 sesi)"},
    {"ot": "1.5", "text": "180 menit (1.5 sesi)"},
    {"ot": "2", "text": "240 menit (2 sesi)"},
  ];

  @action
  void setIsOT(String setIsOT) {
    isOT = setIsOT;
    oTform = [];
  }

  @action
  void addOTForm(String tgl, String sesi) {
    otCounter++;
    oTform.add({'id': otCounter, 'tgl': tgl, 'sesi': sesi});
    tglOtSelected.add(tgl);
    tglOt = '';
    otSesi = '';
  }

  @action
  void removeOTForm(var id, var tgl) {
    oTform.removeWhere((el) => el['id'] == id);
    tglOtSelected.removeWhere((element) => element == tgl);
  }

  @action
  void updateTglOtSeleted(var x) {
    if (!tglOtSelected.contains(x)) {
      tglOtSelected.add(x);
    }
  }

  @action
  void removeTglOtSelected(var x) {
    tglOtSelected.removeWhere((element) => element == x);
  }

  @action
  List complementTglOtSelected() {
    var set1 = Set.from(tglMengajarArrStr);
    var set2 = Set.from(tglOtSelected);
    List x = List.from(set1.difference(set2));
    return x;
  }

  @action
  void resetOtForm() {
    oTform = [];
  }

  @action
  double totalOT() {

    double total = 0;
    for (var el in oTform) {
      total += double.parse(el['sesi']);
    }
    total = tglMengajarArrStr.length*2+total;
    return total;
  }

  /* ==================================== */

  @observable
  int idCanceling = 0;

  @observable
  List canceling = [];

  @observable
  String isCanceling = 'tidak';

  @action
  void setCanceling(String val) {
    isCanceling = val;
    if (isCanceling == "tidak") canceling = [];
  }

  @action
  void addCanceling(String tanggal, String alasan) {
    idCanceling++;
    canceling.removeWhere((el) => el['tanggal'] == tanggal);
    canceling.add({"id": idCanceling, "tanggal": tanggal, "alasan": alasan});
  }

  @action
  void removeCanceling(int id) {
    canceling.removeWhere((el) => el['id'] == id);
  }

  @observable
  String keterangan = "";
  @action
  void setKeterangan(String ket) {
    keterangan = ket;
  }
}

//flutter packages pub run build_runner watch --delete-conflicting-outputs
