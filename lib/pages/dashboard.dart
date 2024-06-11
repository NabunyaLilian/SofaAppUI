import 'package:flutter/material.dart';
import 'package:sofa_app/pages/park_bench.dart';
import 'package:sofa_app/pages/sofa.dart';

import 'all.dart';
import 'arm_chair.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  var tabs = [
    const Tab(text: 'All'),
    const Tab(text: 'Sofa'),
    const Tab(text: 'Park Bench'),
    const Tab(text: 'Armchair'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          backgroundColor: const Color(0xFFE4E2E4),
          body: SafeArea(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: CurvedClip(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    color: const Color(0xFFA45029),
                  ),
                ),
                Positioned(
                  child: Column(
                    children: [
                      SizedBox(
                          height:
                              (MediaQuery.of(context).size.height * 0.4) / 1.8),
                      TabBar(
                          labelStyle: const TextStyle(fontSize: 16),
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          unselectedLabelColor: Colors.white,
                          labelColor: Colors.white,
                          dividerHeight: 0,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0XFFBD6F4A)),
                          indicatorSize: TabBarIndicatorSize.tab,
                          tabs: tabs),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TabBarView(
                            children: [
                              All(),
                              const Sofa(),
                              const ParkBench(),
                              const ArmChair(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Dashboard',
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.notifications_none,
                                size: 28,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                          decoration: InputDecoration(
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 30, right: 8),
                          child: Icon(
                            Icons.search,
                            size: 30,
                            color: Color(0xFFC2784B),
                          ),
                        ),
                        filled: true,
                        fillColor: const Color(0XFFFFF0A0),
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                            fontSize: 16, color: Color(0xFFC2784B)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                      )),
                    ),
                  ],
                ))
              ],
            ),
          )),
    );
  }
}

class CurvedClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;

    Path path = Path();
    path.lineTo(0, height);
    path.quadraticBezierTo(8, height - 30, 30, height - 30);
    path.quadraticBezierTo(width * 0.5, height - 30, width - 30, height - 30);
    path.quadraticBezierTo(width - 8, height - 30, width, height);

    path.lineTo(width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
