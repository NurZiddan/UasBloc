import 'package:http/http.dart' as http;

class RestAPIService {
  Future<bool> addMhsService(
      int id, String nim, String nama, String prodi, int semester async {
    try {
      final Map<String, dynamic> map = {
        "id": id,
        "nim": nim,
        "nama": nama,
        "prodi": prodi,
        "semester": semester
      };
      http.Response response = await http
          .post(Uri.parse("https://e85a-103-166-147-253.ngrok-free.app"));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      throw Exception(err);
    }
  }
}
