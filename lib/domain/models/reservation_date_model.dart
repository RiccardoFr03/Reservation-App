// ignore_for_file: avoid_init_to_null

import 'package:intl/intl.dart';

class ReservatiDateModel {
  int buildingId;
  DateTime? dateStart;
  DateTime? dateEnd;


  static empty() {
    return ReservatiDateModel();
  }

  ReservatiDateModel({
    this.buildingId = 0,
    this.dateStart = null,
    this.dateEnd = null,

  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'buildingId': buildingId,
      'dateStart': DateFormat('yyyy-MM-ddTHH:mm:ss').format(dateStart!),
      'dateEnd': DateFormat('yyyy-MM-ddTHH:mm:ss').format(dateEnd!),

    };
  }

  factory ReservatiDateModel.fromJson(Map<String, dynamic> map) {
    return ReservatiDateModel(
      buildingId: map['buildingId'] as int,
      dateStart: map['dateStart'] as DateTime,
      dateEnd: map['dateEnd'] as DateTime,
    );
  }
}
