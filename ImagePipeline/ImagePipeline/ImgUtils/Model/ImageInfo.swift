
import Foundation

class ImageInfo {
    let url: URL
    let data: Data

    init(url: URL, data: Data) {
        self.url = url
        self.data = data
    }
}
