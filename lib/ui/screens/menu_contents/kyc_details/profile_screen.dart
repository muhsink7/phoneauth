// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:profile/custom_widget/add_box.dart';
// import 'package:profile/custom_widget/finish_box.dart';
// import 'package:profile/custom_widget/number_box.dart';
// import 'package:profile/custom_widget/race_box.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController panNumController = TextEditingController();
  TextEditingController aadharNumController = TextEditingController();

  String? selectedGender;
  final List<String> genderOption = ['Male', 'Female', 'Others'];

  String? selectedYear;
  final List<String> yearOption = [];

  String? selectedMonth;
  final List<String> monthOption = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  String? selectedDay;
  final List<String> dayOption = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
  ];

  @override
  void initState() {
    generateYearOptions();
    _imagePaths = _imageBox.values.toList();
    super.initState();
  }

  void generateYearOptions() {
    final int currentYear = DateTime.now().year;
    for (int year = currentYear - 100; year <= currentYear; year++) {
      yearOption.add(year.toString());
    }
  }

  final ImagePicker _imagePicker = ImagePicker();
  final Box<String> _imageBox = Hive.box<String>('images');
  List<String> _imagePaths = [];

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      final imagePath = pickedFile.path;
      _imageBox.add(imagePath);
      setState(() {
        _imagePaths.add(imagePath);
      });
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return ImageListScreen(pickedImage: [imagePath]);
        },
      ));
    }
  }

  @override
  void dispose() {
    _imageBox.close();

    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color secondarycolor = Color(0XFF112853);
    Color primarycolor = Color(0XFFEABE41);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'KYC Documents',
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
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
                      color: secondarycolor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: userNameController,
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
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: secondarycolor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: firstNameController,
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
                      width: 1.h,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: secondarycolor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: lastNameController,
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
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: secondarycolor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: genderController,
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'Gender',
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.white)),
                            readOnly: true,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            showGenderOption();
                          },
                          child: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Date of Birth',
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800]),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: secondarycolor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: yearController,
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
                            InkWell(
                              onTap: () {
                                showYearOption();
                              },
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.sp,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: secondarycolor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: monthController,
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
                            InkWell(
                              onTap: () {
                                showMonthOption();
                              },
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.sp,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: secondarycolor),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: dayController,
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
                            InkWell(
                              onTap: () {
                                showDayOption();
                              },
                              child: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: secondarycolor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: panNumController,
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
                          height: 1.h,
                        ),
                        Text(
                          ' 1',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    )),
                    SizedBox(
                      width: 1.h,
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: primarycolor,
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
                                            TextStyle(color: secondarycolor)),
                                    readOnly: true,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    showImageOption();
                                  },
                                  child: Icon(
                                    Icons.attach_file,
                                    color: secondarycolor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Not Submitted',
                          style: TextStyle(
                              color: Colors.amber[900],
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ))
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: secondarycolor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: aadharNumController,
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
                  height: 2.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: primarycolor,
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
                                              TextStyle(color: secondarycolor)),
                                      readOnly: true,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showImageOption();
                                    },
                                    child: Icon(
                                      Icons.attach_file,
                                      color: secondarycolor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Approved',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 98, 187, 25),
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: primarycolor,
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
                                              TextStyle(color: secondarycolor)),
                                      readOnly: true,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showImageOption();
                                    },
                                    child: Icon(
                                      Icons.attach_file,
                                      color: secondarycolor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'Rejected',
                            style: TextStyle(
                                color: Colors.red[900],
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showGenderOption() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            Column(
              children: [
                ListTile(
                  title: Text('Male'),
                  onTap: () {
                    _selectGender('Male');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Female'),
                  onTap: () {
                    _selectGender('Female');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Others'),
                  onTap: () {
                    _selectGender('Other');
                    Navigator.pop(context);
                  },
                )
              ],
            )
          ],
        );
      },
    );
  }

  showImageOption() {
    return showDialog(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color.fromARGB(39, 63, 81, 181)),
          child: AlertDialog(
            title: Row(
              children: [
                Text(
                  'Pick image from',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Spacer(),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_forward_ios_rounded))
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              _pickImage(ImageSource.camera);
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.camera_alt)),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text('Camera'),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Column(
                      children: [
                        InkWell(
                            onTap: () {
                              _pickImage(ImageSource.gallery);
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.image)),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text('Gallery'),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  showYearOption() {
    return showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            actions: [
              Column(
                children: [
                  for (String year in yearOption)
                    ListTile(
                      title: Text(year),
                      onTap: () {
                        _selectYear(year);
                        Navigator.pop(context);
                      },
                    ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  showMonthOption() {
    return showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            actions: [
              Column(
                children: [
                  for (String month in monthOption)
                    ListTile(
                      title: Text(month),
                      onTap: () {
                        _selectMonth(month);
                        Navigator.pop(context);
                      },
                    ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  showDayOption() {
    return showDialog(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            actions: [
              Column(
                children: [
                  for (String day in dayOption)
                    ListTile(
                      title: Text(day),
                      onTap: () {
                        _selectDay(day);
                        Navigator.pop(context);
                      },
                    ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void _selectGender(String gender) {
    setState(() {
      selectedGender = gender;
      genderController.text = gender;
    });
  }

  void _selectYear(String year) {
    setState(() {
      selectedYear = year;
      yearController.text = year;
    });
  }

  void _selectMonth(String month) {
    setState(() {
      selectedMonth = month;
      monthController.text = month;
    });
  }

  void _selectDay(String day) {
    setState(() {
      selectedMonth = day;
      dayController.text = day;
    });
  }


}

class ImageListScreen extends StatelessWidget {
  final List<String> pickedImage;
  const ImageListScreen({super.key, required this.pickedImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picked Images'),
      ),
      body: ListView.builder(
        itemCount: pickedImage.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Image.file(File(pickedImage[index])),
          );
        },
      ),
    );
  }
}
