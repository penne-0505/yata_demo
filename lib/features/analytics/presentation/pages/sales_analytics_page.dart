import "dart:math" as math;

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

import "../../../../shared/components/components.dart";
import "../../../../shared/foundations/tokens/color_tokens.dart";
import "../../../../shared/foundations/tokens/radius_tokens.dart";
import "../../../../shared/foundations/tokens/spacing_tokens.dart";
import "../../../../shared/foundations/tokens/typography_tokens.dart";
import "../../../../shared/patterns/patterns.dart";
import "../../../settings/presentation/pages/settings_page.dart";

/// 売上分析画面のプレビュー実装。
class SalesAnalyticsPage extends ConsumerWidget {
  /// [SalesAnalyticsPage]を生成する。
  const SalesAnalyticsPage({super.key});

  /// 売上分析画面のルート名。
  static const String routeName = "/analytics";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: YataColorTokens.background,
      appBar: YataAppTopBar(
        navItems: <YataNavItem>[
          YataNavItem(
            label: "注文",
            icon: Icons.shopping_cart_outlined,
            onTap: () => context.go("/order"),
          ),
          YataNavItem(
            label: "注文状況",
            icon: Icons.dashboard_customize_outlined,
            onTap: () => context.go("/order-status"),
          ),
          YataNavItem(
            label: "履歴",
            icon: Icons.receipt_long_outlined,
            onTap: () => context.go("/history"),
          ),
          YataNavItem(
            label: "在庫管理",
            icon: Icons.inventory_2_outlined,
            onTap: () => context.go("/inventory"),
          ),
          YataNavItem(
            label: "メニュー管理",
            icon: Icons.restaurant_menu_outlined,
            onTap: () => context.go("/menu"),
          ),
          const YataNavItem(
            label: "売上分析",
            icon: Icons.query_stats_outlined,
            isActive: true,
          ),
        ],
        trailing: <Widget>[
          YataIconButton(
            icon: Icons.refresh,
            tooltip: "売上データを再取得",
            onPressed: () => _showPreviewRefreshMessage(context),
          ),
          YataIconButton(
            icon: Icons.settings,
            onPressed: () => context.go(SettingsPage.routeName),
            tooltip: "設定",
          ),
        ],
      ),
      body: YataPageContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: YataSpacingTokens.lg),
            Text(
              "売上分析",
              style:
                  (textTheme.headlineMedium ??
                          YataTypographyTokens.headlineMedium)
                      .copyWith(
                        color: YataColorTokens.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
            ),
            const SizedBox(height: YataSpacingTokens.sm),
            Text(
              "本日の売上推移、カテゴリ構成、ピーク時間帯をまとめて確認できます。",
              style: (textTheme.bodyMedium ?? YataTypographyTokens.bodyMedium)
                  .copyWith(color: YataColorTokens.textSecondary),
            ),
            const SizedBox(height: YataSpacingTokens.xl),
            const _SalesMetricGrid(metrics: _salesMetrics),
            const SizedBox(height: YataSpacingTokens.xl),
            const YataSectionCard(
              title: "売上トレンド",
              subtitle: "直近7日の売上実績と目標ライン",
              actions: <Widget>[
                YataTag(
                  label: "日次",
                  icon: Icons.today_outlined,
                  backgroundColor: YataColorTokens.primarySoft,
                  foregroundColor: YataColorTokens.primary,
                ),
                YataTag(
                  label: "直近7日",
                  icon: Icons.date_range_outlined,
                  outlined: true,
                ),
              ],
              child: _SalesTrendContent(),
            ),
            const SizedBox(height: YataSpacingTokens.lg),
            const YataSectionCard(
              title: "カテゴリ別売上",
              subtitle: "売上構成、メニュー別の貢献度、上位メニュー",
              child: _CategorySalesContent(),
            ),
            const SizedBox(height: YataSpacingTokens.lg),
            const YataSectionCard(
              title: "時間帯分析",
              subtitle: "売上ピークと当日の分析結果",
              child: _HourlyAnalysisContent(),
            ),
            const SizedBox(height: YataSpacingTokens.xl),
          ],
        ),
      ),
    );
  }

  /// プレビュー表示の更新フィードバックを通知する。
  void _showPreviewRefreshMessage(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("売上分析を更新しました。")));
  }
}

