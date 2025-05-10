import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/features/appointment_templates/data/repositories/template_local_impl.dart';

import '../entities/template.dart';

class DeleteTemplateUseCase extends UseCase<void> {
  final AppointmentTemplateEntity _template;
  late final TemplateRepositoryLocalImpl _repository;

  DeleteTemplateUseCase(this._template, {TemplateRepositoryLocalImpl? repository}){
    _repository = repository ?? TemplateRepositoryLocalImpl.to;
  }
  @override
  Future<void> perform() {
    return _repository.deleteTemplate(_template);
  }
}