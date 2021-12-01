// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spresensi.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SPresensi on _SPresensi, Store {
  final _$tglMengajarArrAtom = Atom(name: '_SPresensi.tglMengajarArr');

  @override
  List<DateTime> get tglMengajarArr {
    _$tglMengajarArrAtom.reportRead();
    return super.tglMengajarArr;
  }

  @override
  set tglMengajarArr(List<DateTime> value) {
    _$tglMengajarArrAtom.reportWrite(value, super.tglMengajarArr, () {
      super.tglMengajarArr = value;
    });
  }

  final _$tglMengajarAtom = Atom(name: '_SPresensi.tglMengajar');

  @override
  String get tglMengajar {
    _$tglMengajarAtom.reportRead();
    return super.tglMengajar;
  }

  @override
  set tglMengajar(String value) {
    _$tglMengajarAtom.reportWrite(value, super.tglMengajar, () {
      super.tglMengajar = value;
    });
  }

  final _$isOTAtom = Atom(name: '_SPresensi.isOT');

  @override
  String get isOT {
    _$isOTAtom.reportRead();
    return super.isOT;
  }

  @override
  set isOT(String value) {
    _$isOTAtom.reportWrite(value, super.isOT, () {
      super.isOT = value;
    });
  }

  final _$oTformAtom = Atom(name: '_SPresensi.oTform');

  @override
  List<dynamic> get oTform {
    _$oTformAtom.reportRead();
    return super.oTform;
  }

  @override
  set oTform(List<dynamic> value) {
    _$oTformAtom.reportWrite(value, super.oTform, () {
      super.oTform = value;
    });
  }

  final _$isCancelingAtom = Atom(name: '_SPresensi.isCanceling');

  @override
  String get isCanceling {
    _$isCancelingAtom.reportRead();
    return super.isCanceling;
  }

  @override
  set isCanceling(String value) {
    _$isCancelingAtom.reportWrite(value, super.isCanceling, () {
      super.isCanceling = value;
    });
  }

  final _$_SPresensiActionController = ActionController(name: '_SPresensi');

  @override
  void updateTglMengajar(dynamic newTglMengajar) {
    final _$actionInfo = _$_SPresensiActionController.startAction(
        name: '_SPresensi.updateTglMengajar');
    try {
      return super.updateTglMengajar(newTglMengajar);
    } finally {
      _$_SPresensiActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsOT(String setIsOT) {
    final _$actionInfo =
        _$_SPresensiActionController.startAction(name: '_SPresensi.setIsOT');
    try {
      return super.setIsOT(setIsOT);
    } finally {
      _$_SPresensiActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addOTForm() {
    final _$actionInfo =
        _$_SPresensiActionController.startAction(name: '_SPresensi.addOTForm');
    try {
      return super.addOTForm();
    } finally {
      _$_SPresensiActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeOTForm(int i) {
    final _$actionInfo = _$_SPresensiActionController.startAction(
        name: '_SPresensi.removeOTForm');
    try {
      return super.removeOTForm(i);
    } finally {
      _$_SPresensiActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCanceling(String val) {
    final _$actionInfo = _$_SPresensiActionController.startAction(
        name: '_SPresensi.setCanceling');
    try {
      return super.setCanceling(val);
    } finally {
      _$_SPresensiActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tglMengajarArr: ${tglMengajarArr},
tglMengajar: ${tglMengajar},
isOT: ${isOT},
oTform: ${oTform},
isCanceling: ${isCanceling}
    ''';
  }
}
