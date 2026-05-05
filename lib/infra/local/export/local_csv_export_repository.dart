import "package:csv/csv.dart";
import "package:drift/drift.dart";

import "../../../core/contracts/export/export_contracts.dart";
import "../../../core/contracts/repositories/export/csv_export_repository_contract.dart";
import "../database/yata_demo_database.dart";

class LocalCsvExportRepository implements CsvExportRepositoryContract {
  LocalCsvExportRepository({required YataDemoDatabase database})
    : _database = database;

  final YataDemoDatabase _database;

  static const String _contentType = "text/csv; charset=utf-8";
  static const String _sourceViewVersion = "local_demo_v1";

  @override
  Future<CsvExportRawResult> export(CsvExportRequest request) async {
    final _CsvDatasetResult dataset = await switch (request.dataset) {
      CsvExportDataset.salesLineItems => _salesLineItems(request),
      CsvExportDataset.purchasesLineItems => _purchaseLineItems(request),
      CsvExportDataset.inventoryTransactions => _inventoryTransactions(request),
      CsvExportDataset.wasteLog => _wasteLog(request),
      CsvExportDataset.menuEngineeringDaily => _menuEngineeringDaily(request),
    };

    final List<List<Object?>> csvRows = <List<Object?>>[
      if (request.includeHeaders) dataset.headers,
      ...dataset.rows,
    ];
    final String csvContent = const ListToCsvConverter().convert(csvRows);

    return CsvExportRawResult(
      csvContent: csvContent,
      fileName: _fileName(request),
      contentType: _contentType,
      rowCount: dataset.rows.length,
      metadata: <String, dynamic>{
        "source": "local_drift",
        "source_view_version": _sourceViewVersion,
        "dataset_id": request.dataset.id,
        "request": request.toRpcPayload(),
      },
    );
  }

  Future<_CsvDatasetResult> _salesLineItems(CsvExportRequest request) async {
    final List<QueryRow> rows = await _database.customSelect("""
SELECT
  o.id AS order_id,
  o.order_number,
  o.ordered_at,
  o.completed_at,
  o.status,
  o.payment_method,
  oi.menu_item_id,
  mi.name AS menu_item_name,
  oi.quantity,
  oi.unit_price,
  oi.subtotal,
  o.total_amount
FROM order_items oi
INNER JOIN orders o ON o.id = oi.order_id
LEFT JOIN menu_items mi ON mi.id = oi.menu_item_id
WHERE o.is_cart = 0
  AND o.ordered_at >= ?
  AND o.ordered_at <= ?
ORDER BY o.ordered_at ASC, oi.created_at ASC
""", variables: _rangeVariables(request)).get();

    const List<String> headers = <String>[
      "order_id",
      "order_number",
      "ordered_at",
      "completed_at",
      "status",
      "payment_method",
      "menu_item_id",
      "menu_item_name",
      "quantity",
      "unit_price",
      "subtotal",
      "total_amount",
    ];
    return _fromQueryRows(headers, rows);
  }

  Future<_CsvDatasetResult> _purchaseLineItems(CsvExportRequest request) async {
    final List<QueryRow> rows = await _database.customSelect("""
SELECT
  p.id AS purchase_id,
  p.purchase_date,
  pi.material_id,
  m.name AS material_name,
  pi.quantity,
  p.notes
FROM purchase_items pi
INNER JOIN purchases p ON p.id = pi.purchase_id
LEFT JOIN materials m ON m.id = pi.material_id
WHERE p.purchase_date >= ?
  AND p.purchase_date <= ?
ORDER BY p.purchase_date ASC, pi.created_at ASC
""", variables: _rangeVariables(request)).get();

    const List<String> headers = <String>[
      "purchase_id",
      "purchase_date",
      "material_id",
      "material_name",
      "quantity",
      "notes",
    ];
    return _fromQueryRows(headers, rows);
  }

  Future<_CsvDatasetResult> _inventoryTransactions(
    CsvExportRequest request,
  ) async {
    final List<QueryRow> rows = await _stockTransactionRows(request);
    const List<String> headers = <String>[
      "transaction_id",
      "created_at",
      "material_id",
      "material_name",
      "transaction_type",
      "change_amount",
      "reference_type",
      "reference_id",
      "notes",
    ];
    return _fromQueryRows(headers, rows);
  }

