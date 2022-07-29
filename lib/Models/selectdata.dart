

List<CategorieModel> getCategories(){

  List<CategorieModel> myCategories = <CategorieModel>[];
  CategorieModel categorieModel = CategorieModel();

  //1
  categorieModel =  CategorieModel();
  categorieModel.categorieName = "Business";
  myCategories.add(categorieModel);

  //2
  categorieModel =  CategorieModel();
  categorieModel.categorieName = "Entertainment";
  myCategories.add(categorieModel);

  //3
  categorieModel =  CategorieModel();
  categorieModel.categorieName = "General";
  myCategories.add(categorieModel);

  //4
  categorieModel =  CategorieModel();
  categorieModel.categorieName = "Health";
  myCategories.add(categorieModel);

  //5
  categorieModel =  CategorieModel();
  categorieModel.categorieName = "Science";
  myCategories.add(categorieModel);

  //5
  categorieModel =  CategorieModel();
  categorieModel.categorieName = "Sports";
  myCategories.add(categorieModel);

  //5
  categorieModel =  CategorieModel();
  categorieModel.categorieName = "Technology";
  myCategories.add(categorieModel);

  return myCategories;

}

class CategorieModel {
  late String categorieName;

}