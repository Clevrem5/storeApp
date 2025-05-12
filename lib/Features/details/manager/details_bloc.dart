import 'package:bloc/bloc.dart';
import 'package:store_app/Features/details/manager/details_state.dart';
import 'package:store_app/data/repository/details/IdetailsRepository.dart';

part 'details_event.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final IDetailsRepository _repo;


  DetailsBloc({required IDetailsRepository repo})
      : _repo = repo,
        super(DetailsState.initial()) {
    on<DetailsLoad>(_load);
  }
  Future<void>_load(DetailsLoad event ,Emitter<DetailsState>emit)async{
    final details=await _repo.fetchDetails(event.id);
    emit(state.copyWith(details: details,status: DetailsStatus.idle));
  }
}
