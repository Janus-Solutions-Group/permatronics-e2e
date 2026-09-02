import 'package:flutter/material.dart';
import 'package:manlift_app/feature/Home/pages/homepage.dart';
import 'package:manlift_app/feature/admin/pages/admin_list_page.dart';
import 'package:manlift_app/feature/admin/pages/operator_list_page.dart';
import 'package:manlift_app/provider/auth_provider.dart';
import 'package:manlift_app/util/navigate.dart';
import 'package:provider/provider.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Console'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Log out',
            onPressed: () => context.read<AuthProvider>().signOut(),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 1,
            mainAxisSpacing: 20,
            childAspectRatio: 3,
            children: [
              GestureDetector(
                onTap: () => moveTo(context, const OperatorListPage()),
                child: const Card(
                  child: Center(
                    child: Text(
                      'Operators',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => moveTo(context, const AdminListPage()),
                child: const Card(
                  child: Center(
                    child: Text(
                      'Admins',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => moveTo(context, const HomePage()),
                child: const Card(
                  child: Center(
                    child: Text(
                      'Fill Inspection Form',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
