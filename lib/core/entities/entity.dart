abstract class CoreEntity<model> {
  final int localId;
  final String remoteId;
  final DateTime lastUpdate;


  CoreEntity({
    required this.localId,
    required this.remoteId,
    required this.lastUpdate,
  });

  model toModel();
}