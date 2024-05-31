//
//  ModelData.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-27.
//

import Foundation

@Observable //con nuevo swift 5.9.2
class ModelData { //para que el ususario pueda modificar valores
	
	var landmarks: [Landmark] = load("landmarkData.json") //llamamos a la funcion
	var hikes: [Hike] = load("hikeData.json")
	var profile = Profile.default //Para tener un profile que persista aunque el usuario cancele
	
	//Diccionario de categorias
	var categories: [String: [Landmark]] {
		Dictionary(grouping: landmarks, by: { $0.category.rawValue } //el elemento lee su categoria
		)
	}
	
	//filtro de is Feautred
	var features: [Landmark] {
		landmarks.filter{$0.isFeatured}
	}
}

func load<T: Decodable>(_ filename: String) -> T {
	let data: Data
	
	
	guard let file = Bundle.main.url(forResource: filename, withExtension: nil) //condicion
	else {
		fatalError("Couldn't find \(filename) in main bundle.") //se ejecutara si hay un error
	}
	
	
	do {
		data = try Data(contentsOf: file)
	} catch {
		fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
	}
	
	//Cuando ya leyo el archivo
	do {
		let decoder = JSONDecoder()
		return try decoder.decode(T.self, from: data)
	} catch {
		fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
	}
}

