import 'package:micro_core/micro_core.dart';

/// * Micro App Events
/// Register the micro app events here
/// so we provide them in [RouteEvents] to be fired from accross the micro apps.
/// The [initRouteListeners] method above will listen to the events listened here.
///

class [NAME]DummyEvent extends RouteEvent {
  final String user;
  [NAME]DummyEvent(this.user);
} // DUMMY EVENT

///
/// Exports the events in a class so we dont need to import
/// them from other micro apps. LoginEvents will be used by [RouteEvents]
///
class [NAME]Events extends RouteEvent {
   RouteEvent dummyEvent(String user) => [NAME]DummyEvent(user);
  // [NAME] events here
}
