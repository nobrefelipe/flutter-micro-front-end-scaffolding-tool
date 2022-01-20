import 'package:micro_core/micro_core.dart';
import 'presenter/[FILE_PREFIX]_view.dart';
import '[FILE_PREFIX]_events.dart';

class [NAME]Resolver implements MicroApp {
  @override
  String get microAppName => "/[FILE_PREFIX]";

  @override
  Map<String, WidgetBuilderArgs> get routes => {
       microAppName: (context, args) => [NAME]View(args as 
       [NAME]DummyEvent),
      };

  @override
  void initRouteListeners() {
    CustomEventBus.on<[NAME]DummyEvent>((event) {
      print(event.user);
    });
  }

  @override
  [NAME]Events microAppEvents() =>
   [NAME]Events();
}
