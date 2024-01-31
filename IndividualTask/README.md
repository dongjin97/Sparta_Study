# 스파르타 코딩클럽 강의  결과물
## 1. UserDefaults와 CoreData의 차이점
|차이점|UserDefaults와|CoreData|
|------|---|---|
|사용 데이터|간단한 설정값 및 작은 데이터 집합|대규모 데이터 집합|
|저장방식|키 - 값| 객체 그래프로 구성|
|관계 설정|X|O|
|데이터 접근|키값을 통해 쉽게 접근가능|NSPersistentContainer와 NSManagedObjectContext를 통해 접근가능|
|Read|key에 관련된 모든 데이터 Read|필요한 데이터만 가져올수 있음|
## 2. 구조설명
### 1. `ProfileViewController` - Profile 디렉토리
MVC
- Model (ProfileModel) : name과 age를 가지는 구조체 정의
- View (ProfileView,ProfileViewController 일부 코드): ProfileViewController의 View를 담당, UI 관련 함수
- Controller (ProfileViewController) : ProfileModel구조를 가지는 객체를 선언한후 데이터를 대입하여 View의 Label들의 Text를 설정(관련함수 : setLabelData)
### 2. 데이터 일관성 구현화면 - UseCoreData-LV3 디렉토리
MVC
- Model : (TaskModel.xcdatamodeld) : id, title, createData,modifyData,isCompleted 속성을 가진 엔터티 정의 ,(CoreDataManger) : TaskModel에서 정의한 구조의 CRUD 기능
- View (TaskCollectionViewCell,UseCoreDataViewController 일부 코드 ) : UseCoreDataViewController의 화면을 구성하는 UI담당
- Controller (UseCoreDataViewController)
  READ : View가 나타나기 전에 CoreDataManger의 Read기능인 fetchTasksData함수를 사용하여 taksList에 대입 -> CollectionView의 각각 UI에 해당하는 데이터 설정 (fetchTask() -> cell의 setTaskCell())
  CREATE : ViewController의 addTaskButttonAction을 통해 입력된 Title를 CoreDataManger의 Create기능인 addTaskData 함수에 전달 (addTaskList()-> CoreDataManger.shared.addTaskData(title))
  UPDATE : CollectionView에서 변경된 정보를 UIViewController를 통해서 CoreDataManger의 Update기능인 updateTaskData 함수에 전달 (cell.tapSwitchClosure -> updateTask() ->CoreDataManger.share.updateTaskData())
  DELETE : CollectionView에서 선택된 cell의 indexPath를 활용하여 선택된 셀의 정보를 CoreDataManger의 Delete기능인 함수에 전달 (deleteTask() ->CoreDataManger.shared.deleteTaskData())
