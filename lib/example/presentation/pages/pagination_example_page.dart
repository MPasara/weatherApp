//ignore_for_file: always_use_package_imports

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:q_architecture/q_architecture.dart';

import '../../domain/notifiers/example_pagination/example_paginated_notifier.dart';

class PaginationExamplePage extends ConsumerWidget {
  static const routeName = '/pagination-example-page';

  const PaginationExamplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagination'),
      ),
      body: PaginatedListView(
        itemBuilder: (context, word) => _PaginationExampleTile(word),
        autoDisposeStateNotifier: paginatedNotifierProvider,
        onError: (failure, listIsEmpty, onRefresh) {
          logDebug('failure occurred: $failure');
          if (listIsEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: $failure'),
                TextButton(
                  onPressed: onRefresh,
                  child: const Text('Refresh'),
                ),
              ],
            );
          }
          return null;
        },
      ),
    );
  }
}

class _PaginationExampleTile extends StatelessWidget {
  final String word;
  const _PaginationExampleTile(this.word, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Text(
        word,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
