class UserReservationModel {
  final int reservationId;
  final String reservationName;
  final int userId;
  final String userFirstName;
  final String userLastName;
  final int roomId;
  final String roomName;
  final int buildingId;
  final String buildingName;
  final bool isDesk;
  final DateTime dateTimeStart;
  final DateTime dateTimeEnd;
  final bool isDeleted;

  UserReservationModel(
      this.reservationId,
      this.reservationName,
      this.userId,
      this.userFirstName,
      this.userLastName,
      this.roomId,
      this.roomName,
      this.buildingId,
      this.buildingName,
      this.isDesk,
      this.dateTimeStart,
      this.dateTimeEnd,
      this.isDeleted);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'reservationId': reservationId,
      'reservationName': reservationName,
      'userId': userId,
      'userFirstName': userFirstName,
      'userLastName': userLastName,
      'roomId': roomId,
      'roomName': roomName,
      'buildingId': buildingId,
      'buildingName': buildingName,
      'isDesk': isDesk,
      'dateTimeStart': dateTimeStart.millisecondsSinceEpoch,
      'dateTimeEnd': dateTimeEnd.millisecondsSinceEpoch,
      'isDeleted': isDeleted,
    };
  }

  factory UserReservationModel.fromJson(Map<String, dynamic> map) {
    return UserReservationModel(
      map['reservationId'] as int,
      map['reservationName'] as String,
      map['userId'] as int,
      map['userFirstName'] as String,
      map['userLastName'] as String,
      map['roomId'] as int,
      map['roomName'] as String,
      map['buildingId'] as int,
      map['buildingName'] as String,
      map['isDesk'] as bool,
      DateTime.parse(map['dateTimeStart'] as String),
      DateTime.parse(map['dateTimeEnd'] as String),
      map['isDeleted'] as bool,
    );
  }
}
