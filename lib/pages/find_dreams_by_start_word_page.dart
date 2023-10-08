import 'package:dreams_dictionary/notifier/find_dreams_by_start_word_page_notifier.dart';
import 'package:dreams_dictionary/pages/details_page.dart';
import 'package:dreams_dictionary/resources/colors.dart';
import 'package:dreams_dictionary/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FindDreamsByStartWordPage extends ConsumerWidget {
  const FindDreamsByStartWordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogHeader = ref.read(blogHeaderProvider);
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2 / 1.8),
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => DetailsPage(
                        id: blogHeader[index].blogId,
                      ))),
              child: Card(
                margin: const EdgeInsets.all(kSP5x),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      blogHeader[index].headerKey,
                      style: const TextStyle(color: kBlack38Color, fontSize: 42),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kSP10x),
                      child: Text(
                        blogHeader[index].blogTitle,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: blogHeader.length,
        ),
      ),
    );
  }
}
