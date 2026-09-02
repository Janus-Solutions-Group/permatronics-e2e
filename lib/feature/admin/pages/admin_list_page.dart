import 'package:flutter/material.dart';
import 'package:manlift_app/data/models/operator_model.dart';
import 'package:manlift_app/feature/admin/pages/add_admin_page.dart';
import 'package:manlift_app/services/operator_service.dart';
import 'package:manlift_app/util/navigate.dart';

class AdminListPage extends StatelessWidget {
  const AdminListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admins')),
      body: StreamBuilder<List<OperatorModel>>(
        stream: OperatorService().watchAdmins(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final admins = snapshot.data ?? [];
          if (admins.isEmpty) {
            return const Center(child: Text('No admins yet.'));
          }
          return ListView.builder(
            itemCount: admins.length,
            itemBuilder: (context, index) {
              final admin = admins[index];
              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.shield_outlined)),
                title: Text(admin.name),
                subtitle: Text(admin.email),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => moveTo(context, const AddAdminPage()),
        tooltip: 'Add Admin',
        child: const Icon(Icons.add),
      ),
    );
  }
}
