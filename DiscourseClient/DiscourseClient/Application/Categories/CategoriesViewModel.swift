
import Foundation
protocol CategoriesViewProtocol: AnyObject {
    func topicsFetched()
    func errorFetchingTopics()
}
final class CategoriesViewModel: ViewModel {
    
     var categories = [Category]()
    weak var view: CategoriesViewProtocol?
    let coordinator: CategoriesCoordinator
    
    init(coordinator: CategoriesCoordinator) {
        self.coordinator = coordinator
    }
    
    var categoriesCount: Int {
        return categories.count
    }
    
    func fetchCategories() {
        let request = CategoryRequest()
        session.request(request: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                guard let categories = response?.categoryList.categories else { return }
                self.categories = categories
                // LLAMAMOS AL QUE IMPLEMENTA EL PROTOCOLO
                self.view?.topicsFetched()
                
            case .failure:
                // LLAMAMOS AL QUE IMPLEMENTA EL PROTOCOLO
                self.view?.errorFetchingTopics()
            }
        }
    }
    
    func category(from row: Int) -> Category {
        return categories[row]
    }
    

    
    func didSelectRowAt(at row: Int) {
        coordinator.didSelect(categoryId: categories[row].id)
    }

}


