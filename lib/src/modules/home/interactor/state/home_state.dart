sealed class HomeState {
  final int count;

  HomeState({required this.count});

  InitHomeState init() => InitHomeState();
  IncrementedHomeState incrementedState({int? newCountValue}) => IncrementedHomeState(count: newCountValue ?? count); 

}

class InitHomeState extends HomeState {
  InitHomeState() : super(count: 0);
}

class IncrementedHomeState extends HomeState {
  IncrementedHomeState({required super.count});
}
