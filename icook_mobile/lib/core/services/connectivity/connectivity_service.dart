import 'package:icook_mobile/core/constants/connectivity_status.dart';
import 'package:icook_mobile/core/services/stoppable_service.dart';

abstract class ConnectivityService implements StoppableService {
  Stream<ConnectivityStatus> get connectivity$;

  Future<bool> get isConnected;
}
