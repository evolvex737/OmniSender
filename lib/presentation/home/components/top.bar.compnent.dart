part of 'main.components.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.selectedRange, this.onPressed});

  final ChartRange selectedRange;
  final ValueChanged<ChartRange>? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _DateDaySelected(),
        const SizedBox(height: 16),
        _TopNav(selectedRange: selectedRange, onPressed: onPressed),
      ],
    );
  }
}

class _DateDaySelected extends StatelessWidget {
  const _DateDaySelected();

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(17, (index) {
          final date = startOfWeek.add(Duration(days: index));
          final isToday =
              date.day == today.day &&
              date.month == today.month &&
              date.year == today.year;

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            decoration: BoxDecoration(
              color: isToday
                  ? const Color(0xFF4CAF50)
                  : const Color(0xFF1E1E23),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  DateFormat('dd').format(date),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat('E').format(date),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _TopNav extends StatelessWidget {
  const _TopNav({required this.selectedRange, required this.onPressed});

  final ChartRange selectedRange;
  final ValueChanged<ChartRange>? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Statistik",
          style: context.textTheme.titleLarge!.copyWith(color: Colors.white),
        ),
        const Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: ChartRange.values.map((e) {
            final isSelected = e == selectedRange;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: TextButton(
                onPressed: () => onPressed?.call(e),
                style: TextButton.styleFrom(
                  backgroundColor: isSelected ? Colors.greenAccent : null,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  e.name.capitalizeFirst!,
                  style: context.textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class CustomHeaderTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;
  final Widget? trailing;

  const CustomHeaderTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon = Icons.info_outline,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      leading: CircleAvatar(
        backgroundColor: context.theme.primaryColor.withOpacity(0.2),
        child: Icon(icon, color: context.theme.primaryColor.withOpacity(0.8)),
      ),
      title: Text(
        title,
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle, style: context.textTheme.labelMedium),
      trailing: onTap != null
          ? IconButton(
              icon: Icon(
                Icons.chevron_right,
                color: context.theme.primaryColor.withOpacity(0.8),
              ),
              onPressed: onTap,
            )
          : trailing,
    );
  }
}
