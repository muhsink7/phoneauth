import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/color_constants.dart';
import '../../models/banner/image_banner.dart';
import '../../models/reusable_card/reusable_card.dart';
import 'home_controller.dart';


class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              // Positioned content for the top section
              Container(
                width: MediaQuery.of(context).size.width,
                height: 125,
                decoration: BoxDecoration(
                  color: primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: kBlackColor.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Username",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: secondaryColor,
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    for (int i = 0; i < 5; i++)
                                      const Icon(
                                        Icons.star,
                                        color: secondaryColor,
                                        size: 20.0,
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: secondaryColor.withOpacity(0.1), // Shadow color and opacity
                                  spreadRadius: 0.3, // Spread radius
                                  blurRadius: 4, // Blur radius
                                  offset: Offset(0,0), // Offset in the vertical direction
                                ),
                              ],
                            ),
                            child: const Divider(
                              thickness: 3.0,
                              color: secondaryColor,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: const Row(
                                  children: [
                                    Icon(Icons.currency_rupee,
                                        size: 18.0, color: secondaryColor),
                                    Text(
                                      "99999 ",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: const Row(
                                  children: [
                                    Icon(Icons.monetization_on,
                                        size: 18.0, color: secondaryColor),
                                    Text(
                                      "99999 ",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            border: Border.all(
                              color: secondaryColor,
                              width: 5.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: kBlackColor.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 4,
                                offset: const Offset(0, 0),
                              ),
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(
                                8.0), // Adjust the padding as needed
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/logo_gold.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ImageBanner(imageLists: controller.imageList)
              ),
              // Your ListView.builder goes here
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: const ReusableCard(),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
