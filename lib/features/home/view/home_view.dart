// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insort_assignment/core/extensions/controller_extensions.dart';
import 'package:insort_assignment/features/home/controller/home_bloc.dart';
import 'package:insort_assignment/features/home/controller/home_event.dart';
import 'package:insort_assignment/features/home/controller/home_state.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(InitializeHome()),
      child: const HomeUI(),
    );
  }
}

class HomeUI extends StatelessWidget {
  const HomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
            body: context.read<HomeBloc>().homeTiles[state.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: context.appTheme.backgroundColorPrimary,
              selectedItemColor: context.appTheme.accentColor,
              unselectedItemColor: context.appTheme.textColorPrimary,
              currentIndex: state.selectedIndex,
              onTap: (index){
                context.read<HomeBloc>().add(UpdateSelectedIndex(index));
              },
              items: context
                  .read<HomeBloc>()
                  .bottomBarItems
                  .map(
                    (e) => BottomNavigationBarItem(
                      activeIcon:  Icon(
                      e.activeIcon,
                      size: 30,
                    ),
                      icon: Icon(
                        e.icon,
                        size: 30,
                      ),
                      label: e.name,
                    ),
                  )
                  .toList(),
            ),);
      },
    );
  }
}
