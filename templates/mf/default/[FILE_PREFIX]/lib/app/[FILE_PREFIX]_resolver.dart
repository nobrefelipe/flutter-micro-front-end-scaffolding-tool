import 'package:flutter/widgets.dart';
import 'package:micro_core/micro_core.dart';
import 'presenter/[FILE_PREFIX]_view.dart';
import '[FILE_PREFIX]_events.dart';

class [NAME]Resolver implements MicroApp {
  @override
  String get microAppName => "/[FILE_PREFIX]";

  @override
  Map<String, WidgetBuilderArgs> get routes => {
       microAppName: (context, args) => [NAME]View(args as 
       [NAME]DummyEvent?),
      };

  @override
  void initEventListeners() {
    CustomEventBus.on<[NAME]DummyEvent>((event) {
      print(event.user);
    });
  }

  @override
  [NAME]Events microAppEvents() =>
   [NAME]Events();

  @override
  Widget? microAppWidget() => null;

  @override
  void injectionsRegister() => null;
}
