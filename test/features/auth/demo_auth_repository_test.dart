import "package:flutter_test/flutter_test.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:yata/app/wiring/override_demo.dart";
import "package:yata/features/auth/presentation/providers/auth_providers.dart";
import "package:yata/features/auth/repositories/demo_auth_repository.dart";

void main() {
  test("demo overrides restore demo-user as the authenticated user", () async {
    final ProviderContainer container = ProviderContainer(
      overrides: buildDemoOverrides(),
    );
    addTearDown(container.dispose);

    container.read(authStateNotifierProvider);

    await Future<void>.delayed(Duration.zero);
    await Future<void>.delayed(Duration.zero);

    final String? currentUserId = container.read(currentUserIdProvider);
    final authState = container.read(authStateNotifierProvider);

    expect(authState.isAuthenticated, isTrue);
    expect(currentUserId, DemoAuthRepository.demoUserId);
    expect(authState.user?.email, DemoAuthRepository.demoEmail);
  });
}
