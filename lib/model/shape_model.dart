class UserMhs {
  final String status;
  List<Mhs> data;

  UserMhs({this.status = "no-status", this.data = const []});

  factory UserMhs.fromJson(Map<String, dynamic> json) => UserMhs(
      status: json["status"],
      data: List<Mhs>.from(json["mhs"].map((e) => Mhs.fromJson(e))));
}

class Mhs {
  final int id;
  final String nim;
  final String nama;
  final String prodi;
  final int semester;

  Mhs(
      {this.id = 0,
      this.nim = "nim",
      this.nama = "nama",
      this.prodi = "Teknik Informasi",
      this.semester = 1});
  factory Mhs.fromJson(Map<String, dynamic> json) => Mhs(
      id: json["id"],
      nim: json["nim"],
      nama: json["nama"],
      prodi: json["prodi"],
      semester: json["semester"]);
}