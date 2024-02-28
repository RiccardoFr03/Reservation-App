class BuildingModel {
  final int buildingId;
  final String name;
  final String linkImage;
  final String description;
  final bool isDeleted;
  //final int buildingType;

  BuildingModel(
      {required this.buildingId,
      required this.name,
      required this.linkImage,
      required this.description,
      required this.isDeleted,
    /*  required this.buildingType */});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'buildingId': buildingId,
      'name': name,
      'linkImage': linkImage,
      'description': description,
      'isDeleted': isDeleted,
   //   'buildingType': buildingType,
    };
  }

  factory BuildingModel.fromJson(Map<String, dynamic> map) {
    return BuildingModel(
      buildingId: map['buildingId'] as int,
      name: map['name'] as String,
      linkImage: map['linkImage'] as String,
      description: map['description'] as String,
      isDeleted: map['isDeleted'] as bool,
   //   buildingType: map['buildingType'] as int,
    );
  }
}
