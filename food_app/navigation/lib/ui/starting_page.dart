import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AdminControlPanelBloc adminControlPanelBloc = BlocProvider.of<AdminControlPanelBloc>(context);
    final OrdersViewBloc ordersViewBloc = BlocProvider.of<OrdersViewBloc>(context);
    final CartViewBloc cartViewBloc = BlocProvider.of<CartViewBloc>(context);
    final AuthViewBloc authViewBloc = BlocProvider.of<AuthViewBloc>(context);

    return WillPopScope(
      child: AnimatedTheme(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        data: theme,
        child: Scaffold(
          backgroundColor: theme.colorScheme.background,
          body: SafeArea(
            child: BlocListener<AuthViewBloc, AuthViewState>(
              listener: (BuildContext context, AuthViewState state){
                if (state.isLoggedIn) {
                  if (state.user.isAdmin) {
                    ordersViewBloc.add(
                      InitAdminOrdersEvent(),
                    );
                    if (state.user.isSuperAdmin) {
                      adminControlPanelBloc.add(
                        AdminControlPanelInitEvent(),
                      );
                      authViewBloc.add(
                        const NavigateToPageEvent(
                          route: SuperAdminHomePageRoute(),
                        ),
                      );
                    } else {
                      authViewBloc.add(
                        const NavigateToPageEvent(
                          route: AdminHomePageRoute(),
                        ),
                      );
                    }
                  } else {
                    ordersViewBloc.add(
                      InitOrdersEvent(),
                    );
                    cartViewBloc.add(
                      InitCartEvent(),
                    );
                    authViewBloc.add(
                      const NavigateToPageEvent(
                        route: HomePageRoute(),
                      ),
                    );
                  }
                } else {
                  authViewBloc.add(
                    const NavigateToPageEvent(
                      route: LoginScreenRoute(),
                    ),
                  );
                }
              },
              child: const Center(
                child: AppLoaderCenterWidget(),
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
