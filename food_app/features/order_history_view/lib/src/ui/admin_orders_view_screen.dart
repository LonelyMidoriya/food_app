import 'package:core/core.dart';
import 'package:core_ui/widgets/app_button_widget.dart';
import 'package:core_ui/widgets/app_loader_center_widget.dart';
import 'package:core_ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../order_history_view.dart';
import '../widget/admin_order_item.dart';

class AdminOrdersViewScreen extends StatefulWidget {
  const AdminOrdersViewScreen({Key? key}) : super(key: key);

  @override
  State<AdminOrdersViewScreen> createState() => _AdminOrdersViewScreenState();
}

class _AdminOrdersViewScreenState extends State<AdminOrdersViewScreen> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final OrdersViewBloc ordersViewBloc = BlocProvider.of<OrdersViewBloc>(context);

    return AnimatedTheme(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      data: theme,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: theme.colorScheme.background,
          body: Column(
            children: [
              TextField(
                style: const TextStyle(fontSize: 20),
                showCursor: false,
                onChanged: (String text) {
                  if (text .isNotEmpty) {
                    ordersViewBloc.add(
                      InitAdminSearchedOrdersEvent(
                        searchQuery: textEditingController.text,
                      ),
                    );
                  } else {
                    ordersViewBloc.add(
                      InitAdminOrdersEvent(),
                    );
                  }
                },
                decoration: InputDecoration(
                  fillColor: theme.colorScheme.background,
                  hintText: 'Search for user',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                textInputAction: TextInputAction.search,
                enableInteractiveSelection: false,
                controller: textEditingController,
              ),
              Expanded(
                child: LiquidPullToRefresh(
                  showChildOpacityTransition: false,
                  onRefresh: () async {
                    if (textEditingController.text.isEmpty) {
                      ordersViewBloc.add(
                        InitAdminOrdersEvent(),
                      );
                    } else {
                      ordersViewBloc.add(
                        InitAdminSearchedOrdersEvent(
                          searchQuery: textEditingController.text,
                        ),
                      );
                    }
                  },
                  color: theme.colorScheme.primary,
                  child: BlocConsumer<OrdersViewBloc, OrdersViewState>(
                    listener: (BuildContext context, OrdersViewState state) {
                      if (!state.hasInternet) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            elevation: 50,
                            backgroundColor: Colors.teal,
                            content: CustomText(
                              text: 'No Internet connection!',
                              fontWeight: FontWeight.w800,
                              textColor: theme.colorScheme.tertiary,
                            ),
                            duration: const Duration(seconds: 2),
                            margin: const EdgeInsets.symmetric(
                              vertical: 60,
                              horizontal: 30,
                            ),
                          ),
                        );
                      }
                    },
                    builder: (BuildContext context, OrdersViewState state) {
                      if (!state.isError &&
                          !state.isLoaded &&
                          state.hasInternet) {
                        return const AppLoaderCenterWidget();
                      } else if (state.isError && state.hasInternet) {
                        return Center(
                          child: Text(state.errorMessage.toString()),
                        );
                      } else if (state.isLoaded && state.hasInternet) {
                        if (state.allUsersOrders.isEmpty) {
                          return const Center(
                            child: CustomText(
                              text: 'No users found',
                              fontWeight: FontWeight.w900,
                            ),
                          );
                        } else {
                          return ListView.separated(
                            padding: const EdgeInsets.all(10),
                            addAutomaticKeepAlives: false,
                            addRepaintBoundaries: false,
                            itemCount: state.allUsersOrders.length,
                            itemBuilder: (BuildContext context, int index) {
                              return AdminOrderItem(
                                email: state.allUsersOrders[index].email,
                                orders: state.allUsersOrders[index],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 15,
                              );
                            },
                          );
                        }
                      } else {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Center(
                                child: CustomText(
                                  text: 'Internet connection lost.',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              AppButtonWidget(
                                label: 'Refresh'.trim(),
                                onTap: () {
                                  if (!state.hasInternet) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        elevation: 50,
                                        backgroundColor: Colors.teal,
                                        content: CustomText(
                                          text: 'No Internet connection!',
                                          fontWeight: FontWeight.w800,
                                          textColor: theme.colorScheme.tertiary,
                                        ),
                                        duration: const Duration(seconds: 2),
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 60,
                                          horizontal: 30,
                                        ),
                                      ),
                                    );
                                  }
                                  ordersViewBloc.add(
                                    InitOrdersEvent(),
                                  );
                                  textEditingController.clear();
                                },
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
