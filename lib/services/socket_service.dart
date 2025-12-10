import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  IO.Socket? socket;
  void connect(String serverUrl, String? token) {
    socket = IO.io(serverUrl, IO.OptionBuilder()
      .setTransports(['websocket'])
      .setQuery({'token': token})
      .disableAutoConnect()
      .build());
    socket?.connect();
    socket?.onConnect((_) => print('socket connected: \${socket?.id}'));
  }
  void disconnect() => socket?.disconnect();
}