class _SalesMetric {
  const _SalesMetric({
    required this.title,
    required this.value,
    required this.trend,
    required this.trendLabel,
    required this.indicatorColor,
  });

  final String title;
  final String value;
  final YataStatTrend trend;
  final String trendLabel;
  final Color indicatorColor;
}

class _DailySalesPoint {
  const _DailySalesPoint({
    required this.label,
    required this.revenue,
    required this.target,
  });

  final String label;
  final int revenue;
  final int target;
}

class _CategoryShare {
  const _CategoryShare({
    required this.label,
    required this.amount,
    required this.percent,
    required this.color,
  });

  final String label;
  final String amount;
  final double percent;
  final Color color;
}

class _TopMenuResult {
  const _TopMenuResult({
    required this.name,
    required this.sales,
    required this.detail,
    required this.progress,
    required this.color,
  });

  final String name;
  final String sales;
  final String detail;
  final double progress;
  final Color color;
}

class _HourlySalesSlot {
  const _HourlySalesSlot({
    required this.label,
    required this.amount,
    required this.orders,
    required this.ratio,
    required this.color,
  });

  final String label;
  final String amount;
  final String orders;
  final double ratio;
  final Color color;
}

class _InsightItem {
  const _InsightItem({
    required this.title,
    required this.body,
    required this.icon,
    required this.color,
  });

  final String title;
  final String body;
  final IconData icon;
  final Color color;
}

const List<_SalesMetric> _salesMetrics = <_SalesMetric>[
  _SalesMetric(
    title: "本日の売上",
    value: "¥148,200",
    trend: YataStatTrend.up,
    trendLabel: "前日比 +8.4%",
    indicatorColor: YataColorTokens.primary,
  ),
  _SalesMetric(
    title: "注文件数",
    value: "126",
    trend: YataStatTrend.up,
    trendLabel: "前日比 +14件",
    indicatorColor: YataColorTokens.info,
  ),
  _SalesMetric(
    title: "客単価",
    value: "¥1,176",
    trend: YataStatTrend.up,
    trendLabel: "前週同日比 +3.1%",
    indicatorColor: YataColorTokens.success,
  ),
  _SalesMetric(
    title: "目標達成率",
    value: "72%",
    trend: YataStatTrend.steady,
    trendLabel: "残り ¥57,800",
    indicatorColor: YataColorTokens.warning,
  ),
];

const List<_DailySalesPoint> _dailySales = <_DailySalesPoint>[
  _DailySalesPoint(label: "月", revenue: 98000, target: 110000),
  _DailySalesPoint(label: "火", revenue: 116000, target: 112000),
  _DailySalesPoint(label: "水", revenue: 108000, target: 114000),
  _DailySalesPoint(label: "木", revenue: 132000, target: 118000),
  _DailySalesPoint(label: "金", revenue: 156000, target: 125000),
  _DailySalesPoint(label: "土", revenue: 171000, target: 142000),
  _DailySalesPoint(label: "日", revenue: 148200, target: 136000),
];

const List<_CategoryShare> _categoryShares = <_CategoryShare>[
  _CategoryShare(
    label: "主菜",
    amount: "¥80,200",
    percent: 54,
    color: YataColorTokens.primary,
  ),
  _CategoryShare(
    label: "汁物・副菜",
    amount: "¥31,400",
    percent: 21,
    color: YataColorTokens.success,
  ),
  _CategoryShare(
    label: "ドリンク",
    amount: "¥24,600",
    percent: 17,
    color: YataColorTokens.info,
  ),
  _CategoryShare(
    label: "セット追加",
    amount: "¥12,000",
    percent: 8,
    color: YataColorTokens.warning,
  ),
];

const List<_TopMenuResult> _topMenus = <_TopMenuResult>[
  _TopMenuResult(
    name: "屋台焼きそば",
    sales: "¥46,200",
    detail: "66食 / 構成比 31%",
    progress: 0.31,
    color: YataColorTokens.primary,
  ),
  _TopMenuResult(
    name: "唐揚げ弁当",
    sales: "¥39,650",
    detail: "61食 / 構成比 27%",
    progress: 0.27,
    color: YataColorTokens.success,
  ),
  _TopMenuResult(
    name: "豚汁",
    sales: "¥24,320",
    detail: "64杯 / 構成比 16%",
    progress: 0.16,
    color: YataColorTokens.info,
  ),
  _TopMenuResult(
    name: "緑茶",
    sales: "¥12,800",
    detail: "64本 / 構成比 9%",
    progress: 0.09,
    color: YataColorTokens.warning,
  ),
];

