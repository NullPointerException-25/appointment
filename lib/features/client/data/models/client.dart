
import 'package:appointments_manager/core/abstractions/model.dart';
import 'package:appointments_manager/features/appointment/data/models/appointment.dart';
import 'package:appointments_manager/features/client/domain/entities/client_entity.dart';
import 'package:appointments_manager/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';

@Entity(uid: 3)
class ClientModel extends CoreModel<ClientEntity> {
  @override
  @Id()
  int localId = 0;
  String name;
  String email;
  String phone;
  String imagePath;
  String urlImage;
  String description;
  @override
  String remoteId;
  @override
  @Property(type: PropertyType.date)
  DateTime lastUpdate = DateTime.now();
  @Backlink("client")
  final linkAppointments = ToMany<AppointmentModel>();

  ClientModel(
      {int? id,
      this.description = "",
      required this.name,
      this.urlImage = "",
      this.email = "",
      required this.lastUpdate,
      this.phone = "",
      this.imagePath = "",
      this.remoteId = ""});

  @override
  ClientEntity toEntity() {
    return ClientEntity(
        name: name,
        localImagePath: imagePath,
        description: description,
        phone: phone,
        localId: localId,
        lastUpdate: lastUpdate,
        remoteId: remoteId,
        urlImage: urlImage,
        email: email);
  }

}
