import 'package:dreams_dictionary/notifier/home_page_notifier.dart';
import 'package:dreams_dictionary/pages/search_page.dart';
import 'package:dreams_dictionary/resources/colors.dart';
import 'package:dreams_dictionary/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../resources/dimens.dart';
import 'find_dreams_by_start_word_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ref.watch(apiProvider);
    return Scaffold(
      body: service.when(
          data: (data) {
            return const _HomePageSessionView();
          },
          error: (error, stack) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(error.toString()), Text(stack.toString())],
                ),
              ),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}

class _HomePageSessionView extends StatelessWidget {
  const _HomePageSessionView();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(kSP20x),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                kHomeTitleText,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: kFontSize20x, color: kBlack38Color),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: kSP20x,
              ),
              _SearchTextFieldContainerView(
                onTapTextField: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage()));
                },
              ),
              const SizedBox(
                height: kSP80x,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(kSP20x),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: MaterialButton(
              color: kBlack38Color,
              minWidth: double.infinity,
              height: kButtonHeight,
              textColor: kWhiteColor,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const FindDreamsByStartWordPage()));
              },
              child: const Text(kWordStartText),
            ),
          ),
        )
      ],
    );
  }
}

class _SearchTextFieldContainerView extends StatelessWidget {
  const _SearchTextFieldContainerView({required this.onTapTextField});

  final Function onTapTextField;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapTextField(),
      child: Container(
        width: double.infinity,
        height: kTextFieldHeight,
        padding: const EdgeInsets.symmetric(horizontal: kSP10x),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(kSP5x), border: Border.all(color: kBlackColor)),
        child: const Text(
          kHintText,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: kFontSize20x, color: kBlack38Color),
        ),
      ),
    );
  }
}