const List<_HourlySalesSlot> _hourlySlots = <_HourlySalesSlot>[
  _HourlySalesSlot(
    label: "11-13時",
    amount: "¥34,800",
    orders: "34件",
    ratio: 0.62,
    color: YataColorTokens.info,
  ),
  _HourlySalesSlot(
    label: "13-15時",
    amount: "¥19,600",
    orders: "21件",
    ratio: 0.35,
    color: YataColorTokens.success,
  ),
  _HourlySalesSlot(
    label: "15-17時",
    amount: "¥16,900",
    orders: "17件",
    ratio: 0.30,
    color: YataColorTokens.warning,
  ),
  _HourlySalesSlot(
    label: "17-19時",
    amount: "¥55,400",
    orders: "39件",
    ratio: 1,
    color: YataColorTokens.primary,
  ),
  _HourlySalesSlot(
    label: "19-21時",
    amount: "¥21,500",
    orders: "15件",
    ratio: 0.39,
    color: YataColorTokens.info,
  ),
];

const List<_InsightItem> _insights = <_InsightItem>[
  _InsightItem(
    title: "18時台に売上ピーク",
    body: "夜帯だけで日商の38%を構成。主菜とドリンクの同時購入が伸びています。",
    icon: Icons.bolt_outlined,
    color: YataColorTokens.primary,
  ),
  _InsightItem(
    title: "昼帯は唐揚げ弁当が牽引",
    body: "12時台は客単価より回転数が強い傾向。主菜の在庫厚めが効いています。",
    icon: Icons.lunch_dining_outlined,
    color: YataColorTokens.success,
  ),
  _InsightItem(
    title: "豚汁のセット率が上昇",
    body: "夜帯のサイド追加率が前週比 +6pt。主菜横のおすすめ枠と相性良好です。",
    icon: Icons.trending_up_outlined,
    color: YataColorTokens.info,
  ),
];

class _SalesMetricGrid extends StatelessWidget {
  const _SalesMetricGrid({required this.metrics});

  final List<_SalesMetric> metrics;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxWidth = constraints.maxWidth;
        final int columns = maxWidth >= 1100
            ? 4
            : maxWidth >= 720
            ? 2
            : 1;
        final double gap = YataSpacingTokens.lg;
        final double rawWidth = columns == 1
            ? maxWidth
            : (maxWidth - gap * (columns - 1)) / columns;
        final double cardWidth = rawWidth.clamp(220.0, maxWidth).toDouble();

        return Wrap(
          spacing: gap,
          runSpacing: YataSpacingTokens.lg,
          children: metrics
              .map(
                (_SalesMetric metric) => SizedBox(
                  width: cardWidth,
                  child: YataStatCard(
                    title: metric.title,
                    value: metric.value,
                    trend: metric.trend,
                    trendLabel: metric.trendLabel,
                    indicatorColor: metric.indicatorColor,
                    indicatorLabel: metric.title,
                  ),
                ),
              )
              .toList(growable: false),
        );
      },
    );
  }
}

class _SalesTrendContent extends StatelessWidget {
  const _SalesTrendContent();

  @override
  Widget build(BuildContext context) => const Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      _SalesTrendChart(points: _dailySales),
      SizedBox(height: YataSpacingTokens.md),
      _LegendRow(
        items: <_LegendItem>[
          _LegendItem(label: "売上実績", color: YataColorTokens.primary),
          _LegendItem(label: "目標", color: YataColorTokens.info),
        ],
      ),
      SizedBox(height: YataSpacingTokens.md),
      _MiniSummaryStrip(
        items: <_MiniSummaryItem>[
          _MiniSummaryItem(label: "週累計", value: "¥929,200"),
          _MiniSummaryItem(label: "平均日商", value: "¥132,743"),
          _MiniSummaryItem(label: "最高売上", value: "土曜 ¥171,000"),
        ],
      ),
    ],
  );
}

class _SalesTrendChart extends StatelessWidget {
  const _SalesTrendChart({required this.points});

