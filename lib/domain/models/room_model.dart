class RoomModel {
  final int roomId;
  final String name;
  final bool isDesk;
  final int buildingId;
  final String buildingName;
  final String linkImage;
  final String description;
  final int seats;
  final bool isDeleted;

  RoomModel(
      this.roomId,
      this.name,
      this.isDesk,
      this.buildingId,
      this.buildingName,
      this.linkImage,
      this.description,
      this.seats,
      this.isDeleted);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'roomId': roomId,
      'name': name,
      'isDesk': isDesk,
      'buildingId': buildingId,
      'buildingName': buildingName,
      'linkImage': linkImage,
      'description': description,
      'seats': seats,
      'isDeleted': isDeleted,
    };
  }

  factory RoomModel.fromJson(Map<String, dynamic> map) {
    return RoomModel(
      map['roomId'] as int,
      map['name'] as String,
      map['isDesk'] as bool,
      map['buildingId'] as int,
      map['buildingName'] as String,
      map['linkImage'] as String,
      map['description'] as String,
      map['seats'] as int,
      map['isDeleted'] as bool,
    );
  }
}
