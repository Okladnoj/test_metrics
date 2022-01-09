import 'dart:async';

mixin BaseInteractor<T> {
  final StreamController<bool> _controllerLoading = StreamController();
  StreamSink<bool> get sinkLoading => _controllerLoading.sink;
  Stream<bool> get observerLoading => _controllerLoading.stream;

  final StreamController<T> _controller = StreamController.broadcast();
  StreamSink<T> get sink => _controller.sink;
  Stream<T> get observer => _controller.stream;

  Future<void> dispose() async {
    try {
      await _controller.close();
      await _controllerLoading.close();
    } catch (e) {
      print(e);
    }
  }
}
