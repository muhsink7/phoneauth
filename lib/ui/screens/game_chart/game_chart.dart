import 'package:flutter/material.dart';
import 'package:phoneauth_firebase/constants/color_constants.dart';

class GameChart extends StatelessWidget {
  const GameChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("BANGALURU TROPHY",
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 20.0,
                      ),
                    ),
                    Row(children: [
                      Icon(Icons.money,color: kWhiteColor,),
                      Text("Entry fee : 500",style: TextStyle(
                          color: kWhiteColor
                      ),),
                    ]),
                    const Row(
                      children: [
                        Icon(Icons.emoji_events,color: kWhiteColor,),
                        Text("price : 50000",style: TextStyle(
                            color: kWhiteColor
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                // Add a Divider widget to create the dividing line
                thickness: 2,
                color: secondaryColor,
              ),
              Row()
            ],
          ),
        ],
      ),
    );
  }
}
