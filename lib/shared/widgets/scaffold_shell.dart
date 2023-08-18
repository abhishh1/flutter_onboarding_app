import 'package:flutter/material.dart';
import '../../app/shared/colors.dart';

class ScaffoldShellForLists extends StatelessWidget {
  final bool needPadding;
  final List<Widget> widgets;
  final Widget? bottomAppBar;
  final bool? fabPositionIsCenter;
  final Widget? fab;
  final String? appKey;
  final Color? defBgColor;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  const ScaffoldShellForLists(
      {super.key,
      this.needPadding = true,
      this.bottomAppBar,
      this.fab,
      this.fabPositionIsCenter,
      this.appKey,
      this.defBgColor,
      this.mainAxisAlignment,
      this.crossAxisAlignment,
      required this.widgets});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
          color: defBgColor ?? KConstantColors.bgColor,
          child: SafeArea(
              bottom: false,
              child: Scaffold(
                  floatingActionButtonLocation: fabPositionIsCenter ?? false
                      ? FloatingActionButtonLocation.centerFloat
                      : FloatingActionButtonLocation.endDocked,
                  floatingActionButton: fab,
                  bottomNavigationBar: bottomAppBar != null
                      ? BottomAppBar(
                          color: Colors.transparent, child: bottomAppBar)
                      : const SizedBox(height: 0, width: 0),
                  backgroundColor: defBgColor ?? KConstantColors.bgColor,
                  body: Padding(
                    padding: EdgeInsets.all(needPadding ? 8 : 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment:
                              mainAxisAlignment ?? MainAxisAlignment.start,
                          crossAxisAlignment:
                              crossAxisAlignment ?? CrossAxisAlignment.start,
                          children: widgets),
                    ),
                  )))),
    );
  }
}
