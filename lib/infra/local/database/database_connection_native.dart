import "package:drift/drift.dart";
import "package:drift_flutter/drift_flutter.dart";

QueryExecutor createDatabaseConnection() {
  return driftDatabase(name: "yata_demo");
}
