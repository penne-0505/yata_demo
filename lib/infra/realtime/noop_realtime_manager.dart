import "../../core/contracts/realtime/realtime_manager.dart";

class NoopRealtimeManager implements RealtimeManagerContract {
  final Map<String, RealtimeSubscriptionConfig> _subscriptions =
      <String, RealtimeSubscriptionConfig>{};

  @override
  Future<void> startMonitoring(
    RealtimeSubscriptionConfig config,
    String subscriptionId,
    RealtimeDataCallback onData,
  ) async {
    _subscriptions[subscriptionId] = config;
  }

  @override
  Future<void> stopMonitoring(String subscriptionId) async {
    _subscriptions.remove(subscriptionId);
  }

  @override
  Future<void> stopAllMonitoring() async {
    _subscriptions.clear();
  }

  @override
  bool isMonitoring(String subscriptionId) =>
      _subscriptions.containsKey(subscriptionId);

  @override
  List<String> getActiveSubscriptions() =>
      _subscriptions.keys.toList(growable: false);

  @override
  Map<String, dynamic> getStats() => <String, dynamic>{
    "status": "connected",
    "mode": "noop-demo",
    "active_subscriptions": _subscriptions.length,
    "subscriptions_by_feature": _subscriptionsByFeature(),
  };

  Map<String, int> _subscriptionsByFeature() {
    final Map<String, int> counts = <String, int>{};
    for (final RealtimeSubscriptionConfig config in _subscriptions.values) {
      counts[config.featureName] = (counts[config.featureName] ?? 0) + 1;
    }
    return counts;
  }
}
