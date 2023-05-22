import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:etamendashboard/reservation_model.dart';
import 'package:get/get.dart';

import 'constants.dart';

class ReservationController extends GetxController {
  

  void getreservations() {
    reservations = [];
    FirebaseFirestore.instance.collection('reservations').get().then((value) {
      value.docs.forEach((element) {
        print(element.data());
        reservations.add(ReservationModel.fromJson(element.data()));
        print(reservations[0].toMap());
      });
      update();
    }).catchError((error) {
      print(error);
    });
  }
}
