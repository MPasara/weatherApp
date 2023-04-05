// ignore_for_file: always_use_package_imports

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:loggy/loggy.dart';

import '../../main/app_environment.dart';

class QLogger extends StatelessWidget {
  const QLogger({Key? key}) : super(key: key);

  static void showLogger(BuildContext context) {
    if (!EnvInfo.isProduction || kDebugMode) {
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return const QLogger();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: Navigator.of(context).pop,
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
            const Expanded(child: LoggyStreamWidget()),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    color: Colors.white,
                    child: const Text('Copy log'),
                    onPressed: () async {
                      final StreamPrinter? printer =
                          Loggy.currentPrinter is StreamPrinter
                              ? Loggy.currentPrinter as StreamPrinter?
                              : null;
                      if (printer == null) return;
                      var logList = printer.logRecord.value;
                      if (logList.length > 50) {
                        logList = logList.sublist(0, 50);
                      }
                      final text = logList.map((e) => e.message).toString();
                      Navigator.of(context).pop();
                      await Clipboard.setData(ClipboardData(text: text)).then(
                        (_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Log copied to clipboard'),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DisabledPrinter extends LoggyPrinter {
  const DisabledPrinter() : super();

  @override
  void onLog(LogRecord record) {}
}
