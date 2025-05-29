import 'package:flutter/material.dart';

class GenericTable<T> extends StatelessWidget {
  final List<T> data;
  final List<DataColumn> columns;
  final List<DataCell> Function(T) rowBuilder;

  const GenericTable({
    required this.data,
    required this.columns,
    required this.rowBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: columns,
      rows: data.map((item) => DataRow(cells: rowBuilder(item))).toList(),
    );
  }
}