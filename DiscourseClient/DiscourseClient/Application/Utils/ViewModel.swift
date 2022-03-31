

import Foundation

protocol ViewModel {}

extension ViewModel {
    var session: APIClient {
        return APIClient()
    }
}