  final List<_DailySalesPoint> points;

  @override
  Widget build(BuildContext context) {
    final TextStyle labelStyle =
        Theme.of(context).textTheme.bodySmall ?? YataTypographyTokens.bodySmall;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: YataColorTokens.surfaceAlt,
        borderRadius: const BorderRadius.all(
          Radius.circular(YataRadiusTokens.large),
        ),
        border: Border.all(color: YataColorTokens.border),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          YataSpacingTokens.lg,
          YataSpacingTokens.lg,
          YataSpacingTokens.lg,
          YataSpacingTokens.md,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 220,
              child: CustomPaint(
                painter: _SalesTrendChartPainter(points: points),
                child: const SizedBox.expand(),
              ),
            ),
            const SizedBox(height: YataSpacingTokens.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: points
                  .map(
                    (_DailySalesPoint point) => Text(
                      point.label,
                      style: labelStyle.copyWith(
                        color: YataColorTokens.textSecondary,
                      ),
                    ),
                  )
                  .toList(growable: false),
            ),
          ],
        ),
      ),
    );
  }
}

class _SalesTrendChartPainter extends CustomPainter {
  const _SalesTrendChartPainter({required this.points});

  static const double _chartMax = 180000;

  final List<_DailySalesPoint> points;

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) {
      return;
    }

    final Rect chartRect = Rect.fromLTWH(0, 8, size.width, size.height - 20);
    final Paint gridPaint = Paint()
      ..color = YataColorTokens.neutral200
      ..strokeWidth = 1;
    final Paint targetPaint = Paint()
      ..color = YataColorTokens.info.withValues(alpha: 0.75)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final Paint actualPaint = Paint()
      ..color = YataColorTokens.primary
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final Paint areaPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          YataColorTokens.primary.withValues(alpha: 0.18),
          YataColorTokens.primary.withValues(alpha: 0.02),
        ],
      ).createShader(chartRect);

    for (int index = 0; index < 5; index++) {
      final double y = chartRect.top + chartRect.height * index / 4;
      canvas.drawLine(
        Offset(chartRect.left, y),
        Offset(chartRect.right, y),
        gridPaint,
      );
    }

    final Path actualPath = Path();
    final Path areaPath = Path();
    final List<Offset> actualPoints = <Offset>[];
    final List<Offset> targetPoints = <Offset>[];

    for (int index = 0; index < points.length; index++) {
      actualPoints.add(_offsetFor(points[index].revenue, index, chartRect));
      targetPoints.add(_offsetFor(points[index].target, index, chartRect));
    }

    for (int index = 0; index < actualPoints.length; index++) {
      final Offset point = actualPoints[index];
      if (index == 0) {
        actualPath.moveTo(point.dx, point.dy);
        areaPath
          ..moveTo(point.dx, chartRect.bottom)
          ..lineTo(point.dx, point.dy);
      } else {
        actualPath.lineTo(point.dx, point.dy);
        areaPath.lineTo(point.dx, point.dy);
      }
    }

    areaPath
      ..lineTo(actualPoints.last.dx, chartRect.bottom)
      ..close();
    canvas.drawPath(areaPath, areaPaint);
    canvas.drawPath(actualPath, actualPaint);

    for (int index = 0; index < targetPoints.length - 1; index++) {
      _drawDashedLine(
        canvas,
        targetPoints[index],
        targetPoints[index + 1],
        targetPaint,
      );
    }

    final Paint actualDotPaint = Paint()..color = YataColorTokens.primary;
    final Paint targetDotPaint = Paint()..color = YataColorTokens.info;
    final Paint surfacePaint = Paint()..color = YataColorTokens.surface;

    for (final Offset point in actualPoints) {
      canvas
        ..drawCircle(point, 5, surfacePaint)
        ..drawCircle(point, 3.5, actualDotPaint);
    }

    for (final Offset point in targetPoints) {
      canvas.drawCircle(point, 3, targetDotPaint);
    }
  }

  Offset _offsetFor(int value, int index, Rect chartRect) {
    final double x = points.length == 1
        ? chartRect.center.dx
        : chartRect.left + chartRect.width * index / (points.length - 1);
    final double normalizedValue = (value / _chartMax).clamp(0, 1).toDouble();
    final double y = chartRect.bottom - chartRect.height * normalizedValue;
    return Offset(x, y);
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    const double dashWidth = 8;
    const double dashGap = 6;
    final double distance = (end - start).distance;
    if (distance == 0) {
      return;
    }

    final Offset direction = (end - start) / distance;
    double drawn = 0;
    while (drawn < distance) {
      final double segmentEnd = math.min(drawn + dashWidth, distance);
      canvas.drawLine(
        start + direction * drawn,
        start + direction * segmentEnd,
        paint,
      );
      drawn += dashWidth + dashGap;
    }
  }

  @override
  bool shouldRepaint(covariant _SalesTrendChartPainter oldDelegate) =>
      oldDelegate.points != points;
}

