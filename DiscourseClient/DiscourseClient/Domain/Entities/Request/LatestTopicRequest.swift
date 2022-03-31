
import Foundation

struct LatestTopicsRequest: APIRequest {
    typealias Response = LatestTopicsResponse
    //el typealias es para que la petición que hacemos a la web pidiendo una respuesta concreta sea del tipo latestTopicResponse y tenga ya todo el codable implementado (que ya está definido en la response de topics) para poder parsear los atributos del objeto topics con el estilo de nomenclatura que nosotros usamos en la aplicación.
    
    var method: Method {
        return .GET
    }
    
    var path: String {
        return "/latest.json"
    }
    
    var parameters: [String : String] {
        return [:]
    }
    
    var body: [String : Any] {
        return [:]
    }
    
    var headers: [String : String] {
        return [:]
    }
}
