//
//  RMPlaceholderImageView.swift
//  RickandMortyAPI
//
//  Created by Alexandru Vorojbit on 9/4/21.
//

import UIKit

let cachedImages = NSCache<NSString, UIImage>()

extension UIImageView {

    //Fetch image profile from a URL Using URLSession and DispatchQueue main async
    func loadImageUsingCacheWithUrlString(urlString: String) {

        self.image = nil

        //Check cache for image first
        if let cacheImage = cachedImages.object(forKey: urlString as NSString)  {
            print("Fetching image from cache...")
            self.image = cacheImage
            return
        }

        //Otherwise fire off a new download
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }

            guard let downloadedImage = UIImage(data: data) else { return }
            cachedImages.setObject(downloadedImage, forKey: urlString as NSString)

            DispatchQueue.main.async { self.image = downloadedImage }
        }
        task.resume()
    }
}

