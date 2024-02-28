import 'package:cloud_craft_solution/domain/models/holiday_model.dart';
import 'package:cloud_craft_solution/domain/models/user_reservation_by_day_model.dart';

class HomeGet {
  final List<UserReservationByDay> userReservation;
  final List<HolidayModel> holiday;

  HomeGet(this.userReservation, this.holiday);
}
