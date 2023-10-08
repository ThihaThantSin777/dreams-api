import 'package:dreams_dictionary/notifier/search_page_notifier.dart';
import 'package:dreams_dictionary/resources/strings.dart';
import 'package:dreams_dictionary/widget/index_and_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../resources/dimens.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchContentList = ref.watch(searchBlogContentList);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kSP20x),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: kTextFieldHeight,
                child: TextField(
                  decoration: const InputDecoration(border: OutlineInputBorder(), hintText: kHintText),
                  onChanged: (key) {
                    ref.read(searchBlogContentList.notifier).searchDreamsByWord(key);
                  },
                ),
              ),
              const SizedBox(
                height: kSP20x,
              ),
              Expanded(
                child: Visibility(
                  visible: searchContentList.isNotEmpty,
                  replacement: const SizedBox.shrink(),
                  child: ListView.separated(
                    itemCount: searchContentList.length,
                    separatorBuilder: (_, index) => const SizedBox(
                      height: kSP10x,
                    ),
                    itemBuilder: (_, index) => IndexAndContentWidget(
                      index: index,
                      content: searchContentList[index].blogContent,
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
