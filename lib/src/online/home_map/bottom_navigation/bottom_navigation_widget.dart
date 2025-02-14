import '../../../../imports.dart';

class ReusableBottomBar extends StatelessWidget {
  const ReusableBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
      builder: (context, provider, child) {
        return Theme(
          data: Theme.of(context).copyWith(canvasColor: cDarkBlack),
          child: BottomNavigationBar(
            selectedItemColor: cBackgroundGreen,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            currentIndex: provider.currentIndex,
            onTap: (index) {
              provider.setIndex(index);
              switch (index) {
                case 0:
                  context.read<BottomNavigationProvider>().setIsGotoHome(false);
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const GoOffline();
                    },
                  );
                  break;
                case 1:
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const GoHomeContainer();
                    },
                  );
                  break;
                case 2:
                  context.read<BottomNavigationProvider>().setIsGotoHome(false);
                  context.read<BottomNavigationProvider>().setIndex(2);
                  break;
                case 3:
                  context.read<BottomNavigationProvider>().setIsGotoHome(false);
                  context.read<BottomNavigationProvider>().setIndex(3);
                  break;
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.logout),
                label: 'OFFLINE',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'GO TO',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.online_prediction),
                label: 'ONLINE',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.more_horiz_outlined,
                ),
                label: 'MORE',
              ),
            ],
          ),
        );
      },
    );
  }
}
