import Foundation
import Domain
import NetworkPlatform
import CoreDataPlatform
import RealmPlatform

final class Application {
    static let shared = Application()
    private let rootUseCaseProvider: Domain.UseCaseProvider

    private init() {
    }

    func configureMainInterface(in window: UIWindow) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ng = UINavigationController()
        let cdNavigator = DefaultRecipesNavigator(services: rootUseCaseProvider,
                navigationController: ng,
                storyBoard: storyboard)
        window.rootViewController = cdNavigator
        cdNavigator.toPosts()
    }
}
