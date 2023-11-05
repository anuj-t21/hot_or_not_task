part of 'widgets.dart';

class BottomTabController extends StatelessWidget {
  const BottomTabController({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomTabItem(
            icon: Icons.home,
            color: AppColors.brightOrange,
          ),
          _BottomTabItem(
            icon: Icons.confirmation_num,
          ),
          _BottomTabItem(
            icon: Icons.add_circle,
            isCenter: true,
          ),
          _BottomTabItem(
            icon: Icons.wallet_rounded,
          ),
          _BottomTabItem(
            icon: Icons.format_align_right,
          ),
        ],
      ),
    );
  }
}

class _BottomTabItem extends StatelessWidget {
  final IconData icon;
  final bool isCenter;
  final Color? color;
  const _BottomTabItem({
    required this.icon,
    this.isCenter = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: isCenter ? AppColors.brightOrange : (color ?? AppColors.appWhite),
      size: isCenter ? 40.r : 24.r,
    );
  }
}
