//
//  File.swift
//  
//
//  Created by Jose Moran on 31/5/24.
//

import Foundation
import Alamofire
import Combine

internal struct PaymentRepository {
  
  func getPaymentIntent(purchase: Purchase) -> AnyPublisher<PaymentIntentResponse, Never> {
    
    let token = LukaStripeSdk.instance.session.lukaToken
    
    return LukaStripeSdk.instance.apiSession.request(
      URL(string: "\(ApiConfig.baseUrl)/servicio/login")!,
      method: .post,
      body: purchase,
      headers: ["Authorization": "Bearer \(token)"],
      encoder: JSONParameterEncoder.prettyPrinted
    ).validate(statusCode: [200])
      .publishDecodable(type: PaymentIntentResponse.self)
      .eraseToAnyPublisher()
  }

}


public class PaymentIntentResponse : Codable  {
  let transactionId: Int
  let paymentId: String
  let clientSecret: String
}
