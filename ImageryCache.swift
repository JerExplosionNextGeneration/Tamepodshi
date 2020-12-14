class ImageryCache {
    
    static let shared = ImageryCache()
    private let session: URLSession
    
    private init(session: URLSession = .shared) {
        self.session = session
    }
    private let imgCache: NSCache<NSString, UIImage> = NSCache()
    
    private func getImigi(nsKey: NSString) -> UIImage? {
        return imgCache.object(forKey: nsKey)
    }
    private func addImigi( imigi: UIImage, nsKey: NSString) {
        imgCache.setObject(imigi, forKey: nsKey)
    }
    public func fetchImigi(url: URL, callBack: @escaping (_ imigi: UIImage?) -> ()) {
        let aImg = getImigi(nsKey: url.absoluteString as NSString)
        
        if aImg != nil {
            DispatchQueue.main.async {
                callBack(aImg)
            }
        }
        else {
            session.dataTask(with: url) { [weak self] (data, response, erro) in
                guard let httpURLResponse = response as? HTTPURLResponse,
                    httpURLResponse.statusCode == 200,
                    let data = data,
                    erro == nil,
                    let img = UIImage(data: data)
                    else {
                        DispatchQueue.main.async {
                            callBack(nil) 
                        }
                        return
                }
                self?.addImigi(imigi: img, nsKey: url.absoluteString as NSString)
                DispatchQueue.main.async {
                    callBack(img)
                }
            }.resume()
        }
    }
}
