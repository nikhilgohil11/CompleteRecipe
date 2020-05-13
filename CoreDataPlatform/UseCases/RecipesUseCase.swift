import Foundation
import Domain
import RxSwift

final class RecipesUseCase<Repository>: Domain.RecipesUseCase where Repository: AbstractRepository, Repository.T == Recipe {
    
    private let repository: Repository

    init(repository: Repository) {
        self.repository = repository
    }

    func recipes() -> Observable<[Recipe]> {
        return repository.query(with: nil, sortDescriptors: [Recipe.CoreDataType.date.descending()])
    }
    
    func save(recipe: Recipe) -> Observable<Void> {
        return repository.save(entity: recipe)
    }

    func delete(recipe: Recipe) -> Observable<Void> {
        return repository.delete(entity: recipe)
    }
}
