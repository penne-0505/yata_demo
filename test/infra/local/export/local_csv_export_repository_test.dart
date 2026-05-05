import "package:drift/native.dart";
import "package:flutter_test/flutter_test.dart";
import "package:yata/core/contracts/export/export_contracts.dart";
import "package:yata/core/contracts/export/export_job_contracts.dart";
import "package:yata/infra/local/database/yata_demo_database.dart";
import "package:yata/infra/local/demo/demo_seed_service.dart";
import "package:yata/infra/local/export/local_csv_export_jobs_repository.dart";
import "package:yata/infra/local/export/local_csv_export_repository.dart";

void main() {
  late YataDemoDatabase database;
  late LocalCsvExportRepository repository;

  setUp(() async {
    database = YataDemoDatabase(NativeDatabase.memory());
    repository = LocalCsvExportRepository(database: database);
    await DemoSeedService(
      database: database,
      clock: () => DateTime(2026, 5, 6, 9),
    ).ensureSeeded();
  });

  tearDown(() async {
    await database.close();
  });

  test("exports local sales line items as CSV", () async {
    final CsvExportRawResult result = await repository.export(
      CsvExportRequest(
        dataset: CsvExportDataset.salesLineItems,
        dateFrom: DateTime(2026, 5, 5),
        dateTo: DateTime(2026, 5, 6),
        organizationId: "demo-org",
        locationId: "demo-location",
      ),
    );

    expect(result.rowCount, 6);
    expect(result.fileName, "sales_line_items_20260505_20260506.csv");
    expect(result.csvContent, contains("order_id,order_number,ordered_at"));
    expect(result.csvContent, contains("order-demo-1001,D-1001"));
    expect(result.csvContent, contains("屋台焼きそば"));
  });

  test("exports menu engineering daily summary as CSV", () async {
    final CsvExportRawResult result = await repository.export(
      CsvExportRequest(
        dataset: CsvExportDataset.menuEngineeringDaily,
        dateFrom: DateTime(2026, 5, 6),
        dateTo: DateTime(2026, 5, 6),
        organizationId: "demo-org",
        locationId: "demo-location",
      ),
    );

    expect(result.rowCount, 1);
    expect(result.csvContent, contains("summary_date,total_orders"));
    expect(result.csvContent, isNot(contains("summary-today")));
    expect(result.csvContent, contains("1230"));
  });

  test("local export jobs repository records rate-limit counts", () async {
    final LocalCsvExportJobsRepository jobs = LocalCsvExportJobsRepository();
    final DateTime loggedAt = DateTime.utc(2026, 5, 6, 1);

    await jobs.insertJob(
      CsvExportJobLogEntry(
        status: CsvExportJobStatus.completed,
        dataset: CsvExportDataset.salesLineItems,
        periodFrom: DateTime(2026, 5, 6),
        periodTo: DateTime(2026, 5, 6),
        loggedAt: loggedAt,
        organizationId: "demo-org",
        locationId: "demo-location",
        rowCount: 3,
      ),
    );

    expect(
      await jobs.countDailyExports(
        organizationId: "demo-org",
        from: DateTime.utc(2026, 5, 6),
        to: DateTime.utc(2026, 5, 7),
      ),
      1,
    );
    expect(await jobs.hasActiveJob("demo-org"), isFalse);
  });
}
