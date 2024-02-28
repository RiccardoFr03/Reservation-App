// ignore_for_file: avoid_init_to_null

import 'package:intl/intl.dart';

class PostReservationModel {
  final String reservationName;
  final String userEmail;
  final int roomId;
  final DateTime? dateTimeStart;
  final DateTime? dateTimeEnd;

  PostReservationModel(
      {this.reservationName = '',
      this.userEmail = '',
      this.roomId = 0,
      this.dateTimeStart = null,
      this.dateTimeEnd = null});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'reservationName': reservationName,
      'userEmail': userEmail,
      'roomId': roomId,
      'dateTimeStart': DateFormat('yyyy-MM-ddTHH:mm:ss').format(dateTimeStart!),
      'dateTimeEnd': DateFormat('yyyy-MM-ddTHH:mm:ss').format(dateTimeEnd!),
    };
  }


    factory PostReservationModel.fromJson(Map<String, dynamic> map) {
    return PostReservationModel(
      reservationName: map['reservationName'] as String,
      userEmail: map['userEmail'] as String,
      roomId: map['roomId'] as int,
      dateTimeStart: map['dateTimeStart'] as DateTime,
      dateTimeEnd: map['dateTimeEnd'] as DateTime,
    );
  }
}
