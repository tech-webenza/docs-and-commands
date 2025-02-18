Naming Conventions:
Example: class UserManager, function processPayment(), let totalAmount.

    Upper camel case (PascalCase) is usually for class names, while lower camel case is for variables and functions.

Snake_case (for variables, constants):

    Example: const MAX_USERS, let user_count.
    Constants are often in UPPER_SNAKE_CASE.

Kebab-case (for URLs and some configs):

    Example: /user-profile, GET /api/v1/tickets-list.

Hierarchical structure for namespaces:
Example: In a multi-layered application, you may have namespaces like Controllers, Services, Models to separate logic.
App.Web.Controllers, App.Core.Services, App.Data.Models.Class Names:

    Meaningful and Specific: Class names should clearly indicate the purpose of the class.
        Example: Instead of Manager, use UserManager or OrderProcessor.

Avoid abbreviations: Use full words to avoid confusion.

    Example: Prefer CustomerController over CustCtrl.

Function and Method Names:

    Use descriptive names: The function name should explain what it does.
        Example: calculateTotalPrice(), sendUserNotification().
    Avoid side-effects: Functions should do what their names imply without unintended changes to the system.

URL Readability:

    Use meaningful paths: URLs should be human-readable and describe the resource.
        Example: /users/{userId}/profile instead of /users/show/12.
    Lowercase letters only: URLs should be lowercase to avoid confusion with case-sensitive paths.
    Hyphens instead of underscores: Hyphens are more readable.
        Example: /user-profile rather than /user_profile.
    Avoid long URLs: Keep the URL structure simple and concise.
        Example: /products/electronics is better than /categories/12/products/78.

Code Readability and Structure:

    Keep code DRY (Don't Repeat Yourself): Avoid duplicating code by creating reusable functions and components.

FINALLY:
Code comments: Use inline comments for complex logic and functions to explain what the code does.Versioning in URLs (for APIs):

    Use version numbers in the URL to keep track of changes.
        Example: /api/v1/users, /api/v2/users.
