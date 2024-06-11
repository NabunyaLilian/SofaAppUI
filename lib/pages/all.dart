import 'package:flutter/material.dart';

class All extends StatelessWidget {
  All({super.key});
  final itemList = [
    [
      'Classic Leather',
      'Arm chair',
      '56\$',
      'assets/images/comfortable_modern_chair.png'
    ],
    [
      'Poppy Plastic',
      'Tub Chair',
      '78\$',
      'assets/images/stylish_grey_chair.png'
    ],
    ['Bar Stool', 'Chair', '112\$', 'assets/images/old_wooden_armchair.png']
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(bottom: 25),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: (index % 2 == 0)
                        ? const Color(0xFF41BAD5)
                        : const Color(0xFFA45029),
                  ),
                ),
                Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width - 45,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset:
                            const Offset(0, 10), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    decoration: const BoxDecoration(
                        color: Color(0xFFA45029),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Text(
                      itemList[index][2],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                    top: 30,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemList[index][0],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          itemList[index][1],
                        )
                      ],
                    )),
                Positioned(
                    right: 10,
                    bottom: 0,
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset(itemList[index][3]),
                    ))
              ],
            ),
          );
        });
  }
}
