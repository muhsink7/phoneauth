import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;

// import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:sizer/sizer.dart';

import 'image_list_screen.dart';
// import 'kyc_details_screen.dart';

class KYCController extends GetxController {

  static KYCController get instance => Get.find();


  TextEditingController userNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
    'January', 'February', 'March', 'April', 'May', 'June', 'July',
    'August', 'September', 'October', 'November', 'December',
  ];

  final DateTime lastDate = DateTime.now().subtract(Duration(days: 365 * 18));


  String? selectedDay;
  final List<String> dayOption = [
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13',
    '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24',
    '25', '26', '27', '28', '29', '30', '31',
  ];

  @override
  void onInit() {
    generateYearOptions();
    super.onInit();
  }

  void selectGender(String gender) {
    selectedGender = gender;
    genderController.text = gender;
  }

  void selectYear(String year) {
    selectedYear = year;
    yearController.text = year;
  }

  void selectMonth(String month) {
    selectedMonth = month;
    monthController.text = month;
  }

  void selectDay(String day) {
    selectedDay = day;
    dayController.text = day;
  }

  void generateYearOptions() {
    final int currentYear = DateTime.now().year;
    for (int year = currentYear - 100; year <= currentYear; year++) {
      yearOption.add(year.toString());
    }
  }

  final ImagePicker _imagePicker = ImagePicker();
  // final Box<String> _imageBox = Hive.box<String>('images');
  RxList<String> _imagePaths = <String>[].obs;

  List<String> get imagePaths => _imagePaths.toList();

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      final imagePath = pickedFile.path;
      // _imageBox.add(imagePath);
      _imagePaths.add(imagePath);
      Get.to(ImageListScreen(pickedImage: [imagePath]));
    }
  }

  void showGenderOption() {
    Get.dialog(

       AlertDialog(
        title: Text("Select a gender"),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: Text('Male'),
                onTap: () {
                  selectGender('Male');
                  Get.back(); // Close the dialog using GetX
                },
              ),
              ListTile(
                title: Text('Female'),
                onTap: () {
                  selectGender('Female');
                  Get.back(); // Close the dialog using GetX
                },
              ),
              ListTile(
                title: Text('Others'),
                onTap: () {
                  selectGender('Other');
                  Get.back(); // Close the dialog using GetX
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showImageOption() {
    Get.defaultDialog(
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromARGB(39, 63, 81, 181),
        ),
        child: AlertDialog(
          title: Row(
            children: [
              InkWell(
                onTap: () {
                  Get.back(); // Close the dialog using GetX
                },
                child: Icon(Icons.arrow_back_ios),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Pick image from',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
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
                          pickImage(ImageSource.camera);
                          Get.back(); // Close the dialog using GetX
                        },
                        child: Icon(Icons.camera_alt),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('Camera'),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          pickImage(ImageSource.gallery);
                          Get.back(); // Close the dialog using GetX
                        },
                        child: Icon(Icons.image),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text('Gallery'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  void showYearOption() {
    Get.dialog(
      AlertDialog(
          title: Text("Select a year"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (String year in yearOption)
                  ListTile(
                    title: Text(year),
                    onTap: () {
                      selectYear(year);
                      Get.back();
                    },
                  ),
              ],
            ),
          )
      ),
    );
  }


  void showMonthOption() {
    Get.dialog(

        AlertDialog(
          title: Text("Select Month"),
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      content: SingleChildScrollView(
        child: Column(
          children: [
            for (String month in monthOption)
              ListTile(
                title: Text(month),
                onTap: () {
                  selectMonth(month);
                  Get.back(); // Close the dialog
                },
              ),
          ],
        ),
      ),
    );
  }

  void showDayOption() {
    Get.dialog(
      AlertDialog(
        title: Text("Select a Day"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              for (String day in dayOption)
                ListTile(
                  title: Text(day),
                  onTap: () {
                    selectDay(day);
                    print(day);
                    Get.back(); // Close the dialog
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void selectDateOfBirth(String userId , String phoneNumber) {
    RxString selectedYearRx = ''.obs;
    RxString selectedMonthRx = ''.obs;
    RxString selectedDayRx = ''.obs;
      showYearOption();
      ever(selectedYearRx, (_) {
        showMonthOption();
        ever(selectedMonthRx, (_) {
          showDayOption();
          ever(selectedDayRx, (_) {
            // All parts of the date are selected, now you can use them
            String dateOfBirth =
                "${selectedDayRx.value}-${selectedMonthRx.value}-${selectedYearRx.value}";
            // Call another function with the dateOfBirth value
            kycUpdate(userId, phoneNumber, dateOfBirth);
        });
      });
    });
  }


  Future<void> kycUpdate(userId, phoneNumber, [String? dateOfBirth]) async {
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('PUT',
        Uri.parse('http://15.206.68.154:5000/users/update/$userId'));
    request.body = json.encode({
      "userId": userId,
      "userName" :"",
      "phoneNumber": phoneNumber,
      "firstName" :"",
      "lastName" :"",
      "gender" :"",
      "dateOfBirth" :"",
      "email": emailController,
      "balanceAmount" :"",
      "registeredDate" :"",
      "bankName" :"",
      "accountNumber" :"",
      "ifscCode" :"",
      "upiId" :"",
      "kycStatus" :"",
      "kycAadharCardNumber": aadharNumController,
      "kycPancardNumber" :"",
      "kycPancardFront" :"",
      "kycAadharFront" :"",
      "kycAadharBack" :"",
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }



  @override
  void onClose() {
    // _imageBox.close();
    // Hive.close();
    super.onClose();
  }

}


