import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kulineria/models/size.dart';
import 'package:kulineria/theme.dart';
import 'package:kulineria/widgets/size_card.dart';
import 'package:url_launcher/url_launcher.dart';

//deklarasi stateful Widget dimana widget ini fungsinya dinamis
class DetailScreen extends StatefulWidget {
  int id;
  String image;
  String name;
  int price;
  int pricePromo;
  String note;
  bool isPromo;

  DetailScreen(this.id, this.image, this.name, this.price, this.pricePromo,
      this.note, this.isPromo,
      {Key? key})
      : super(key: key);

  @override
  State<DetailScreen> createState() =>
      // ignore: no_logic_in_create_state
      _DetailScreen(id, image, name, price, pricePromo, note, isPromo);
}

class _DetailScreen extends State<DetailScreen> {
  int _id;
  String _image;
  String _name;
  int _price;
  int _pricePromo;
  String _note;
  bool _isPromo;

  _DetailScreen(this._id, this._image, this._name, this._price,
      this._pricePromo, this._note, this._isPromo);

  late int dataPrice = _price;
  late int dataPricePromo = _pricePromo;

  int price = 15000;
  int pricePromo = 5000;

  int i = 1;
  bool isKecil = true; // harga tetap untuk ukuran kecil
  bool isSedang = false; // harga + 2000 harga ukuran sedang
  bool isBesar = false; // harga + 4000 harga ukuran besar

  // Method/Function untuk proses pengurangan pada button minus
  void _minus() {
    if (i > 1) {
      setState(() {
        i--;
        if (isKecil == true) {
          price = dataPrice * i;
          pricePromo = dataPricePromo * i;
        } else if (isSedang == true) {
          price = (dataPrice + 2000) * i;
          pricePromo = (dataPricePromo + 2000) * i;
        } else if (isBesar == true) {
          price = (dataPrice + 4000) * i;
          pricePromo = (dataPricePromo + 4000) * i;
        }
      });
    }
  }

  // Method/Function untuk proses penambahan pada button plus
  void _plus() {
    setState(() {
      i++;
      if (isKecil == true) {
        price = dataPrice * i;
        pricePromo = dataPricePromo * i;
      } else if (isSedang == true) {
        price = (dataPrice + 2000) * i;
        pricePromo = (dataPricePromo + 2000) * i;
      } else if (isBesar == true) {
        price = (dataPrice + 4000) * i;
        pricePromo = (dataPricePromo + 4000) * i;
      }
    });
  }

  // Method/Function untuk proses perhitungan harga ukuran kecil
  void _clickKecil() {
    setState(() {
      price = dataPrice * i;
      pricePromo = dataPricePromo * i;
      isKecil = true;
      isSedang = false;
      isBesar = false;
    });
  }

  // Method/Function untuk proses perhitungan harga ukuran Sedang
  void _clickSedang() {
    setState(() {
      price = (dataPrice + 2000) * i;
      pricePromo = (dataPricePromo + 2000) * i;
      isKecil = false;
      isSedang = true;
      isBesar = false;
    });
  }

  // Method/Function untuk proses perhitungan harga ukuran Besar
  void _clickBesar() {
    setState(() {
      price = (dataPrice + 4000) * i;
      pricePromo = (dataPricePromo + 4000) * i;
      isKecil = false;
      isSedang = false;
      isBesar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              _image,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(height: 264),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _isPromo
                                ? Image.asset(
                                    'assets/promo.png',
                                    width: 60,
                                  )
                                : Image.asset(
                                    'assets/terlaris.png',
                                    width: 60,
                                  ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  _name,
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: blackColor,
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: _minus,
                                  child: Image.asset(
                                    'assets/minus.png',
                                    width: 30,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${i}',
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: blackColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: _plus,
                                  child: Image.asset(
                                    'assets/plus.png',
                                    width: 30,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp ',
                                          decimalDigits: 0)
                                      .format(price),
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: greyColor,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'Rp ',
                                          decimalDigits: 0)
                                      .format(pricePromo),
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: yellowColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Text(
                              'Pilih Ukuran',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: _clickKecil,
                                  child: SizeCard(
                                    Size(
                                        id: 1,
                                        name: 'Kecil',
                                        isActive: isKecil),
                                  ),
                                ),
                                SizedBox(width: 12),
                                InkWell(
                                  onTap: _clickSedang,
                                  child: SizeCard(
                                    Size(
                                        id: 2,
                                        name: 'Sedang',
                                        isActive: isSedang),
                                  ),
                                ),
                                SizedBox(width: 12),
                                InkWell(
                                  onTap: _clickBesar,
                                  child: SizeCard(
                                    Size(
                                        id: 3,
                                        name: 'Besar',
                                        isActive: isBesar),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 18),
                            Text(
                              'Catatan Penjual',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            SizedBox(height: 12),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                _note,
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: greyColor,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            SizedBox(height: 18),
                            Text(
                              'Lokasi Kulineria Space',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            SizedBox(height: 12),
                            InkWell(
                              onTap: () async {
                                final url = Uri.parse(
                                  'https://goo.gl/maps/YpJyUDktcGFYrVPV7',
                                );
                                if (await canLaunchUrl(url)) {
                                  launchUrl(url);
                                } else {
                                  // ignore: avoid_print
                                  print("Can't launch $url");
                                }
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/store.png',
                                    width: 50,
                                  ),
                                  SizedBox(width: 18),
                                  Text(
                                    'Jln. Kidul\nJawa',
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: greyColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 18),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: RaisedButton(
                                padding: EdgeInsets.only(
                                  top: 12,
                                  bottom: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)),
                                elevation: 0,
                                focusElevation: 0,
                                hoverElevation: 0,
                                highlightElevation: 0,
                                disabledElevation: 0,
                                onPressed: () async {
                                  final url = Uri.parse(
                                      'https://www.instagram.com/riankurniawan___');
                                  if (await canLaunchUrl(url)) {
                                    launchUrl(url);
                                  } else {
                                    // ignore: avoid_print
                                    print("Can't launch $url");
                                  }
                                },
                                color: yellowColor,
                                child: Text(
                                  'Beli',
                                  style: poppinsTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
