import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_app/app/shared/font_size.dart';
import 'package:flutter_onboarding_app/app/shared/text_styles.dart';
import 'package:flutter_onboarding_app/shared/widgets/scaffold_shell.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../app/shared/colors.dart';
import '../../../app/shared/dimensions.dart';
import '../../../shared/widgets/custom_buttons.dart';
import '../notifier/onboarding.notifier.dart';

class OnboardingData {
  final int index;
  final String imageAsset;
  final String title;
  final String description;

  const OnboardingData(
      {required this.index,
      required this.imageAsset,
      required this.title,
      required this.description});
}

class ShowOnboardingView extends StatelessWidget {
  const ShowOnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    List<OnboardingData> listOfOnboardingData = const [
      OnboardingData(
          imageAsset: "onboarding_2",
          index: 0,
          title: "Uplift Hunger",
          description: "Order your favorite food from one single place"),
      OnboardingData(
          index: 1,
          imageAsset: "onboarding_3",
          title: "Create Collections",
          description: "Create your favorite restaurant collections."),
      OnboardingData(
          index: 2,
          imageAsset: "onboarding_1",
          title: "Familiar Stores",
          description:
              "We have curated all of your favorite stores in one place"),
    ];

    OnboardingNotifier onboardingNotifier({required bool renderUI}) =>
        Provider.of<OnboardingNotifier>(context, listen: renderUI);

    int lineIndex = onboardingNotifier(renderUI: true).lineIndex;

    Widget onboardingLinesPanel() {
      Widget renderLine({required int index}) {
        return Container(
          width: 20.w,
          height: 0.5.h,
          decoration: BoxDecoration(
              color: lineIndex == index
                  ? KConstantColors.whiteColor
                  : KConstantColors.whiteColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(4)),
        );
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          renderLine(index: 0),
          hSizedBox2,
          renderLine(index: 1),
          hSizedBox2,
          renderLine(index: 2),
        ],
      );
    }

    return FadeInDown(
      child: ScaffoldShellForLists(
        widgets: [
          vSizedBox3,
          vSizedBox3,
          onboardingLinesPanel(),
          vSizedBox2,
          SizedBox(
            height: 65.h,
            width: 100.w,
            child: PageView.builder(
                onPageChanged: (val) {
                  onboardingNotifier(renderUI: false).setLineIndex(index: val);
                },
                itemCount: listOfOnboardingData.length,
                itemBuilder: (context, index) {
                  OnboardingData onboardingData = listOfOnboardingData[index];
                  return SizedBox(
                    width: 100.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 50.h,
                            width: 80.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/${onboardingData.imageAsset}.png"),
                                    fit: BoxFit.fitWidth),
                                borderRadius: BorderRadius.circular(12))),
                        vSizedBox2,
                        Text(onboardingData.title,
                            style: KCustomTextStyle.kBoldItalic(
                                context, FontSize.header)),
                        Text(onboardingData.description,
                            style: KCustomTextStyle.kLight(
                                context, FontSize.kMedium)),
                      ],
                    ),
                  );
                }),
          ),
          vSizedBox2,
          if (onboardingNotifier(renderUI: true).lineIndex == 2)
            Center(
              child: CustomRoundedButton(
                  backgroundColor: KConstantColors.bgColorFaint,
                  radius: 50,
                  height: 8,
                  onTap: () {},
                  label: "GET STARTED"),
            )
        ],
      ),
    );
  }
}
