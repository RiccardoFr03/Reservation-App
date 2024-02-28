import 'package:cloud_craft_solution/domain/models/user_reservation_model.dart';

class UserReservationByDay {
  final DateTime date;
  final List<UserReservationModel> reservations;

  UserReservationByDay(this.date, this.reservations);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'date': date.millisecondsSinceEpoch,
      'reservations': reservations.map((x) => x.toJson()).toList(),
    };
  }

  factory UserReservationByDay.fromJson(Map<String, dynamic> map) {
    return UserReservationByDay(
      DateTime.parse(map['date'] as String),
      List<UserReservationModel>.from(
        (map['reservations'] as List<dynamic>).map<UserReservationModel>(
          (x) => UserReservationModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
