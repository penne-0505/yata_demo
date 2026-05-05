import "../../../core/contracts/export/export_job_contracts.dart";
import "../../../core/contracts/repositories/export/csv_export_jobs_repository_contract.dart";

class LocalCsvExportJobsRepository implements CsvExportJobsRepositoryContract {
  final List<CsvExportJobRecord> _records = <CsvExportJobRecord>[];
  int _sequence = 0;

  @override
  Future<void> insertJob(CsvExportJobLogEntry entry) async {
    final DateTime loggedAt = entry.loggedAt;
    final String id =
        "local-export-${loggedAt.microsecondsSinceEpoch}-${_sequence++}";
    _records.add(
      CsvExportJobRecord(
        id: id,
        dataset: entry.dataset,
        status: entry.status,
        requestedAt: loggedAt,
        periodFrom: entry.periodFrom,
        periodTo: entry.periodTo,
        organizationId: entry.organizationId,
        locationId: entry.locationId,
        requestedBy: entry.requestedBy,
        rowCount: entry.rowCount,
        durationMs: entry.duration?.inMilliseconds,
        metadata: entry.metadata,
        generatedByAppVersion: entry.metadata?["generated_by_app_version"]
            ?.toString(),
        sourceViewVersion: entry.metadata?["source_view_version"]?.toString(),
      ),
    );
  }

  @override
  Future<int> countDailyExports({
    required String organizationId,
    required DateTime from,
    required DateTime to,
  }) async {
    return _records
        .where(
          (CsvExportJobRecord record) =>
              record.organizationId == organizationId &&
              !record.requestedAt.isBefore(from) &&
              record.requestedAt.isBefore(to),
        )
        .length;
  }

  @override
  Future<bool> hasActiveJob(
    String organizationId, {
    Duration lookback = const Duration(minutes: 10),
  }) async {
    final DateTime threshold = DateTime.now().subtract(lookback);
    return _records.any(
      (CsvExportJobRecord record) =>
          record.organizationId == organizationId &&
          record.status.isInProgress &&
          !record.requestedAt.isBefore(threshold),
    );
  }

  @override
  Future<CsvExportJobRecord?> findJobById(String jobId) async {
    for (final CsvExportJobRecord record in _records) {
      if (record.id == jobId) {
        return record;
      }
    }
    return null;
  }
}
