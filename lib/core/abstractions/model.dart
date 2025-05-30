abstract class CoreModel<Entity> {
  int get localId;

  String get remoteId;

  DateTime get lastUpdate;

  CoreModel();

  Entity toEntity();

  toJson();
  factory CoreModel.fromJson(Map<String, dynamic> json){
    throw UnimplementedError("toJson not implemented");
  }
}