  Future<_CsvDatasetResult> _wasteLog(CsvExportRequest request) async {
    final List<QueryRow> rows = await _stockTransactionRows(
      request,
      transactionType: "waste",
    );
    const List<String> headers = <String>[
      "transaction_id",
      "created_at",
      "material_id",
      "material_name",
      "transaction_type",
      "change_amount",
      "reference_type",
      "reference_id",
      "notes",
    ];
    return _fromQueryRows(headers, rows);
  }

  Future<List<QueryRow>> _stockTransactionRows(
    CsvExportRequest request, {
    String? transactionType,
  }) {
    final String typeFilter = transactionType == null
        ? ""
        : "AND st.transaction_type = ?";
    return _database
        .customSelect(
          """
SELECT
  st.id AS transaction_id,
  st.created_at,
  st.material_id,
  m.name AS material_name,
  st.transaction_type,
  st.change_amount,
  st.reference_type,
  st.reference_id,
  st.notes
FROM stock_transactions st
LEFT JOIN materials m ON m.id = st.material_id
WHERE st.created_at >= ?
  AND st.created_at <= ?
  $typeFilter
ORDER BY st.created_at ASC
""",
          variables: <Variable>[
            ..._rangeVariables(request),
            if (transactionType != null) Variable<String>(transactionType),
          ],
        )
        .get();
  }

  Future<_CsvDatasetResult> _menuEngineeringDaily(
    CsvExportRequest request,
  ) async {
    final List<QueryRow> rows = await _database.customSelect("""
SELECT
  ds.summary_date,
  ds.total_orders,
  ds.completed_orders,
  ds.pending_orders,
  ds.total_revenue,
  ds.average_prep_time_minutes,
  ds.most_popular_item_id,
  mi.name AS most_popular_item_name,
  ds.most_popular_item_count
FROM daily_summaries ds
LEFT JOIN menu_items mi ON mi.id = ds.most_popular_item_id
WHERE ds.summary_date >= ?
  AND ds.summary_date <= ?
ORDER BY ds.summary_date ASC
""", variables: _rangeVariables(request)).get();

    const List<String> headers = <String>[
      "summary_date",
      "total_orders",
      "completed_orders",
      "pending_orders",
      "total_revenue",
      "average_prep_time_minutes",
      "most_popular_item_id",
      "most_popular_item_name",
      "most_popular_item_count",
    ];
    return _fromQueryRows(headers, rows);
  }

  _CsvDatasetResult _fromQueryRows(List<String> headers, List<QueryRow> rows) {
    return _CsvDatasetResult(
      headers: headers,
      rows: rows
          .map<List<Object?>>(
            (QueryRow row) => headers
                .map<Object?>((String header) => _csvValue(row.data[header]))
                .toList(growable: false),
          )
          .toList(growable: false),
    );
  }

  List<Variable> _rangeVariables(CsvExportRequest request) => <Variable>[
    Variable<String>(_startOfDay(request.dateFrom).toIso8601String()),
    Variable<String>(_endOfDay(request.dateTo).toIso8601String()),
  ];

  DateTime _startOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  DateTime _endOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day, 23, 59, 59, 999);

  Object? _csvValue(Object? value) {
    if (value is bool) {
      return value ? "true" : "false";
    }
    return value;
  }

  String _fileName(CsvExportRequest request) {
    final String from = _compactDate(request.dateFrom);
    final String to = _compactDate(request.dateTo);
    return "${request.dataset.filePrefix}_${from}_$to.csv";
  }

  String _compactDate(DateTime date) =>
      "${date.year.toString().padLeft(4, '0')}"
      "${date.month.toString().padLeft(2, '0')}"
      "${date.day.toString().padLeft(2, '0')}";
}

class _CsvDatasetResult {
  const _CsvDatasetResult({required this.headers, required this.rows});

  final List<String> headers;
  final List<List<Object?>> rows;
}
