import 'package:flutter/material.dart';

import '../../services/settings.dart';

class ScreenFormer extends StatelessWidget {
  final Widget? titleActions;
  final List<Widget>? children;
  final Widget? child;
  final Widget? drawer;
  final Widget? floatingButton;
  final bool isUpFloatingButton;
  final Widget? bottomBar;
  final ScrollController? controller;
  final Future<void> Function()? onRefresh;

  final Stream<bool>? streamLoadingStatus;

  const ScreenFormer({
    Key? key,
    this.titleActions,
    this.children,
    this.child,
    this.floatingButton,
    this.isUpFloatingButton = false,
    this.controller,
    this.onRefresh,
    this.bottomBar,
    this.streamLoadingStatus,
    this.drawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: DesignStyles.colorDark,
        bottomNavigationBar: bottomBar,
        resizeToAvoidBottomInset: true,
        onDrawerChanged: (_) {},
        drawer: _buildDrawer(),
        body: SafeArea(
          child: Stack(
            children: [
              _buildBodyList(),
              _buildBottomButton(),
              _buildTitle(),
              _buildWaiter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget? _buildDrawer() {
    if (drawer == null) {
      return drawer;
    }
    return SafeArea(
      child: Drawer(
        child: drawer,
      ),
    );
  }

  Widget _buildBodyList() {
    return ColoredBox(
      color: DesignStyles.colorLight,
      child: Column(
        children: [
          const SizedBox(height: _hightUpBar),
          child ?? Container(),
          Expanded(
            child: onRefresh != null
                ? RefreshIndicator(
                    color: DesignStyles.colorDark,
                    onRefresh: onRefresh ?? () async {},
                    child: ListView(
                      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                      controller: controller,
                      children: children ?? [],
                    ),
                  )
                : ListView(
                    physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                    controller: controller,
                    children: children ?? [],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      alignment: const Alignment(0, 0),
      decoration: BoxDecoration(
        color: DesignStyles.colorDark,
        boxShadow: const [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: -2.5,
            offset: Offset(0, 3),
          )
        ],
        borderRadius: BorderRadius.circular(0),
        border: Border.all(color: DesignStyles.colorDark),
      ),
      height: _hightUpBar,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: titleActions,
      ),
    );
  }

  static const double _hightUpBar = 60;

  Widget _buildBottomButton() {
    List<Widget> children = [
      Expanded(child: Container()),
      floatingButton ?? Container(),
    ];
    if (isUpFloatingButton) {
      children.add(const SizedBox(height: _hightUpBar));
      children = children.reversed.toList();
    }
    return Column(
      children: children,
    );
  }

  Widget _buildWaiter() {
    return StreamBuilder<bool>(
      stream: streamLoadingStatus,
      builder: (context, snapshot) {
        if (snapshot.data ?? false) {
          return Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(DesignStyles.colorDark.withOpacity(0.9)),
                backgroundColor: DesignStyles.colorVariateDark.withOpacity(0.5),
                strokeWidth: 5,
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
