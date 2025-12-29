import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class AppNavigation {
  // ================= 1. Standard Navigation (No Custom Animation) =================
  static void push(BuildContext context, Widget view) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => view));
  }

  static void pushReplacement(BuildContext context, Widget view) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => view));
  }

  static void pushAndRemoveAll(BuildContext context, Widget view) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => view),
      (r) => false,
    );
  }

  // ================= 2. Shared Axis Animations (Vertical, Horizontal, Scaled) =================
  static void pushSharedAxis(
    BuildContext context,
    Widget view, {
    SharedAxisTransitionType type = SharedAxisTransitionType.vertical,
  }) {
    Navigator.push(context, _createSharedRoute(view, type));
  }

  static void pushReplacementSharedAxis(
    BuildContext context,
    Widget view, {
    SharedAxisTransitionType type = SharedAxisTransitionType.vertical,
  }) {
    Navigator.pushReplacement(context, _createSharedRoute(view, type));
  }

  static void pushAndRemoveAllSharedAxis(
    BuildContext context,
    Widget view, {
    SharedAxisTransitionType type = SharedAxisTransitionType.vertical,
  }) {
    Navigator.pushAndRemoveUntil(
      context,
      _createSharedRoute(view, type),
      (r) => false,
    );
  }

  // ================= 3. Fade Through Animations (Modern Transition) =================
  static void pushFadeThrough(BuildContext context, Widget view) {
    Navigator.push(context, _createFadeRoute(view, isScale: false));
  }

  static void pushReplacementFadeThrough(BuildContext context, Widget view) {
    Navigator.pushReplacement(context, _createFadeRoute(view, isScale: false));
  }

  static void pushAndRemoveAllFadeThrough(BuildContext context, Widget view) {
    Navigator.pushAndRemoveUntil(
      context,
      _createFadeRoute(view, isScale: false),
      (r) => false,
    );
  }

  // ================= 4. Fade Scale Animations (Zoom Fade) =================
  static void pushFadeScale(BuildContext context, Widget view) {
    Navigator.push(context, _createFadeRoute(view, isScale: true));
  }

  static void pushReplacementFadeScale(BuildContext context, Widget view) {
    Navigator.pushReplacement(context, _createFadeRoute(view, isScale: true));
  }

  static void pushAndRemoveAllFadeScale(BuildContext context, Widget view) {
    Navigator.pushAndRemoveUntil(
      context,
      _createFadeRoute(view, isScale: true),
      (r) => false,
    );
  }

  // ================= 5. Utility =================
  static void pop(BuildContext context) {
    if (Navigator.canPop(context)) Navigator.pop(context);
  }

  // ---------------- Helper Methods ----------------

  static Route _createSharedRoute(Widget view, SharedAxisTransitionType type) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) => view,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: type,
          child: child,
        );
      },
    );
  }

  static Route _createFadeRoute(Widget view, {required bool isScale}) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => view,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        if (isScale) {
          return FadeScaleTransition(animation: animation, child: child);
        }
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
    );
  }
}
