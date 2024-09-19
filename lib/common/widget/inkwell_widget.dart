import 'package:JanSahayak/jan_sahayak.dart';

class inkWell extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;

  const inkWell({Key? key, this.onTap, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}
