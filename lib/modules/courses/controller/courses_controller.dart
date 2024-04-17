import '../../../export.dart';
import '../model/courses_data_model.dart';

class courses_controller extends GetxController {
  TextEditingController courses_dummy_controller = TextEditingController();
  var refresh_loader = false.obs;
  var courses_data_ = courses_data().obs;
  var is_loading = false.obs;
  RxList<courses_data> courses_list = RxList<courses_data>();



  init()async{
    await get_courses_data_from_api();
  }
  
  get_courses_data_from_api()async{
    is_loading.value = true;
    var res = await restCallController_dat.getCall(full_url: "https://fakestoreapi.com/products?limit=15");
    if(res!= null){
      res = json.decode(res);
      for(var k in res){
        k = json.encode(k);
        courses_data_.value = courses_dataValue(k);
        courses_list.value.add(courses_data_.value);
      }
      is_loading.value = false;

      // refreshing the screen
      courses_controller_dat.refresh_loader.value = true;
      courses_controller_dat.refresh_loader.value = false;
      print("ts ------> ${courses_list.value.length}");
    }
  }

  validate()async{}

  navigate() {}
}