class _LegendRow extends StatelessWidget {
  const _LegendRow({required this.items});

  final List<_LegendItem> items;

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: YataSpacingTokens.lg,
    runSpacing: YataSpacingTokens.sm,
    children: items
        .map(
          (_LegendItem item) => Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: item.color,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(YataRadiusTokens.small),
                  ),
                ),
              ),
              const SizedBox(width: YataSpacingTokens.xs),
              Text(
                item.label,
                style:
                    Theme.of(context).textTheme.bodySmall ??
                    YataTypographyTokens.bodySmall,
              ),
            ],
          ),
        )
        .toList(growable: false),
  );
}

class _LegendItem {
  const _LegendItem({required this.label, required this.color});

  final String label;
  final Color color;
}

class _MiniSummaryStrip extends StatelessWidget {
  const _MiniSummaryStrip({required this.items});

  final List<_MiniSummaryItem> items;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: YataSpacingTokens.md,
      runSpacing: YataSpacingTokens.sm,
      children: items
          .map((_MiniSummaryItem item) => _MiniSummaryPill(item: item))
          .toList(growable: false),
    );
  }
}

class _MiniSummaryItem {
  const _MiniSummaryItem({required this.label, required this.value});

  final String label;
  final String value;
}

class _MiniSummaryPill extends StatelessWidget {
  const _MiniSummaryPill({required this.item});

  final _MiniSummaryItem item;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: YataSpacingTokens.md,
        vertical: YataSpacingTokens.sm,
      ),
      decoration: BoxDecoration(
        color: YataColorTokens.neutral100,
        borderRadius: const BorderRadius.all(
          Radius.circular(YataRadiusTokens.medium),
        ),
        border: Border.all(color: YataColorTokens.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            item.label,
            style: (textTheme.bodySmall ?? YataTypographyTokens.bodySmall)
                .copyWith(color: YataColorTokens.textSecondary),
          ),
          const SizedBox(width: YataSpacingTokens.sm),
          Text(
            item.value,
            style: textTheme.titleSmall ?? YataTypographyTokens.titleSmall,
          ),
        ],
      ),
    );
  }
}

class _CategorySalesContent extends StatelessWidget {
  const _CategorySalesContent();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool isWide = constraints.maxWidth >= 980;
        final Widget chart = const SizedBox(
          width: 240,
          child: _CategoryDonut(),
        );
        final Widget legend = const _CategoryLegendList(
          shares: _categoryShares,
        );
        final Widget ranking = const _TopMenuRanking(results: _topMenus);

        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              chart,
              const SizedBox(width: YataSpacingTokens.lg),
              Expanded(child: legend),
              const SizedBox(width: YataSpacingTokens.lg),
              Expanded(child: ranking),
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(alignment: Alignment.centerLeft, child: chart),
            const SizedBox(height: YataSpacingTokens.lg),
            legend,
            const SizedBox(height: YataSpacingTokens.lg),
            ranking,
          ],
        );
      },
    );
  }
}

