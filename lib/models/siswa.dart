class Siswa {
  String? id;
  String? username;
  String? namaLengkap;
  String? kelas;
  String? jumlahSiswa;
  String? kurikulum;

  Siswa(
      {this.id,
      this.username,
      this.namaLengkap,
      this.kelas,
      this.jumlahSiswa,
      this.kurikulum});

  Siswa.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    username = json['username'];
    namaLengkap = json['nama_lengkap'];
    kelas = json['kelas'];
    jumlahSiswa = json['jumlah_siswa'];
    kurikulum = json['kurikulum'];
  }

  /* Siswa.input(List<Map<dynamic, dynamic>> listJson) {
    for (var list in listJson) {
      Siswa.fromJson(list);
    }
  } */
}
