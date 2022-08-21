class Menu {
  int id; //deklarasi variabel id untuk data menu
  String image; //deklarasi variabel untuk data image
  String name; //deklarasi variabel untuk data name
  int price; //deklarasi variabel untuk data price
  int pricePromo; //deklarasi variabel untuk data pricePromo
  String note; //deklarasi variabel untuk data note/deskripsi
  bool isPromo; //deklarasi variabel untuk data isPromo

  Menu({
    required this.id, //pemanggilan variabel pada kelas Menu
    required this.image, //pemanggilan variabel pada kelas Menu
    required this.name, //pemanggilan variabel pada kelas Menu
    required this.price, //pemanggilan variabel pada kelas Menu
    required this.pricePromo, //pemanggilan variabel pada kelas Menu
    required this.note, //pemanggilan variabel pada kelas Menu
    required this.isPromo, //pemanggilan variabel pada kelas Menu
  });
}
