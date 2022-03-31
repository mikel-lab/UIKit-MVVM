

import Foundation

struct TopicDetailRequest: APIRequest {
    
    typealias Response = TopicDetailResponse
    
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var method: Method {
        .GET
    }
    
    var path: String {
        "/t/\(id).json"
    }
    
    var parameters: [String : String] {
        [:]
    }
    
    var body: [String : Any] {
        [:]
    }
    
    var headers: [String : String] {
        [:]
    }
    
}
