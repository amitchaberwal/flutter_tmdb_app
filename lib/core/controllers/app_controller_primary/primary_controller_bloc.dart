// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/core/config/theme_config.dart';

import 'package:insort_assignment/core/controllers/app_controller_primary/primary_controller.state.dart';
import 'package:insort_assignment/domain/usecase/bookmarks_usecase.dart';
import 'primary_controller_events.dart';

class PrimaryAppBloc extends Bloc<PrimaryAppEvent, PrimaryAppState> {
  final BookmarkUseCase bookmarkUseCase;
  bool isDeviceTypeChanging = false;
  PrimaryAppBloc(this.bookmarkUseCase) : super(PrimaryAppState.initial()) {
    on<UpdateAppTheme>((event, emit) async {
      add(UpdateState(state.copyWith(appTheme: event.theme)));
    });
    on<UpdateState>((event, emit) async {
      emit(
        event.state,
      );
    });

    on<GetInitialConfiguration>((event, emit) async {
      AppTheme appTheme = AppDarkTheme();
      add(UpdateAppTheme(theme: appTheme));
      add(GetSavedMovies());
    });

    on<GetSavedMovies>((event, emit) async {
      final saved = await  bookmarkUseCase.getSavedMovies();
      emit(
        state.copyWith(
          moviesList: saved,
        ),
      );
    });

    on<ToggleBookmark>((event, emit) async {
      await bookmarkUseCase.toggleBookmark(event.movie);
      final saved = await  bookmarkUseCase.getSavedMovies();
      emit(
        state.copyWith(
          moviesList: saved,
        ),
      );
    });
  }
}
