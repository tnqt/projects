import 'package:flutter/material.dart';
import 'package:shared_module/shared_module.dart' as shared_module;
import 'package:store_management/store_management.dart';

class SuperAppPage extends StatefulWidget {
  const SuperAppPage({super.key});

  @override
  State<SuperAppPage> createState() => _SuperAppPageState();
}

class _SuperAppPageState extends State<SuperAppPage> {
  int _currentIndex = 0;
  late PageController _pageController;
  List<NavigationTab> navigationTabList = List.from(NavigationTab.values);
  late List<Widget> tabList;
  // late List<BottomNavigationBarItem> navigationBarItemList;

  @override
  void initState() {
    _initPage();
    tabList = navigationTabList.map((e) => e.destinationPage).toList();
    // navigationBarItemList =
    //     navigationTabList.map((e) => e.navigationBarItem).toList();
    super.initState();
  }

  void _initPage() {
    // try {
    //   final args = Get.arguments;
    //   if ((args != null && args is int)) _currentIndex = args;
    // } catch (error) {
    //   _currentIndex = 0;
    // }
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox.expand(
            child: PageView(
              physics: ClampingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: tabList,
            ),
          ),
        ],
      ),
      bottomNavigationBar: getBtmNavBar(context),
    );
  }

  BottomNavigationBar getBtmNavBar(BuildContext context) {
    return BottomNavigationBar(
      // elevation: 10,
      // backgroundColor: Color(0xFFF9F9F9),
      key: UniqueKey(),
      currentIndex: _currentIndex,
      onTap: (index) {
        if (index == NavigationTab.home.index) {
          // context.read<ContactCubit>().updateReceivedInvitationTotal();
          FirebaseLogger().log("action_dashboard_contact", "");
        } else if (index == NavigationTab.order.index) {
          // context.read<NotificationCubit>().onTabViewNewNotification();
          FirebaseLogger().log("action_vital_index_notification", "");
        } else if (index == NavigationTab.product.index) {
          FirebaseLogger().log("action_vital_index_menu_tab", "");
        } else if (index == NavigationTab.menu.index) {
          FirebaseLogger().log("action_reminder_tab", "");
        } else {
          FirebaseLogger().log("action_dashboard", "");
        }

        _pageController.jumpToPage(index);
      },
      selectedItemColor:
          shared_module.SharedModuleApp.appDelegates.config.tenantConfigModel.getMainColor,
      unselectedItemColor: const Color.fromRGBO(68, 73, 77, 1),
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: shared_module.CustomTextStyle.textStyle15GreenW500,
      unselectedLabelStyle: shared_module.CustomTextStyle.textStyle15Grey600W500,
      iconSize: 26.0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: AppLocalizations.of(context)!.homePage,
          activeIcon: SizedBox(
            width: 25.0,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                "assets/icon/ic_home.png",
                alignment: Alignment.center,
                fit: BoxFit.fill,
                color: const Color(0xFF66BB6A),
              ),
            ),
          ),
          icon: SizedBox(
            width: 25.0,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                "assets/icon/ic_home.png",
                color: Colors.grey[600],
                alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
            ),
          ),
          // backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          label: AppLocalizations.of(context)!.order,
          activeIcon: SizedBox(
            width: 25.0,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                "assets/icon/ic_shopping.png",
                fit: BoxFit.fill,
                color: const Color(0xFF66BB6A),
              ),
            ),
          ),
          icon: SizedBox(
            width: 25.0,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                "assets/icon/ic_shopping.png",
                color: Colors.grey[600],
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: AppLocalizations.of(context)!.product,
          activeIcon: SizedBox(
            width: 25.0,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                "assets/icon/ic_product.png",
                fit: BoxFit.fill,
                color: const Color(0xFF66BB6A),
              ),
            ),
          ),
          icon: SizedBox(
            width: 25.0,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                "assets/icon/ic_product.png",
                color: Colors.grey[600],
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: AppLocalizations.of(context)!.others,
          activeIcon: SizedBox(
            width: 25.0,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                "assets/icon/ic_other.png",
                color: const Color(0xFF66BB6A),
                fit: BoxFit.fill,
              ),
            ),
          ),
          icon: SizedBox(
            width: 25.0,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                "assets/icon/ic_other.png",
                color: Colors.grey[600],
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
