class HolidayModel {
  final int eventId;
  final String name;
  final String description;
  final String linkImage;
  final DateTime dateTimeStart;
  final DateTime dateTimeEnd;
  final bool isHoliday;
  final List<String> buildings;

  HolidayModel(this.eventId, this.name, this.description, this.linkImage,
      this.dateTimeStart, this.dateTimeEnd, this.isHoliday, this.buildings);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'eventId': eventId,
      'name': name,
      'description': description,
      'linkImage': linkImage,
      'dateTimeStart': dateTimeStart.millisecondsSinceEpoch,
      'dateTimeEnd': dateTimeEnd.millisecondsSinceEpoch,
      'isHoliday': isHoliday,
      'buildings': buildings,
    };
  }

  factory HolidayModel.fromJson(Map<String, dynamic> map) {
    return HolidayModel(
      map['eventId'] as int,
      map['name'] as String,
      map['description'] as String,
      map['linkImage'] as String,
      DateTime.parse(map['dateTimeStart'] as String),
      DateTime.parse(map['dateTimeEnd'] as String),
      map['isHoliday'] as bool,
      List<String>.from((map['buildings'] as List<dynamic>)),
    );
  }
}
