# MotoDoc

**MotoDoc** is a Flutter-based mobile application designed to streamline automotive service management. It connects car owners with qualified mechanics, simplifies maintenance tracking, and manages repair requests.

## Features

*   **Car Owner Dashboard**:
    *   Manage personal vehicles (add/edit vehicle details like VIN, Make, Model).
    *   Request repairs and maintenance services.
    *   Track active service requests and subscriptions.
    *   View maintenance history and invoices.
*   **Mechanic Discovery**: Find and view profiles of local mechanics.
*   **Authentication**: Secure login and registration for Car Owners.
*   **Notifications**: Real-time updates on service status.

## Getting Started

### Prerequisites

*   [Flutter SDK](https://flutter.dev/docs/get-started/install) installed on your machine.
*   An IDE like VS Code or Android Studio.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/moto_doc.git
    cd moto_doc
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Run the application:**
    *   **Chrome (Web):**
        ```bash
        flutter run -d chrome
        ```
    *   **Linux (Desktop):**
        ```bash
        flutter run -d linux
        ```
    *   **Mobile (Android/iOS):**
        Connect your device or start an emulator/simulator, then run:
        ```bash
        flutter run
        ```

## Project Structure

*   `lib/`
    *   `main.dart`: Entry point of the application.
    *   `screens/`: Top-level screens (Home, Login, Register).
    *   `pages/`: Content pages for specific features (Dashboard, Requests, Car Owner Profile).
    *   `widgets/`: Reusable UI components.
    *   `theme/`: App theming configuration (Colors, Typography).

## Configuration

*   **Theme**: The app uses a custom Green theme defined in `lib/theme/app_theme.dart`.
*   **Assets**: Images and other assets are stored in `assets/images/`.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any bugs or feature requests.
