// import 'dart:ffi';
import 'dart:ffi';

import 'package:latis_tutor/components/presensi/otform.dart';
import 'package:mobx/mobx.dart';

part 'spresensi.g.dart';

class SPresensi = _SPresensi with _$SPresensi;

abstract class _SPresensi with Store {
  @observable
  List<DateTime> tglMengajarArr = [];

  @observable
  String tglMengajar = 'Pilih tgl. mengajar';

  @action
  void updateTglMengajar(var newTglMengajar) {
    tglMengajarArr = newTglMengajar;
    List tglMengajarR = [];
    for (var e in newTglMengajar) {
      var tmp = e.toString().split(' ');
      tglMengajarR.add(tmp[0]);
    }
    tglMengajar = tglMengajarR.join(', ');
  }

  /* ==================================== */

  @observable
  String isOT = 'tidak';

  @observable
  List oTform = [];

  @action
  void setIsOT(String setIsOT) {
    isOT = setIsOT;
    oTform = [];
  }

  @action
  void addOTForm() {
    oTform.add(oTform.length);
  }

  @action
  void removeOTForm(int i) {
    oTform.remove(i);
  }

  /* ==================================== */

  @observable
  String isCanceling = 'tidak';

  @action
  void setCanceling(String val) {
    isCanceling = val;
  }
}

//flutter packages pub run build_runner watch --delete-conflicting-outputs