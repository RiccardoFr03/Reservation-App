

class DeskBoolsModel {
  final int deskId;
  final String deskName;
  final bool isAvaiable;

  DeskBoolsModel({
    required this.deskId,
    required this.deskName,
    required this.isAvaiable,
  });

  DeskBoolsModel copyWith({
    int? deskId,
    String? deskName,
    bool? isAvaiable,
  }) {
    return DeskBoolsModel(
      deskId: deskId ?? this.deskId,
      deskName: deskName ?? this.deskName,
      isAvaiable: isAvaiable ?? this.isAvaiable,
    );
  }

  factory DeskBoolsModel.fromJson(Map<String, dynamic> map) {
    return DeskBoolsModel(
      deskId: map['deskId'] as int,
      deskName: map['deskName'] as String,
      isAvaiable: map['isAvaiable'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'deskId': deskId,
      'deskName': deskName,
      'isAvaiable': isAvaiable,
    };
  }
}