class _CategoryDonut extends StatelessWidget {
  const _CategoryDonut();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox.square(
      dimension: 220,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CustomPaint(
            painter: const _DonutChartPainter(shares: _categoryShares),
            child: const SizedBox.expand(),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "¥148,200",
                style:
                    textTheme.headlineMedium ??
                    YataTypographyTokens.headlineMedium,
              ),
              const SizedBox(height: YataSpacingTokens.xs),
              Text(
                "本日売上",
                style: (textTheme.bodySmall ?? YataTypographyTokens.bodySmall)
                    .copyWith(color: YataColorTokens.textSecondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DonutChartPainter extends CustomPainter {
  const _DonutChartPainter({required this.shares});

  final List<_CategoryShare> shares;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    const double strokeWidth = 26;
    final double radius =
        math.min(size.width, size.height) / 2 - strokeWidth / 2;
    final Rect rect = Rect.fromCircle(center: center, radius: radius);
    final Paint basePaint = Paint()
      ..color = YataColorTokens.neutral200
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    final Paint segmentPaint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawArc(rect, 0, math.pi * 2, false, basePaint);

    double startAngle = -math.pi / 2;
    for (final _CategoryShare share in shares) {
      final double sweepAngle = math.pi * 2 * share.percent / 100;
      segmentPaint.color = share.color;
      canvas.drawArc(rect, startAngle, sweepAngle, false, segmentPaint);
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant _DonutChartPainter oldDelegate) =>
      oldDelegate.shares != shares;
}

class _CategoryLegendList extends StatelessWidget {
  const _CategoryLegendList({required this.shares});

  final List<_CategoryShare> shares;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "売上構成",
          style: textTheme.titleMedium ?? YataTypographyTokens.titleMedium,
        ),
        const SizedBox(height: YataSpacingTokens.md),
        for (int index = 0; index < shares.length; index++) ...<Widget>[
          _CategoryShareRow(share: shares[index]),
          if (index != shares.length - 1)
            const SizedBox(height: YataSpacingTokens.md),
        ],
      ],
    );
  }
}

class _CategoryShareRow extends StatelessWidget {
  const _CategoryShareRow({required this.share});

  final _CategoryShare share;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: share.color,
                borderRadius: const BorderRadius.all(
                  Radius.circular(YataRadiusTokens.small),
                ),
              ),
            ),
            const SizedBox(width: YataSpacingTokens.sm),
            Expanded(child: Text(share.label, style: textTheme.titleSmall)),
            Text(
              share.amount,
              style: (textTheme.bodyMedium ?? YataTypographyTokens.bodyMedium)
                  .copyWith(color: YataColorTokens.textSecondary),
            ),
            const SizedBox(width: YataSpacingTokens.sm),
            Text(
              "${share.percent.toStringAsFixed(0)}%",
              style: textTheme.titleSmall ?? YataTypographyTokens.titleSmall,
            ),
          ],
        ),
        const SizedBox(height: YataSpacingTokens.xs),
        YataProgressBar(progress: share.percent / 100, color: share.color),
      ],
    );
  }
}

class _TopMenuRanking extends StatelessWidget {
  const _TopMenuRanking({required this.results});

  final List<_TopMenuResult> results;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "上位メニュー",
          style: textTheme.titleMedium ?? YataTypographyTokens.titleMedium,
        ),
        const SizedBox(height: YataSpacingTokens.md),
        DecoratedBox(
          decoration: BoxDecoration(
            color: YataColorTokens.surfaceAlt,
            borderRadius: const BorderRadius.all(
              Radius.circular(YataRadiusTokens.medium),
            ),
            border: Border.all(color: YataColorTokens.border),
          ),
          child: Column(
            children: <Widget>[
              for (int index = 0; index < results.length; index++)
                _TopMenuTile(
                  result: results[index],
                  rank: index + 1,
                  showDivider: index != results.length - 1,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TopMenuTile extends StatelessWidget {
  const _TopMenuTile({
    required this.result,
    required this.rank,
    required this.showDivider,
  });

  final _TopMenuResult result;
  final int rank;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: YataSpacingTokens.lg,
            vertical: YataSpacingTokens.md,
          ),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 16,
                backgroundColor: result.color.withValues(alpha: 0.12),
                child: Text(
                  "$rank",
                  style:
                      (textTheme.labelLarge ?? YataTypographyTokens.labelLarge)
                          .copyWith(color: result.color),
                ),
              ),
              const SizedBox(width: YataSpacingTokens.lg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      result.name,
                      style:
                          textTheme.titleSmall ??
                          YataTypographyTokens.titleSmall,
                    ),
                    const SizedBox(height: YataSpacingTokens.xs),
                    Text(
                      result.detail,
                      style:
                          (textTheme.bodySmall ??
                                  YataTypographyTokens.bodySmall)
                              .copyWith(color: YataColorTokens.textSecondary),
                    ),
                  ],
                ),
              ),
              Text(
                result.sales,
                style: textTheme.titleSmall ?? YataTypographyTokens.titleSmall,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            56,
            0,
            YataSpacingTokens.lg,
            YataSpacingTokens.md,
          ),
          child: YataProgressBar(
            progress: result.progress,
            color: result.color,
          ),
        ),
        if (showDivider)
          Divider(height: 1, thickness: 1, color: YataColorTokens.border),
      ],
    );
  }
}

