abstract class CoreModel<Entity> {
  int get localId;

  String get remoteId;

  DateTime get lastUpdate;

  CoreModel();

  Entity toEntity();
}
