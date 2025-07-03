import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_money/config/theme.dart';
import 'package:my_money/feature/transaction/presentation/bloc/bloc_tabbar/tabbar_bloc.dart';
import 'package:my_money/feature/transaction/presentation/pages/home_page.dart';
import 'package:my_money/feature/transaction/presentation/pages/profile_page.dart';

class MainBarPage extends StatelessWidget {
  const MainBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabbarBloc(),
      child: BlocBuilder<TabbarBloc, TabbarState>(
        builder: (context, state) {
          return Scaffold(
            body: _buildBody(state.tab),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 56.0,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(46.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: () {
                            context.read<TabbarBloc>().add(TabChanged(TabItem.home));
                          },
                          child: Container(
                            height: 56.0,
                            decoration: BoxDecoration(
                              color: state.tab ==TabItem.home ? AppColors.primary :AppColors.background,
                              borderRadius: BorderRadius.circular(46.0),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/home.svg",
                                    color: state.tab ==TabItem.home ?  AppColors.background: AppColors.primary,
                                  ),
                                  const SizedBox(width: 5.0),
                                  Text(
                                    "Home",
                                    style: TextStyle(
                                      color: state.tab ==TabItem.home ?  AppColors.background: AppColors.primary,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: () {
                            context.read<TabbarBloc>().add(TabChanged(TabItem.profile));
                          },
                          child: Container(
                            height: 56.0,
                            decoration: BoxDecoration(
                              color: state.tab ==TabItem.profile ?  AppColors.primary: AppColors.background,
                              borderRadius: BorderRadius.circular(46.0),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/profile.svg",
                                    color: state.tab ==TabItem.profile ?AppColors.background: AppColors.primary,
                                  ),
                                  const SizedBox(width: 5.0),
                                  Text(
                                    "Profile",
                                    style: TextStyle(
                                      color: state.tab ==TabItem.profile ?AppColors.background: AppColors.primary,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(TabItem tab) {
    switch (tab) {
      case TabItem.home:
        return const HomePage();
      case TabItem.profile:
        return const ProfilePage();
    }
  }
}
