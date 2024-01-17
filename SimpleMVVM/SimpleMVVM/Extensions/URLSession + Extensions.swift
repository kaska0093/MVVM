//
//  URLSession + Extensions.swift
//  SimpleMVVM
//
//  Created by Nikita Shestakov on 14.01.2024.
//

import Foundation


extension URLSession {
    typealias Handle = (Data?, URLResponse?, Error?) -> Void
    //Атрибут @discardableResult в Swift является ценным инструментом
    //для улучшения читаемости кода и управления функциями, возвращающими
    //значения, которые не всегда нужно использовать. Он позволяет
    //исключить предупреждения компилятора при намеренном игнорировании
    //возвращаемого значения, делая код чище и выразительнее.
    
    @discardableResult
    func request(_ endpoint: EndPoint, handler: @escaping Handle) -> URLSessionDataTask {
        let task = dataTask(with: endpoint.url, completionHandler: handler)
        task.resume()
        return task
    }
}
