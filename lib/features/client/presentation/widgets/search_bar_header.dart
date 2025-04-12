import 'package:appointments_manager/core/utils/colors.dart';
import 'package:appointments_manager/core/utils/global_values.dart';
import 'package:appointments_manager/core/utils/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/utils/fonts.dart';

class SearchBarHeaderSliver extends StatelessWidget {
  const SearchBarHeaderSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return PinnedHeaderSliver(
      child: Container(
        padding: const EdgeInsets.all(kPaddingM),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? ThemeColors.black
                : ThemeColors.white),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 36,
                decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? ThemeColors.dark
                        : ThemeColors.white,
                    border: Theme.of(context).brightness == Brightness.light
                        ? Border.all(
                        width: 0.5
                    )
                        : null,
                    borderRadius: const BorderRadius.all(
                        Radius.circular(kCornerRadius))),
                child: TextField(
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: kFontSizeL,
                      fontWeight: FontWeight.w300,
                      fontFamily: FontFamily.montserrat,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? ThemeColors.white
                          : ThemeColors.black),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      isDense: true,
                      hintText: Translator.name.tr,
                      hintStyle: TextStyle(
                          fontSize: kFontSizeL,
                          fontWeight: FontWeight.w300,
                          fontFamily: FontFamily.montserrat,
                          color: Theme.of(context).brightness ==
                              Brightness.dark
                              ? ThemeColors.white.withValues(alpha: 0.8)
                              : ThemeColors.black.withValues(alpha: 0.8)),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        HugeIcons.strokeRoundedSearch02,
                        color:
                        Theme.of(context).brightness == Brightness.light
                            ? ThemeColors.black
                            : ThemeColors.white,
                      )),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: ThemeColors.lightBlue,
                  borderRadius: BorderRadius.circular(kCornerRadius)),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(HugeIcons.strokeRoundedFilter),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    Translator.filters.tr,
                    style: const TextStyle(color: ThemeColors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
