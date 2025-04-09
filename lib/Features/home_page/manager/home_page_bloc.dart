import 'package:bloc/bloc.dart';
import 'package:store_app/Data/repository/home_page-repository.dart';
import 'package:store_app/Features/home_page/manager/home_page_event.dart';
import 'package:store_app/Features/home_page/manager/home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final ProductsRepository _repo;
  final int categoryId;

  // final String searchTitle;

  HomePageBloc({
    required ProductsRepository repo,
    required this.categoryId,
    // required this.searchTitle,
  })  : _repo = repo,
        super(HomePageState.initial()) {
    on<HomePageLoad>(_load);
    add(HomePageLoad(id: categoryId, searchTitle: null));
  }

  Future<void> _load(HomePageLoad event, Emitter<HomePageState> emit) async {
    final store = await _repo.fetchHomePage(categoryId, null);
    emit(
      state.copyWith(
        store: store,
        status: HomePageStatus.idle,
      ),
    );
  }
}
