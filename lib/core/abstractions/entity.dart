abstract class CoreEntity<Model> {
  final int localId;
  final String remoteId;
  final DateTime lastUpdate;


  CoreEntity({
    required this.localId,
    required this.remoteId,
    required this.lastUpdate,
  });

  Model toModel();
}