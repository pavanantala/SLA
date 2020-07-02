namespace SoberLivingAmerica.Services.Helpers
{
    public class ResponseMessage
    {
        // Users Message
        public const string userAlreadyExist = "User with this email already exist.";
        public const string signup = "User has been successfully signed up.";
        public const string signin = "User has been successfully signed in.";
        public const string userNotFound = "User with this email not found.";
        public const string incorrectPassword = "Password is incorrect.";
        public const string userNotFoundWithId = "User not found.";
        public const string passwordDoesNotMatch = "Password does not match";
        public const string updateUser = "User has been updated successfully.";
        public const string changePassword = "Password has been changed successfully.";
        public const string sendPassword = "Password has been sent on your email successfully.";

        // Company Messages
        public const string CompanyNotExist = "Company not found";
        public const string CompanyAlreadyExist = "Company has already been registered with this email address.";
        public const string CompanyAdded = "Company has been successfully signed up.";
        public const string CompanyUpdated = "Company has been updated successfully.";

        // Subscription
        public const string SubscriptionAdded = "Subscription has been added successfully.";
        public const string SubscriptionAlreadyExist = "Subscription has been already register with '{0}' name.";
        public const string SubscriptionNotExist = "Subscription does not exist.";
        public const string SubscriptionUpdated = "Subscription has been updated successfully.";

        // Role
        public const string RoleAlreadyExist = "Role has been already register with '{0}' name.";
        public const string RoleNotExist = "Role does not exist.";
        public const string RoleAdded = "Subscription has been added successfully.";
        public const string RoleUpdated = "Subscription has been updated successfully.";

        // Sent Email
        public const string SentEmailAdded = "Email has been added successfully.";

        public const string GetResult = "Result has been get successfully.";
    }
}
