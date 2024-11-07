import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomScafoldWidget extends StatelessWidget {
  const CustomScafoldWidget(
      {super.key,
      this.body,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.appBar});
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).scaffoldBackgroundColor
        ], stops: const [
          0.2,
          0.2
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          appBar: appBar,
        ));
  }
}
