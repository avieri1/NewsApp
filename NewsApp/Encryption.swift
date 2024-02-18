//
//  Encryption.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import Foundation
import IDZSwiftCommonCrypto

func encrypt(text: String, salt: String) -> String? {
    let key = Array(salt.utf8)
    let bytes = Array(text.utf8)
    let cryptor = Cryptor(operation: .encrypt, algorithm: .des, options: [.ECBMode, .PKCS7Padding], key: key, iv:[UInt8]())
    if let encrypted = cryptor.update(byteArray: bytes)?.final() {
        return Data(encrypted).base64EncodedString()
    }
    return nil
}

func decrypt(text: String, salt: String) -> String? {
    let key = Array(salt.utf8)
    let bytes = [UInt8](Data(base64Encoded: text)!)
    let cryptor = Cryptor(operation: .decrypt, algorithm: .des, options: [.ECBMode, .PKCS7Padding], key: key, iv:[UInt8]())
    if let decrypted = cryptor.update(byteArray: bytes)?.final() {
        return String(bytes: decrypted, encoding: .utf8)
    }
    return nil
}
    
