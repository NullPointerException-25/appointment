abstract class CoreEntity<Model> {
   int get localId;
   String get remoteId;
   DateTime get lastUpdate;

  CoreEntity(); 

  Model toModel();
}