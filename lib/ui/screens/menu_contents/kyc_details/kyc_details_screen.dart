
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/color_constants.dart';
import 'kyc_controller.dart';

class KYCDetailsScreen extends GetWidget<KYCController> {
  const KYCDetailsScreen({super.key});



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GetBuilder<KYCController>(
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'KYC Documents',
                          style: TextStyle(
                            fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        GestureDetector(
                            onTap: () {
                              Get.back();
                              // showBettingOption();
                            },
                            child: Icon(Icons.arrow_back_ios))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controller.userNameController,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: 'User name',
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: controller.firstNameController,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: 'First name',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: controller.lastNameController,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: 'Last name',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                onTap: () {
                                  controller.showGenderOption();
                                },
                                controller: controller.genderController,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: 'Gender',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.white)),
                                readOnly: true,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Date of Birth',
                      style: TextStyle(

                          fontWeight: FontWeight.w600,
                          color: Colors.grey[800]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      onTap: () {
                                        controller.showYearOption();;
                                      },
                                      controller: controller.yearController,
                                      cursorColor: Colors.white,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          hintText: 'Year',
                                          border: InputBorder.none,
                                          hintStyle:
                                          TextStyle(color: Colors.white)),
                                      readOnly: true,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      onTap: () {
                                        controller.showMonthOption();
                                      },
                                      controller: controller.monthController,
                                      cursorColor: Colors.white,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          hintText: 'Month',
                                          border: InputBorder.none,
                                          hintStyle:
                                          TextStyle(color: Colors.white)),
                                      readOnly: true,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: secondaryColor),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      onTap: () {
                                        controller.showDayOption();
                                      },
                                      controller: controller.dayController,
                                      cursorColor: Colors.white,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          hintText: 'Day',
                                          border: InputBorder.none,
                                          hintStyle:
                                          TextStyle(color: Colors.white)),
                                      readOnly: true,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: secondaryColor,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      controller: controller.panNumController,
                                      cursorColor: Colors.white,
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                          hintText: 'PAN Number',
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  ' 1',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            style: TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                                hintText: 'PAN Card',
                                                border: InputBorder.none,
                                                hintStyle:
                                                TextStyle(color: secondaryColor)),
                                            readOnly: true,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.showImageOption();
                                          },
                                          child: Icon(
                                            Icons.attach_file,
                                            color: secondaryColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'Not Submitted',
                                  style: TextStyle(
                                      color: Colors.amber[900],
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                controller: controller.aadharNumController,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    hintText: 'Aadhar number',
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                              hintText: 'Front side',
                                              border: InputBorder.none,
                                              hintStyle:
                                              TextStyle(color: secondaryColor)),
                                          readOnly: true,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.showImageOption();
                                        },
                                        child: Icon(
                                          Icons.attach_file,
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Approved',
                                style: TextStyle(
                                    color: const Color.fromARGB(255, 98, 187, 25),
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration(
                                              hintText: 'Back side',
                                              border: InputBorder.none,
                                              hintStyle:
                                              TextStyle(color: secondaryColor)),
                                          readOnly: true,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.showImageOption();
                                        },
                                        child: Icon(
                                          Icons.attach_file,
                                          color: secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Rejected',
                                style: TextStyle(
                                    color: Colors.red[900],
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }






}

