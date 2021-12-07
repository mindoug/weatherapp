//
//  Image.swift
//  MostlySunny
//
//  Created by Mindy Douglas on 12/6/21.
//

import Foundation
import UIKit

struct Image: Codable {
  
  //wrapper to make SFSymbol imgage codable
  
  let imageData: Data?
  
  init(withImage image: UIImage) {
    self.imageData = image.pngData()
  }
  
  func getImage() -> UIImage? {
    guard let imageData = self.imageData else {
      return nil
    }
    
    let image = UIImage(data: imageData)
    
    return image
  }
}
