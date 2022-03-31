

import Foundation

protocol UsersProtocol: AnyObject {
    func usersFetched()
    func errorFetchingUsers()
}
final class UsersViewModel: ViewModel {
    
    private var users = [DirectoryItem]()
    weak var view: UsersProtocol?
    let coordinator: UsersCoordinator
    
    init(coordinator: UsersCoordinator) {
        self.coordinator = coordinator
    }
    
    var usersCount: Int {
        return users.count
    }
    
    func fetchUsers() {
        let request = UserRequest()
        session.request(request: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
                case .success(let response):
                    guard let users = response?.directoryItems else { return }
                    self.users = users
                    // LLAMAMOS AL QUE IMPLEMENTA EL PROTOCOLO
                    self.view?.usersFetched()
                    
                case .failure:
                    // LLAMAMOS AL QUE IMPLEMENTA EL PROTOCOLO
                    self.view?.errorFetchingUsers()
            }
        }
    }
    //Nos devuelve el usuario (El objeto DirectoryItem tiene un usuario)  del indice X del array de usuarios
    func user(from row: Int) -> DirectoryItem {
        return users[row]
    }
    
    
    func didSelectRowAt(at row: Int) {
        coordinator.didSelect(userName: users[row].user.username)
    }
     
}

