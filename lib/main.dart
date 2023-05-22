import 'package:etamendashboard/components.dart';
import 'package:etamendashboard/reservations.dart';
import 'package:etamendashboard/reservations_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

ReservationController c = ReservationController();
void main() async {
  print('STARTED');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  c.getreservations();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        primaryColor: Color(0xFFF06D57),
        colorScheme: ColorScheme.light(
            primary: Color(0xFFF06D57), secondary: Color(0xFFF48E7C)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40),
            backgroundColor:
                Color.fromARGB(255, 240, 109, 87), // background (button) color
            foregroundColor: Colors.white, // foreground (text) color
          ),
        ),
      ),
      home: const MyHomePage(title: 'Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var nurseNameController = TextEditingController();
  var nurseIdController = TextEditingController();
  var nurseLocationController = TextEditingController();
  var nursePriceController = TextEditingController();
  var nurseWorkingHoursController = TextEditingController();
  void addNurse({
    required String name,
    required int nurseID,
    required int price,
    required String location,
    required String workinghours,
  }) {
    FirebaseFirestore.instance
        .collection('nurses')
        .doc(nurseID.toString())
        .set({
          'name': name,
          'id': nurseID,
          'price': price,
          'location': location,
          'timeAvailable': workinghours,
        })
        .then((value) => null)
        .catchError((error) {
          print(error);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: TextStyle(color: Color(0xFFF06D57), fontSize: 30),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Get.to(Reservations());
              },
              child: Text('Reservations')),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 250, height: 250, child: Image.asset('logo.png')),
              SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: defaultTextField(
                      controller: nurseNameController,
                      validateFun: (val) {},
                      hintText: 'Nurse Name',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ID',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: defaultTextField(
                      controller: nurseIdController,
                      validateFun: (val) {},
                      hintText: 'Nurse ID',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Location',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: defaultTextField(
                      controller: nurseLocationController,
                      validateFun: (val) {},
                      hintText: 'Nurse Location',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: defaultTextField(
                      controller: nursePriceController,
                      validateFun: (val) {},
                      hintText: 'Nurse Price',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Working Hours',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: defaultTextField(
                      controller: nurseWorkingHoursController,
                      validateFun: (val) {},
                      hintText: 'Nurse Working Hours',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              defaultButton(
                  onpressedfunction: () {
                    addNurse(
                      name: nurseNameController.text,
                      nurseID: int.parse(nurseIdController.text),
                      price: int.parse(nursePriceController.text),
                      location: nurseLocationController.text,
                      workinghours: nurseWorkingHoursController.text,
                    );
                  },
                  title: 'Add Nurse'),
            ],
          ),
        ),
      ),
    );
  }
}
