import "package:flutter_test/flutter_test.dart";
import "package:yata/core/contracts/realtime/realtime_manager.dart";
import "package:yata/infra/realtime/noop_realtime_manager.dart";

void main() {
  test(
    "NoopRealtimeManager stores subscriptions without remote connection",
    () async {
      final NoopRealtimeManager manager = NoopRealtimeManager();
      const RealtimeSubscriptionConfig config = RealtimeSubscriptionConfig(
        featureName: "orders",
        tableName: "orders",
      );

      await manager.startMonitoring(config, "sub-orders", (_) {});

      expect(manager.isMonitoring("sub-orders"), isTrue);
      expect(manager.getActiveSubscriptions(), <String>["sub-orders"]);
      expect(manager.getStats()["status"], "connected");
      expect(manager.getStats()["mode"], "noop-demo");

      await manager.stopMonitoring("sub-orders");
      expect(manager.isMonitoring("sub-orders"), isFalse);
    },
  );
}
