import 'package:bloc/bloc.dart';
import 'package:store_app/Features/myCart/manager/my_cart_event.dart';
import 'package:store_app/Features/myCart/manager/my_cart_state.dart';
import 'package:store_app/data/repository/mycart/my_cart_repo_remote.dart';
import '../../../data/models/mycart/my_cart_model.dart';
import '../../../data/repository/mycart/my_cart_interface.dart';

class MyCartBloc extends Bloc<MyCartEvent, MyCartState> {
  final IMyCartRepository _repository;
  final MyCartRepositoryRemote _remote;

  MyCartBloc({
    required IMyCartRepository repo,
    required MyCartRepositoryRemote remote,
  })  : _repository = repo,
        _remote = remote,
        super(MyCartState.initial()) {
    on<MyCartLoad>(_load);
    on<MyCartDelete>(_delete);
    add(MyCartLoad());
  }

  Future<void> _load(MyCartLoad event, Emitter<MyCartState> emit) async {
    emit(state.copyWith(status: MyCartStatus.loading));
    final cart = await _repository.fetchMyCart();
    // print(cart.toString());
    emit(state.copyWith(data: cart, status: MyCartStatus.idle));
  }

  Future<void> _delete(MyCartDelete event, Emitter<MyCartState> emit) async {
    emit(state.copyWith(status: MyCartStatus.loading));

    try {
      final result = await _remote.fetchCardDelete(event.id);
      if (result) {
        state.data!.items = state.data!.items.where((item) => item.id != event.id).toList();
        emit(state.copyWith(status: MyCartStatus.idle));
      } else {
        emit(state.copyWith(status: MyCartStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(status: MyCartStatus.error));
    }
  }
}
