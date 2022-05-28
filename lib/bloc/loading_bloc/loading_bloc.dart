import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/userdata.dart';
import '../../service/loading/loading_repo.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  final LoadingRepository loadingRepository;
  LoadingBloc({required this.loadingRepository}) : super(LoadingInitial());
   @override
  Stream<LoadingState> mapEventToState(LoadingEvent event) async* {
    if (event is LoadingUserData) {
       yield LoadingData();
      try {
        UserData _user =
            await loadingRepository.getUserData();
        yield LoadedData(userData: _user);
      } catch (_) {
        yield ErrorLoadedData();
      }
    }
    
  }
}
