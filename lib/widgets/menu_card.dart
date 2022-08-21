import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kulineria/screens/detail_screen.dart';
import 'package:kulineria/theme.dart';
import 'package:kulineria/models/menu.dart';

class MenuCard extends StatelessWidget {
  final Menu menu;
  MenuCard(this.menu);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                    menu.id,
                    menu.image,
                    menu.name,
                    menu.price,
                    menu.pricePromo,
                    menu.note,
                    menu.isPromo)));
      },
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 130,
                  height: 110,
                  child: Image.network(
                    menu.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  menu.isPromo
                      ? Image.asset(
                          'assets/promo.png',
                          width: 40,
                          height: 15,
                        )
                      : Image.asset(
                          'assets/terlaris.png',
                          width: 40,
                          height: 15,
                        ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${menu.name}',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: blackColor,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(menu.price),
                        style: poppinsTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: greyColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'Rp ', decimalDigits: 0)
                            .format(menu.pricePromo),
                        style: poppinsTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: yellowColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Free Delivery',
                    style: poppinsTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                      color: greyColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
