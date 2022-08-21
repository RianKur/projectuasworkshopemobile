import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kulineria/theme.dart';
import 'package:kulineria/widgets/menu_card.dart';
import 'package:kulineria/models/menu.dart';

//deklarasi stateless Widget dimana widget ini fungsinya sudah mutlak/static
class HomeScreen extends StatelessWidget {
  // const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance; //Function pemanggilan firebase
    CollectionReference products = firestore.collection('products'); //Function pemanggilan firebase
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Foods Hunter',
                style: poppinsTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              Text(
                'Selamat Datang di Kulineria',
                style: poppinsTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: greyColor,
                ),
              ),
              //fungsi sizedBox untuk memberikan space kosong untuk item baru yang dideklarasikan
              SizedBox(
                height: 32,
              ),
              Text(
                'Recommended Menu',
                style: poppinsTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: blackColor,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: products.orderBy('id', descending: false).snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: (snapshot.data! as QuerySnapshot)
                          .docs
                          .map(
                            (e) => MenuCard(
                              Menu(
                                id: e['id'],
                                image: e['image'],
                                name: e['name'],
                                price: e['price'],
                                pricePromo: e['pricePromo'],
                                note: e['note'],
                                isPromo: e['isPromo'],
                              ),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),

              // Data Static/Local yang diimplementasikan ke aplikasi sebelum masuk pada database cloud firestore
              // SizedBox(
              //   height: 20,
              // ),
              // MenuCard(
              //   Menu(
              //     id: 2,
              //     image: 'assets/pic2.png',
              //     name: 'Chicken Kuli',
              //     price: 12000,
              //     pricepromo: 10000,
              //     note:
              //         'Pembelian diatas 5  item bonus satu burger promo berlaku hanya pengiriman radius 2 KM setiap pembelian mendapat 1 kupon burger 10 kupon burger bisa ditukar dengan 1 burger',
              //     isPromo: false,
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // MenuCard(
              //   Menu(
              //     id: 3,
              //     image: 'assets/pic3.png',
              //     name: 'Combo Kuli',
              //     price: 20000,
              //     pricepromo: 15000,
              //     note:
              //         'Pembelian diatas 5  item bonus satu burger promo berlaku hanya pengiriman radius 2 KM setiap pembelian mendapat 1 kupon burger 10 kupon burger bisa ditukar dengan 1 burger',
              //     isPromo: false,
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // MenuCard(
              //   Menu(
              //     id: 4,
              //     image: 'assets/pic4.png',
              //     name: 'Reguler Kuli',
              //     price: 10000,
              //     pricepromo: 9000,
              //     note:
              //         'Pembelian diatas 5  item bonus satu burger promo berlaku hanya pengiriman radius 2 KM setiap pembelian mendapat 1 kupon burger 10 kupon burger bisa ditukar dengan 1 burger',
              //     isPromo: false,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
