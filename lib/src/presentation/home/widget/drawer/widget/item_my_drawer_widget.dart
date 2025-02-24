import '../../../../../../core/app_exports.dart';
class ItemMyDrawerWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  const ItemMyDrawerWidget({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          onTap.call();
        },
        child: Row(
          children: [
            Icon( icon, size: 30.sp, color: Color(0xFF303030)),
            SizedBox(width: 20,),
            Text(title,style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xFF303030)
            ),),
          ],
        ),
      ),
    );

  }
}
