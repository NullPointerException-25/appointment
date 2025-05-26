import 'package:appointments_manager/core/abstractions/usecases.dart';
import 'package:appointments_manager/core/services/in_app_notification_service.dart';
import 'package:appointments_manager/core/utils/routes.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:get/get.dart';

import '../../data/repositories/template_local_impl.dart';
import '../../mappers/field_answer_mapper.dart';
import '../entities/field.dart';
import '../entities/template.dart';

class SaveTemplateUseCase extends UseCase<void> {
  late final TemplateRepositoryLocalImpl _templateRepositoryLocalImpl;
  final AppointmentTemplateEntity _template;
  final List<FieldEntity> _fields;

  SaveTemplateUseCase(this._template, this._fields,
      {TemplateRepositoryLocalImpl? templateRepositoryLocalImpl}) {
    _templateRepositoryLocalImpl =
        templateRepositoryLocalImpl ?? TemplateRepositoryLocalImpl.to;
  }

  @override
  Future<void> perform() async {
    final res = await _templateRepositoryLocalImpl.saveTemplate(_template);

    for (final field in _fields) {
      field.answer = FieldAnswerMapper.defaultAnswer(field);
    }
    await _templateRepositoryLocalImpl.attachFieldsToTemplate(res, _fields);
    InAppNotificationService.to
        .showNotificationSuccess(Translator.templateCreated.tr);

    Get.offAllNamed(Routes.home);
  }

}
