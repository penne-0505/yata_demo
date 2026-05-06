import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../core/constants/constants.dart";
import "../shared/themes/app_theme.dart";
import "router/app_router.dart";
import "wiring/override_demo.dart";

/// YATAアプリケーションのメインクラス
class YataApp extends ConsumerWidget {
  const YataApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp.router(
    title: AppStrings.titleApp,
    theme: AppTheme.lightTheme,
    darkTheme: AppTheme.darkTheme,
    themeMode: ThemeMode.light,
    routerConfig: AppRouter.getRouter(ref),
    debugShowCheckedModeBanner: false,
    builder: (BuildContext context, Widget? child) {
      final Widget resolvedChild = child ?? const SizedBox.shrink();

      if (kIsWeb && DemoRuntimeConfig.isEnabled) {
        return _buildWebDemoFrame(context: context, child: resolvedChild);
      }

      if (kIsWeb || defaultTargetPlatform != TargetPlatform.windows) {
        return resolvedChild;
      }

      final MediaQueryData? mediaQuery = MediaQuery.maybeOf(context);
      if (mediaQuery == null) {
        return resolvedChild;
      }

      final WindowsScaleSettings settings =
          WindowsScaleSettings.fromEnvironment();
      final WindowsScaleResolution resolution = settings.resolve(
        mediaQuery.devicePixelRatio,
      );
      if (!resolution.shouldTransform) {
        return resolvedChild;
      }

      return _buildWindowsScaledChild(
        child: resolvedChild,
        mediaQuery: mediaQuery,
        resolution: resolution,
      );
    },
  );
}

Widget _buildWebDemoFrame({
  required BuildContext context,
  required Widget child,
}) {
  final MediaQueryData mediaQuery = MediaQuery.of(context);
  final Size viewport = mediaQuery.size;
  const double minContentWidth = 1240;
  const double minContentHeight = 660;
  const double maxContentWidth = 1560;
  const double outerPadding = 28;
  const double frameHeaderHeight = 48;
  const double frameRadius = 30;
  const double frameBorderWidth = 1;

  final double availableWidth = viewport.width - (outerPadding * 2);
  final double availableHeight = viewport.height - (outerPadding * 2);
  final double contentWidth = availableWidth
      .clamp(minContentWidth, maxContentWidth)
      .toDouble();
  final double contentHeight = (availableHeight - frameHeaderHeight - 24)
      .clamp(minContentHeight, double.infinity)
      .toDouble();
  final Size contentSize = Size(contentWidth, contentHeight);

  final MediaQueryData framedMediaQuery = mediaQuery.copyWith(
    size: contentSize,
    padding: EdgeInsets.zero,
    viewPadding: EdgeInsets.zero,
    viewInsets: EdgeInsets.zero,
    systemGestureInsets: EdgeInsets.zero,
  );

  return ColoredBox(
    color: const Color(0xFFE9EDF3),
    child: ScrollConfiguration(
      behavior: const _WebDemoFrameScrollBehavior(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: viewport.width,
              minHeight: viewport.height,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(outerPadding),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(frameRadius),
                    border: Border.all(
                      color: const Color(0xFFD7DEE8),
                      width: frameBorderWidth,
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 34,
                        offset: const Offset(0, 18),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      frameRadius - frameBorderWidth,
                    ),
                    child: SizedBox(
                      width: contentWidth,
                      height: contentHeight + frameHeaderHeight,
                      child: Column(
                        children: <Widget>[
                          const _WebDemoFrameHeader(),
                          Expanded(
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Color(0xFFE2E8F0)),
                                ),
                              ),
                              child: MediaQuery(
                                data: framedMediaQuery,
                                child: child,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class _WebDemoFrameHeader extends StatelessWidget {
  const _WebDemoFrameHeader();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 22),
      color: const Color(0xFFF8FAFC),
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Container(
            width: 9,
            height: 9,
            decoration: const BoxDecoration(
              color: Color(0xFF2F8F6B),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            "yata_demo",
            style: theme.textTheme.titleSmall?.copyWith(
              color: const Color(0xFF111827),
              fontWeight: FontWeight.w700,
              letterSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }
}

class _WebDemoFrameScrollBehavior extends ScrollBehavior {
  const _WebDemoFrameScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics();
}

Widget _buildWindowsScaledChild({
  required Widget child,
  required MediaQueryData mediaQuery,
  required WindowsScaleResolution resolution,
}) {
  MediaQueryData buildScaledMediaQuery(MediaQueryData data) {
    EdgeInsets scaleEdgeInsets(EdgeInsets value, double multiplier) =>
        EdgeInsets.only(
          left: value.left * multiplier,
          top: value.top * multiplier,
          right: value.right * multiplier,
          bottom: value.bottom * multiplier,
        );

    final double sizeMultiplier = resolution.logicalSizeMultiplier;

    return data.copyWith(
      size: Size(
        data.size.width * sizeMultiplier,
        data.size.height * sizeMultiplier,
      ),
      devicePixelRatio: resolution.targetDevicePixelRatio,
      padding: scaleEdgeInsets(data.padding, sizeMultiplier),
      viewInsets: scaleEdgeInsets(data.viewInsets, sizeMultiplier),
      viewPadding: scaleEdgeInsets(data.viewPadding, sizeMultiplier),
      systemGestureInsets: scaleEdgeInsets(
        data.systemGestureInsets,
        sizeMultiplier,
      ),
      textScaler: data.textScaler,
    );
  }

  return MediaQuery(
    data: buildScaledMediaQuery(mediaQuery),
    child: Transform.scale(
      scale: resolution.scaleFactor,
      alignment: Alignment.topLeft,
      child: child,
    ),
  );
}
