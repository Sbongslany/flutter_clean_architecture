# provider_clean

#  Either class and Failure class for handling errors 
Start with Either and then Failure class for handling tasks failure

# Core business logic
Entity class
Repository
UseCases
Data layer : (Model for FROM JSON AND TO JSON)
            :(DATASOURCE RESPONSIBLE FOR FETCHING DATA THROUGH API OR DATABASE)
            : (REPOSITORY FROM DATASOURCE - linking it with data source)

Presentation (Provider state management)
            :   TasksProvider - inherit change notifier, this allow us to change the state through widgets
            :   TaskProvider by Id - inherit change notifier, this allow us to change the state through widgets

Dependency injection
            :   Use get_it package for injecting all the widgets

Pages
    :   