// ignore_for_file: deprecated_member_use

import 'package:event_trace/constants/app_colors.dart';
import 'package:event_trace/controllers/category_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    void openDrawer() {
      Scaffold.of(context).openDrawer();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          onPressed: openDrawer,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text(
          'Categories',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ],
      ),
      body: Consumer<CategoryNotifier>(
        builder: (context, categoryNotifier, child) {
          return ListView.builder(
            itemCount: categoryNotifier.categoryList.length,
            reverse: true,
            itemBuilder: (context, index) {
              final category = categoryNotifier.categoryList[index];
              return GestureDetector(
                onTap: () {
                  // categoryNotifier
                },
                child: ListTile(
                  contentPadding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: Colors.white,
                  trailing: Icon(
                    Icons.more_vert,
                    color: appBlue,
                  ),
                  title: Text(
                    category.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    category.description!,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
