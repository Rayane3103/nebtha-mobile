import 'package:flutter/material.dart';
import 'package:nebtha/Constants/design.dart';
import 'package:nebtha/Screens/description_page.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.43,
        height: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 4,
                  color: Color.fromARGB(255, 122, 122, 122),
                  offset: Offset(1, 1)),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: const Color.fromARGB(255, 198, 233, 203),
              ),
              child: Image.asset("assets/11.png"),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(12.0, 5, 0, 0),
              child: Text(
                'menthe',
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(12.0, 0, 0, 0),
              child: Text(
                'menthe arabic',
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return DescriptionPage();
                  }),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8.0)),
                height: MediaQuery.of(context).size.height * 0.095,
                width: 190,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'menthe is a ujbfgqsfsn sdhbfshjbfghsbd ............... ',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'plus de detail',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(12.0, 0, 12, 0),
                  child: Text(
                    'price',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  //test
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 0),
                  child: Text(
                    'discount',
                    style: TextStyle(color: Colors.grey[900]),
                  ),
                  //test
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            InkWell(
              onTap: () {
                print('purchase button');
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0, 12, 0),
                child: Container(
                  width: 130,
                  height: 35,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 2,
                        )
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: const Color.fromARGB(255, 185, 229, 187)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('purchase'),
                      Icon(Icons.shopping_cart),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
