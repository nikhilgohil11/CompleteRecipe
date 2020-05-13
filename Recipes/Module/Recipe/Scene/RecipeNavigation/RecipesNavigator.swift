import UIKit
import Domain

protocol RecipesNavigator {
    func toCreateRecipe()
    func toRecipe(_ recipe: Recipe)
    func toRecipes()
}

class DefaultRecipesNavigator: RecipesNavigator {
    private let storyBoard: UIStoryboard
    private let navigationController: UINavigationController
    private let services: UseCaseProvider

    init(services: UseCaseProvider,
         navigationController: UINavigationController,
         storyBoard: UIStoryboard) {
        self.services = services
        self.navigationController = navigationController
        self.storyBoard = storyBoard
    }
    
    func toPosts() {
        let vc = storyBoard.instantiateViewController(ofType: RecipeListViewController.self)
        vc.viewModel = RecipeListViewModel()
        navigationController.pushViewController(vc, animated: true)
    }

    func toCreateRecipe() {
        let navigator = DefaultCreatePostNavigator(navigationController: navigationController)
        let viewModel = CreatePostViewModel(createPostUseCase: services.makePostsUseCase(),
                navigator: navigator)
        let vc = storyBoard.instantiateViewController(ofType: CreatePostViewController.self)
        vc.viewModel = viewModel
        let nc = UINavigationController(rootViewController: vc)
        navigationController.present(nc, animated: true, completion: nil)
    }

    func toRecipe(_ recipe: Recipe) {
        let navigator = DefaultEditPostNavigator(navigationController: navigationController)
        let viewModel = EditPostViewModel(post: post, useCase: services.makePostsUseCase(), navigator: navigator)
        let vc = storyBoard.instantiateViewController(ofType: EditPostViewController.self)
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
}
