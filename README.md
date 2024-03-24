
# Animelist

## Overview

This project is a Flutter application, implementing clean architecture with a **feature-first** approach. It utilizes repositories, use cases, and data sources to organize and manage data flow effectively.

## Architecture

The architecture of this project follows clean architecture principles, separating concerns into distinct layers **under 'Feature':**

-   **Presentation Layer:** Implements UI components and interacts with the domain layer.
-   **Domain Layer:** Contains business logic and defines entities, use cases, and repositories.
-   **Data Layer:** Handles data retrieval and storage, interacting with external sources.

## Components

-   **Repository:** Manages data persistence and retrieval, abstracting away the data source implementation details.
-   **Use Case:** Implements business logic and orchestrates data flow between the presentation and data layers.
-   **Data Source:** Provides an interface for fetching data from external sources such as APIs or databases.

## Testing

This project includes comprehensive testing for use cases and repositories to ensure the correctness and reliability of the business logic and data management.

-   **Use Case Tests:** Verify the behavior and output of individual use cases.
-   **Repository Tests:** Ensure that data is stored and retrieved correctly, mocking external dependencies for isolated testing.

## Dependencies

-   **goRouter:** Handles routing within the application, facilitating navigation between screens.
-   **http:** Provides functionality for making HTTP requests, enabling communication with external APIs.

## References

This project was developed with inspiration from the following repository: [flutter-boilerplate](https://github.com/wisnuwiry/flutter-starter/tree/main)

## Note

This project does not include golden or UI tests at the moment.

