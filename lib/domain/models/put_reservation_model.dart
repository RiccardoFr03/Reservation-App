class PutReservationModel {
  final int reservationId;
  final String reservationName;

  PutReservationModel(this.reservationId, this.reservationName);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'reservationId': reservationId,
      'reservationName': reservationName,
    };
  }

  factory PutReservationModel.fromJson(Map<String, dynamic> map) {
    return PutReservationModel(
      map['reservationId'] as int,
      map['reservationName'] as String,
    );
  }
}
