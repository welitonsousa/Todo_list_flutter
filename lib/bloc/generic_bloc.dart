import 'dart:async';

class GenericBloc<T> {
  StreamController<T> controller = StreamController();
  Stream<T> get stream => controller.stream;

  void dispose() {
    controller.close();
  }

  void add(T element){
    controller.add(element);  
  }
}
