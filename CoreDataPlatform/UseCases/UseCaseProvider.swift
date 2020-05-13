import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCaseProvider {
    private let coreDataStack = CoreDataStack()
    private let recipeRepository: Repository<Recipe>

    public init() {
        recipeRepository = Repository<Recipe>(context: coreDataStack.context)
    }

    public func makeRecipesUseCase() -> Domain.RecipesUseCase {
        return RecipesUseCase(repository: recipeRepository)
    }
}