class _HourlyAnalysisContent extends StatelessWidget {
  const _HourlyAnalysisContent();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool isWide = constraints.maxWidth >= 900;
        final Widget bars = const _HourlySalesBars(slots: _hourlySlots);
        final Widget insights = const _InsightList(items: _insights);

        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(flex: 3, child: bars),
              const SizedBox(width: YataSpacingTokens.lg),
              Expanded(flex: 2, child: insights),
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            bars,
            const SizedBox(height: YataSpacingTokens.lg),
            insights,
          ],
        );
      },
    );
  }
}

class _HourlySalesBars extends StatelessWidget {
  const _HourlySalesBars({required this.slots});

  final List<_HourlySalesSlot> slots;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                "時間帯別売上",
                style:
                    textTheme.titleMedium ?? YataTypographyTokens.titleMedium,
              ),
            ),
            const YataStatusBadge(
              label: "18時台が最大",
              type: YataStatusBadgeType.info,
              icon: Icons.schedule_outlined,
            ),
          ],
        ),
        const SizedBox(height: YataSpacingTokens.md),
        for (int index = 0; index < slots.length; index++) ...<Widget>[
          _HourlyBarRow(slot: slots[index]),
          if (index != slots.length - 1)
            const SizedBox(height: YataSpacingTokens.md),
        ],
      ],
    );
  }
}

class _HourlyBarRow extends StatelessWidget {
  const _HourlyBarRow({required this.slot});

  final _HourlySalesSlot slot;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle labelStyle =
        textTheme.bodySmall ?? YataTypographyTokens.bodySmall;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 66,
          child: Text(
            slot.label,
            style: labelStyle.copyWith(color: YataColorTokens.textSecondary),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(YataRadiusTokens.medium),
            ),
            child: Container(
              height: 18,
              decoration: BoxDecoration(color: YataColorTokens.neutral100),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: slot.ratio,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: slot.color),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: YataSpacingTokens.md),
        SizedBox(
          width: 82,
          child: Text(
            slot.amount,
            textAlign: TextAlign.right,
            style: textTheme.titleSmall ?? YataTypographyTokens.titleSmall,
          ),
        ),
        const SizedBox(width: YataSpacingTokens.sm),
        SizedBox(
          width: 38,
          child: Text(
            slot.orders,
            textAlign: TextAlign.right,
            style: labelStyle.copyWith(color: YataColorTokens.textSecondary),
          ),
        ),
      ],
    );
  }
}

class _InsightList extends StatelessWidget {
  const _InsightList({required this.items});

  final List<_InsightItem> items;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "分析結果",
          style: textTheme.titleMedium ?? YataTypographyTokens.titleMedium,
        ),
        const SizedBox(height: YataSpacingTokens.md),
        for (int index = 0; index < items.length; index++) ...<Widget>[
          _InsightTile(item: items[index]),
          if (index != items.length - 1)
            const SizedBox(height: YataSpacingTokens.sm),
        ],
      ],
    );
  }
}

class _InsightTile extends StatelessWidget {
  const _InsightTile({required this.item});

  final _InsightItem item;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(YataSpacingTokens.md),
      decoration: BoxDecoration(
        color: item.color.withValues(alpha: 0.08),
        borderRadius: const BorderRadius.all(
          Radius.circular(YataRadiusTokens.medium),
        ),
        border: Border.all(color: item.color.withValues(alpha: 0.28)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(item.icon, color: item.color, size: 22),
          const SizedBox(width: YataSpacingTokens.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.title,
                  style:
                      textTheme.titleSmall ?? YataTypographyTokens.titleSmall,
                ),
                const SizedBox(height: YataSpacingTokens.xs),
                Text(
                  item.body,
                  style: (textTheme.bodySmall ?? YataTypographyTokens.bodySmall)
                      .copyWith(color: YataColorTokens.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
