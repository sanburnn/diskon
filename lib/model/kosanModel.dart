class GetMahasiswa {
  String? id;
  String? nama;
  String? harga;
  String? foto;
  String? deskripsi;
  String? lokasi;

  GetMahasiswa(
      {this.id, this.nama, this.harga, this.foto, this.deskripsi, this.lokasi});

  GetMahasiswa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nim'];
    harga = json['nama'];
    foto = json['jk'];
    deskripsi = json['alamat'];
    lokasi = json['jurusan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nim'] = this.nama;
    data['nama'] = this.harga;
    data['jk'] = this.foto;
    data['alamat'] = deskripsi;
    data['jurusan'] = this.lokasi;
    return data;
  }
}
