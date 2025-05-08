import 'package:bloc/bloc.dart';
import 'package:store_app/Features/myCart/manager/my_cart_event.dart';
import 'package:store_app/Features/myCart/manager/my_cart_state.dart';
import '../../../data/repository/mycart/my_cart_interface.dart';

class MyCartBloc extends Bloc<MyCartEvent, MyCartState> {
  final IMyCartRepository _repository;

  MyCartBloc({required IMyCartRepository repo})
      : _repository = repo,
        super(MyCartState.initial()) {
    on<MyCartLoad>(_load);
    add(MyCartLoad());
  }

  Future<void> _load(MyCartLoad event, Emitter<MyCartState> emit) async {
    emit(state.copyWith(status: MyCartStatus.loading));
    final cart = await _repository.fetchMyCart();
    // print(cart.toString());
    emit(state.copyWith(data: cart, status: MyCartStatus.idle));
  }
}
