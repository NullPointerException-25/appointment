
import 'package:get/get.dart';

import '../../domain/entities/field.dart';
import '../../domain/entities/template.dart';
import '../../domain/repositories/template_repository.dart';
import '../datasource/template_local_datasource.dart';



class TemplateRepositoryLocalImpl extends GetxService implements TemplateRepository {
  late final TemplateLocalDatasource _templateLocalDatasource;


  TemplateRepositoryLocalImpl({TemplateLocalDatasource? templateLocalDatasource}){
    _templateLocalDatasource = templateLocalDatasource ?? TemplateLocalDatasource.to;
  }

  static TemplateRepositoryLocalImpl get to => Get.find<TemplateRepositoryLocalImpl>();


  @override
  Future<void> attachFieldsToTemplate(AppointmentTemplateEntity template, List<FieldEntity> fields) async {
    final templateModel = template.toModel();
    final fieldsModel = fields.map((e) => e.toModel()).toList();
    _templateLocalDatasource.attachFieldsToTemplate(templateModel, fieldsModel);
    return;
  }

  @override
  Future<void> deleteTemplate(AppointmentTemplateEntity template) async {
    final templateModel = template.toModel();
    return await _templateLocalDatasource.deleteTemplate(templateModel);
  }

  @override
  Future<List<AppointmentTemplateEntity>> getAllTemplates() async {
    final templatesModel = await _templateLocalDatasource.getAllTemplates();
    return templatesModel.map((e) => e.toEntity()).toList();
  }

  @override
  Future<AppointmentTemplateEntity?> getTemplateById(int id) {
    // TODO: implement getTemplateById
    throw UnimplementedError();
  }

  @override
  Future<AppointmentTemplateEntity> saveTemplate(AppointmentTemplateEntity template) {
    final templateModel = template.toModel();
    _templateLocalDatasource.saveTemplate(templateModel);
    return Future.value(templateModel.toEntity());
  }

  @override
  Future<void> updateTemplate(AppointmentTemplateEntity template) {
    // TODO: implement updateTemplate
    throw UnimplementedError();
  }
}