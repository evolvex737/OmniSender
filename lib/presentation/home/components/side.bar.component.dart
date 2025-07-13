part of 'main.components.dart';


class SideBarCustom extends StatelessWidget {
  const SideBarCustom({
    super.key,
    required this.destinations,
  });

  final Map<IconData, String> destinations;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        borderRadius: BorderRadiusGeometry.circular(5),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: destinations.entries
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: IconButton(
                          tooltip: e.value,
                          onPressed: () {},
                          icon: Icon(
                            e.key,
                            color:
                                context.theme.scaffoldBackgroundColor,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          Spacer(),
          Padding(padding: const EdgeInsets.all(8.0), child: Divider()),
          ObxValue(
            (changeTeme) => IconButton(
              tooltip: !changeTeme.value ? "Dark Mode" : "Light Mode",
              onPressed: () {
                Get.changeThemeMode(
                  !changeTeme.value ? ThemeMode.dark : ThemeMode.light,
                );
                changeTeme.value = !changeTeme.value;
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) =>
                    RotationTransition(turns: animation, child: child),
                child: Icon(
                  !changeTeme.value ? Icons.dark_mode : Icons.light_mode,
                  key: ValueKey(
                    changeTeme.value,
                  ), // penting! biar AnimatedSwitcher tahu berubah
                  color: context.theme.scaffoldBackgroundColor,
                  size: 24,
                ),
              ),
            ),
            Get.isDarkMode.obs,
          ),
        ],
      ),
    );
  }
}
