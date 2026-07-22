
import Foundation

protocol ImageApiClient {
    func requestImage(from url: URL) async throws -> Data?
}


final class SImageApiClient: ImageApiClient {
    private let session: URLSession

    init() {
        session = URLSession.init(configuration: .default)
    }

    func requestImage(from url: URL) async throws -> Data? {
        let urlRequest = URLRequest(url: url)

        let (data, response) = try await session.data(for: urlRequest)
        if let httpResponse = response as? HTTPURLResponse,
           httpResponse.statusCode == 200 {
            return data
        }

        return nil
    }
}
