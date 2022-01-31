import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:latis_tutor/models/siswa.dart';

Siswa siswa = Siswa();
Dio dio = Dio();

class SiswaReq {
  getSiswaByLembaga(String lembaga) async {
    await dotenv.load();
    var data = FormData.fromMap({'lembaga': lembaga});
    Response resp = await dio.post(
      dotenv.get('API_URL') + 't/siswa/lembaga',
      data: data,
      options: Options(
        headers: {"authorization": dotenv.get('KEY')},
      ),
    );
    return resp.data['data'];
    // Uri url = Uri.parse(dotenv.get('API_URL') + 'siswa/lembaga');
    // var req = http.MultipartRequest('POST', url);
    // req.fields.addAll({'lembaga': lembaga});
    // var resp = await req.send();
    // var res = await resp.stream.bytesToString();
    // return res;
  }
}
