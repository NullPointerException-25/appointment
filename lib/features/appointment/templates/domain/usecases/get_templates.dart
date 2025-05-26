import 'package:appointments_manager/core/abstractions/usecases.dart';


import '../../data/repositories/template_local_impl.dart';
import '../entities/template.dart';

class GetTemplatesUseCase extends UseCase<List<AppointmentTemplateEntity>> {
  late final TemplateRepositoryLocalImpl _templateRepositoryLocalImpl;

  GetTemplatesUseCase({TemplateRepositoryLocalImpl? templateRepositoryLocalImpl}) {
    _templateRepositoryLocalImpl = templateRepositoryLocalImpl ?? TemplateRepositoryLocalImpl.to;
  }

  @override
  Future<List<AppointmentTemplateEntity>> perform() async {
    final res = await _templateRepositoryLocalImpl.getAllTemplates();

    return res.map((e) {
      e.fields.map((field){
        field.localId = 0;
        return field;
      });
      return e;
    }).toList();
  }
}
