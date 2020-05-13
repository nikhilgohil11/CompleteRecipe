import Foundation
import RxSwift

public protocol RecipesUseCase {
    func recipes() -> Observable<[Recipe]>
    func save(recipe: Recipe) -> Observable<Void>
    func delete(recipe: Recipe) -> Observable<Void>
}
