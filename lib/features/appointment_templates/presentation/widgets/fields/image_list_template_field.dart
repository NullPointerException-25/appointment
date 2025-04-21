
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/global_values.dart';
import '../../../domain/entities/field.dart';
import '../../../domain/entities/field_answer.dart';

class ImageListTemplateField extends StatelessWidget {
  final FieldEntity field;
  final RxList<String> images = <String>[].obs;
  final RxList<String> imagesURL = <String>[].obs;
  ImageListTemplateField(this.field, {super.key}) {
    assert(field.fieldType == FormFieldType.imageList,
        "Field type must be image list");
    assert(field.answer is FieldAnswerEntity<List<String>>,
        "Field answer must be of type List<String>");
    final FieldAnswerEntity<List<String>> value =
        field.answer as FieldAnswerEntity<List<String>>;
    final FieldAnswerEntity<List<String>> remoteValue =
        field.answer as FieldAnswerEntity<List<String>>;
    images.value = value.value;
    imagesURL.value= remoteValue.value;
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: kPaddingM, left: kPaddingM, right: kPaddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                field.title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(HugeIcons.strokeRoundedAdd01),
                color: Theme.of(context).primaryColor,
                onPressed: () {  },
              ),
            ],
          ),
          const SizedBox(height: kSpacing),
          Obx(
             () =>  GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: kSpacing,
                crossAxisSpacing: kSpacing,
                childAspectRatio: 1.0,
              ),
              itemCount: images.length+1,
              itemBuilder: (context, index) {

                if(index == images.length){
                  return InkWell(
                    onTap: () async {
                     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                     if(image != null){
                       images.add(image.path);
                     }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kCornerRadius),
                        color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                      ),
                      child: Icon(
                        HugeIcons.strokeRoundedAdd01,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  );
                }
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kCornerRadius),
                    color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(kCornerRadius),
                        child: Image.file(
                          File(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).primaryColor.withValues(alpha: 0.3),
                          ),
                          child: IconButton(
                            icon: const Icon(HugeIcons.strokeRoundedCancel01),
                            color: Theme.of(context).primaryColor,
                            onPressed: () {
                              images.removeAt(index);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}