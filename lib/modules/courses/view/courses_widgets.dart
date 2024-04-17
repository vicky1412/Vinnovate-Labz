import 'package:shimmer/shimmer.dart';
import 'package:vinnovate_labz/utils/global_images.dart';

import '../../../../export.dart';



Widget courses_main_widget(){
  return Container(
    color: Colors.grey.shade200,
    width: MediaQuery.of(Get.context!).size.width,
    height: MediaQuery.of(Get.context!).size.height,
    child: Column(
      children: [
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(Icons.arrow_back_ios,color: Colors.black,size: 30,).onTap(() {Get.back();}),
            s4.widthBox,
            s4.widthBox,
            s4.widthBox,
            s2.widthBox,
            Image.asset(academy_logo_png,width: 130,height: 30,),
            const Spacer()
          ],).p(20),
        ),
        Obx(()=>
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Showing ${courses_controller_dat.courses_list.value.length} Courses",style: TextStyle(fontWeight: FontWeight.w500,fontSize: f2),),
              Icon(Icons.search,size: 30,color: Colors.grey,).onTap(() {})
            ],
          ).p(20),
        ),
        ListView.builder(
          itemCount: courses_controller_dat.courses_list.value.length,
            itemBuilder: (context, index){
                return courses_item_widget(index: index).pSymmetric(h: 20,v: 5);
            },
        ).h(700)

      ],
    ),
  );
}


Widget courses_item_widget({index}){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    child: Row(
      children: [
        Image.network("${courses_controller_dat.courses_list.value[index].image}",width: 70,).p(5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${courses_controller_dat.courses_list.value[index].title}",style: TextStyle(fontWeight: FontWeight.w600)
                ,maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,),
              const Spacer(),
              Text("${courses_controller_dat.courses_list.value[index].category}",style: TextStyle(fontWeight: FontWeight.w400)
              ,maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,),
              const Spacer(),
              Row(children: [
                for(var k=0;k< 5;k++)...[
                  if(k < (courses_controller_dat.courses_list.value[index].rating?.rate).floor())...[
                    Icon(Icons.star,color: Colors.orange,size: 10,),
                  ]else...[
                    Icon(Icons.star_border,color: Colors.orange,size: 10,),
                  ]
                ],
                s1.widthBox,
                Text("(${courses_controller_dat.courses_list.value[index].rating?.rate})"),
                s1.widthBox,
                Text("(${courses_controller_dat.courses_list.value[index].rating?.count})"),
                const Spacer(),
                Text("\$${courses_controller_dat.courses_list.value[index].price}"),
              ],)
            ],
          ).h(80),
        )
      ],
    ).paddingSymmetric(horizontal: 10),
  );
}