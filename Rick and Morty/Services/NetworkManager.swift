//
//  NetworkManager.swift
//  Rick and Morthy
//
//  Created by Vladimir Kravets on 09.03.2023.
//


import Foundation


class NetworkManager {
    
    
    static let shared = NetworkManager() //singleton
    
    
    func fetchSearch(searchTerm: String, completion: @escaping (Characters?, Error?) -> ()) {
        
        let urlString = "https://rickandmortyapi.com/api/character/?name=\(searchTerm)"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
        
    }
    
    func fetchCharacters(page: Int,completion: @escaping (Characters?, Error?) -> ()) {
        
        let urlString = "https://rickandmortyapi.com/api/character/?page=\(page)"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                completion(nil, error)
                return
            }
            guard let data = data else {return}
            
            do {
                let searchResult = try JSONDecoder().decode(Characters.self, from: data)
                completion(searchResult, error)
                
            }catch{
                print(error)
                completion(nil, error)
            }
        }.resume() //fire off the request
    }
    
    func fetchCharacterCount(completion: @escaping([Results], Error?) -> ()) {
        let urlString = "https://rickandmortyapi.com/api/character"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                completion([], error)
                return
            }
            guard let data = data else {return}
            
            do {
                let searchResult = try JSONDecoder().decode(Characters.self, from: data)
                completion(searchResult.results, error)
                
            }catch{
                print(error)
                completion([], error)
            }
        }.resume()
    }
    
        // declare my generic json function here
        func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
            
            guard let url = URL(string: urlString) else { return }
            URLSession.shared.dataTask(with: url) { (data, resp, err) in
                if let err = err {
                    completion(nil, err)
                    return
                }
                do {
                    let objects = try JSONDecoder().decode(T.self, from: data!)
                    // success
                    completion(objects, nil)
                } catch {
                    completion(nil, error)
                }
            }.resume()
        }
    }
