import Foundation
import Alamofire

class Service {
    //https://restcountries.eu/rest/v2
        fileprivate var baseUrl = ""
        typealias movieCallBack = (_ countries:[Movie]?, _ status: Bool, _ message:String) -> Void
        
        var callBack:movieCallBack?
        
        init(baseUrl: String) {
            self.baseUrl = baseUrl
        }
        
        //MARK:- getAllCountryNameFrom
        func getAllCountryNameFrom(endPoint:String) {
            AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
                guard let data = responseData.data else {
                    self.callBack?(nil, false, "")

                    return}
                do {
                let countries = try JSONDecoder().decode([Movie].self, from: data)
                    self.callBack?(countries, true,"")
                } catch {
                    self.callBack?(nil, false, error.localizedDescription)
                }
                
            }
        }
        
        func completionHandler(callBack: @escaping movieCallBack) {
            self.callBack = callBack
        }
}
