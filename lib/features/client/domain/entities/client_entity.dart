import 'package:appointments_manager/core/entities/entity.dart';
import 'package:appointments_manager/features/client/data/models/client.dart';

class ClientEntity extends CoreEntity<ClientModel> {
  String name;
  String email;
  String phone;
  String localImagePath;
  String urlImage;

  ClientEntity({
    int id = 0,
    super.remoteId = "",
    DateTime? lastUpdate,
    required this.name,
    this.urlImage = "",
    this.email = "",
    this.phone = "",
    this.localImagePath = "",
  }) : super(
            localId: id,
            lastUpdate: lastUpdate ?? DateTime.now());

  @override
  ClientModel toModel() {
    return ClientModel(
      id: localId,
      name: name,
      email: email,
      phone: phone,
      imagePath: localImagePath,
      urlImage: urlImage,
      lastUpdate: lastUpdate,
    );
  }
}
