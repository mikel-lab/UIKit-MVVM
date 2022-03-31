
import Foundation

final class UserDetailViewModel: ViewModel {
    
    let userName: String
    let coordinator: UserDetailCoordinator
    
    var onUserDetailSuccess: ((String, String) -> Void)?
    var onUserDetailError: ((String) -> Void)?
    
    init(userName: String, coordinator: UserDetailCoordinator) {
        self.userName = userName
        self.coordinator = coordinator
    }
    
    func fetchUserDetail() {
        
        let userDetailRequest = UserDetailRequest(username: userName)
        session.request(request: userDetailRequest) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                guard let response = response else { return }
                    self.onUserDetailSuccess?("\(response.user.id)", response.user.name)
                
            case .failure(let error):
                self.onUserDetailError?(error.localizedDescription)
            }
        }
    }
}
