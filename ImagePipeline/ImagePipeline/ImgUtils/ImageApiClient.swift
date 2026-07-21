
import Foundation

protocol ImageApiClient {
    func requestImage(from url: String) async -> Result<Data, Error>
}
