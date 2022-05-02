//
//  HttpUtility.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation

enum API_MEHODE : String {
    case POST
    case GET
    case PUT
    case DELETE
}




public class HttpUtility : NSObject , URLSessionDelegate
{
    
    
    
    //MARK:-Http
    
    func apiData<T:Decodable>(requestUrl: String,methode : API_MEHODE = .POST, requestBody: Data? =   nil, parameters: [String: Any]? = nil, headers: [String: String]? = nil, resultType: T.Type, completion :@escaping(_ result: T?,_ success : Bool,_ error : String?)-> Void)
    {
        
        
        guard Reachability.isConnectedToNetwork() else {
            completion(nil, false, AppString.error_no_connection.value)
            return
        }
        
        var getData = ""
        if let parameters  = parameters {
            if parameters.isEmpty == false {
                getData = "?"
                var sparatore = ""
                parameters.forEach({
                    getData += "\(sparatore)\($0.0)=\($0.1)"
                    sparatore = "&"
                })
            }
        }
        
        AppLog.console(TAG: "Query data", message: getData)
        let url =  "\(requestUrl)\(getData.trim())".addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        AppLog.console(TAG: "apiData/URL", message: url)
        guard let serviceUrl = URL(string: url ?? "/") else {
            return completion(nil,false, AppString.error_system.value)
        }
        var urlRequest = URLRequest(url: serviceUrl)
        
        
        urlRequest.httpMethod = methode.rawValue
        urlRequest.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")  // the request is JSON
        urlRequest.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        
        if let headers = headers  {
            headers.forEach({
                urlRequest.addValue($1, forHTTPHeaderField: $0)
            })
        }
        
        if let requestBody = requestBody {
            urlRequest.httpBody = requestBody
        }
        
        
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
        let task = session.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data,let response = response as? HTTPURLResponse,error == nil else {
                    // check for fundamental networking error
                    AppLog.console(TAG: "ERROR", message: error?.localizedDescription ?? "Unknown error")
                    completion(nil,false, AppString.error_system.value)
                    return
                }
                do {
                    
                    guard (200 ... 299) ~= response.statusCode else {
                        // check for http errors
                        AppLog.console(TAG: "statusCode should be 2xx, but is", message: "\(response.statusCode)")
                        AppLog.console(TAG: "response", message: "\(response)")
                        return completion(nil,false, AppString.error_system.value)
                    }
                    
                    let responseBody = try JSONDecoder().decode(T.self, from: data)
                    completion(responseBody,  true,nil)
                }catch {
                    print("error", error)
                    if response.statusCode == 200 {
                        completion(nil, true,nil)
                    }else{
                        return completion(nil,false, AppString.error_system.value)
                    }
                }
                
                
            }
        }
        
        task.resume()
        
    }
    

}
