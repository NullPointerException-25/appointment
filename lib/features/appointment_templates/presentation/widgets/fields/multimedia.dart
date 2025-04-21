import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../../core/utils/global_values.dart';
import '../../../domain/entities/field.dart';

class ImageListTemplateField extends StatelessWidget {
  ImageListTemplateField(this.field, {super.key}) {
    assert(field.fieldType == FormFieldType.imageList,
    "Field type must be image list");
  }

  final FieldEntity field;

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
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: kSpacing,
              crossAxisSpacing: kSpacing,
              childAspectRatio: 1.0,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {

              if(index==9){
                return InkWell(
                  onTap: () {
                    // Aquí puedes agregar la lógica para abrir el selector de imágenes
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
                child: Icon(
                  HugeIcons.strokeRoundedImage02,
                  color: Theme.of(context).primaryColor,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}