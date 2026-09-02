import 'package:flutter/material.dart';
import 'package:manlift_app/data/models/operator_model.dart';
import 'package:manlift_app/feature/admin/pages/add_edit_operator_page.dart';
import 'package:manlift_app/services/operator_service.dart';
import 'package:manlift_app/util/navigate.dart';

class OperatorListPage extends StatelessWidget {
  const OperatorListPage({super.key});

  Future<void> _confirmDelete(
      BuildContext context, OperatorModel operatorItem) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Operator'),
        content: Text('Remove ${operatorItem.name} (${operatorItem.email})? '
            'This immediately blocks their access to the app.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await OperatorService().deleteOperator(operatorItem.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    final service = OperatorService();
    return Scaffold(
      appBar: AppBar(title: const Text('Operators')),
      body: StreamBuilder<List<OperatorModel>>(
        stream: service.watchOperators(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final operators = snapshot.data ?? [];
          if (operators.isEmpty) {
            return const Center(child: Text('No operators yet.'));
          }
          return ListView.builder(
            itemCount: operators.length,
            itemBuilder: (context, index) {
              final operatorItem = operators[index];
              final isPending = operatorItem.status == OperatorStatus.pending;
              return ListTile(
                title: Text(operatorItem.name),
                subtitle: Text(operatorItem.email),
                leading: Chip(
                  label: Text(isPending ? 'Pending' : 'Approved'),
                  backgroundColor:
                      isPending ? Colors.orange.shade100 : Colors.green.shade100,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isPending)
                      IconButton(
                        icon: const Icon(Icons.check_circle_outline,
                            color: Colors.green),
                        tooltip: 'Approve',
                        onPressed: () => service.approveOperator(operatorItem.uid),
                      ),
                    IconButton(
                      icon: const Icon(Icons.edit_outlined),
                      tooltip: 'Edit',
                      onPressed: () => moveTo(
                          context, AddEditOperatorPage(existing: operatorItem)),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      tooltip: 'Delete',
                      onPressed: () => _confirmDelete(context, operatorItem),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => moveTo(context, const AddEditOperatorPage()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
