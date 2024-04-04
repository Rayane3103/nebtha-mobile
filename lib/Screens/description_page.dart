import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nebtha/Components/purchase_button.dart';
import 'package:nebtha/Constants/design.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({
    super.key,
  });
  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  double size = 15.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.215),
            Image.asset(
              'assets/logo1.png',
              scale: 2.5,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 13, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Image.asset(
                "assets/11.png",
                scale: 0.5,
              ),
            ),
            //-----------------------------------------------------------------------------------------------
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width * 1,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 3, spreadRadius: 1, offset: Offset(0, -1)),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'menthe ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: primaryColor),
                    ),
                    const Text(
                        'Mints are aromatic, almost exclusively perennial herbs. They have wide-spreading underground and overground stolons and erect, square, branched stems. Mints will grow 10–120 cm (4–48 inches) tall and can spread over an indeterminate area. Due to their tendency to spread unchecked, some mints are considered invasive.The leaves are arranged in opposite pairs, from oblong to lanceolate, often downy, and with a serrated margin. Leaf colors range from dark green and gray-green to purple, blue, and sometimes pale yellow.The flowers are produced in long bracts from leaf axils.They are white to purple and produced in false whorls called verticillasters. The corolla is two-lipped with four subequal lobes, the upper lobe usually the largest. The fruit is a nutlet, containing one to four seeds.'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ],
                ),
              ),
            ),
            //-----------------------------------------------------------------------------------------------
            Container(
              height: MediaQuery.of(context).size.height * 0.09494,
              width: MediaQuery.of(context).size.width * 1,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PurchaseButton(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(23.0, 0, 12, 0),
                    child: IconButton(
                      onPressed: () {
                        print('liked');
                      },
                      icon: Icon(Icons.favorite_border),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
