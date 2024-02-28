import 'package:cloud_craft_solution/domain/models/desk_bools_model.dart';

class GetFreeDeskModel {
  final int horizontalDesk;
  final int verticalDesk;
  final List<DeskBoolsModel> deskBools;

  GetFreeDeskModel(this.horizontalDesk, this.verticalDesk, this.deskBools);

  Map<String, dynamic> toJosn() {
    return <String, dynamic>{
      'horizontalDesk': horizontalDesk,
      'verticalDesk': verticalDesk,
      'deskBools': deskBools.map((x) => x.toJson()).toList(),
    };
  }

  factory GetFreeDeskModel.fromJson(Map<String, dynamic> map) {
    return GetFreeDeskModel(
      map['horizontalDesk'] as int,
      map['verticalDesk'] as int,
      List<DeskBoolsModel>.from(
        (map['deskBools'] as List<dynamic>).map<DeskBoolsModel>(
          (x) => DeskBoolsModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
