
import Foundation

public protocol UseCaseProvider {
    
    func makeRecipesUseCase() -> RecipesUseCase
}
