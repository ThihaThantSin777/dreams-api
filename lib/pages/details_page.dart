import 'package:dreams_dictionary/data/vos/blog_details_vo/blog_details_vo.dart';
import 'package:dreams_dictionary/notifier/details_page_notifer.dart';
import 'package:dreams_dictionary/resources/colors.dart';
import 'package:dreams_dictionary/resources/dimens.dart';
import 'package:dreams_dictionary/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/index_and_content_widget.dart';

class DetailsPage extends ConsumerWidget {
  const DetailsPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsList = ref.watch(detailsProvider(id));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kSP10x),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: kTextFieldHeight,
                child: TextField(
                  decoration: const InputDecoration(border: OutlineInputBorder(), hintText: kSearchText),
                  onChanged: (text) {
                    ref.read(detailsProvider(id).notifier).searchDreamsByWord(text);
                  },
                ),
              ),
              const SizedBox(
                height: kSP20x,
              ),
              Expanded(
                child: Visibility(
                  visible: detailsList.isNotEmpty,
                  replacement: const Center(
                    child: Text(kNotFoundText),
                  ),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(0),
                    itemCount: detailsList.length,
                    separatorBuilder: (_, index) => const SizedBox(
                      height: kSP10x,
                    ),
                    itemBuilder: (_, index) => IndexAndContentWidget(
                      index: index,
                      content: detailsList[index].blogContent,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
