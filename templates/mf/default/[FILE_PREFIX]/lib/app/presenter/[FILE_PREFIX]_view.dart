import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

import '../[FILE_PREFIX]_events.dart';

class [NAME]View extends StatelessWidget {
  final [NAME]DummyEvent args;
  [NAME]View(this.args);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SUIButton.text(
          label: 'Print me',
          width: 240,
          height: 50,
          ontap: () {
            CustomEventBus.emit([NAME]DummyEvent('Home'));
          },
        ),
      ),
    );
  }
}
