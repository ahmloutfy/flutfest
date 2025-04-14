# FlutFest - Event Management UI Kit

FlutFest is a sleek and modern Flutter UI kit designed for event management applications. This package includes professionally crafted screens for event organizers, businesses, and individuals looking to create a smooth and engaging event experience.

## 🚀 Features

- **Beautiful Welcome Screen** - Modern and engaging design.
- **User Authentication UI** - Login and sign-up screens with a clean interface.
- **Event Dashboard UI** - Overview of upcoming and past events.
- **Create & Manage Events UI** - Well-structured layouts for event details.
- **Ticket Management UI** - Pre-designed ticket display sections.
- **Event Invitations UI** - Interfaces for QR code or direct sharing.
- **Dark Mode Support** - Enhances the user experience.
- **Highly Customizable** - Easily modify styles, colors, and components.
- **Modular Structure** - Organized for easy expansion and integration.

## 📂 Folder Structure

```
FlutFest/
│── assets/                      # Images, icons, and fonts
│   │── fonts/                   
│   │── icons/                   
│   │── images/                   
│
│── lib/
│   │── constants.dart           # Common constants
│   │── main.dart                # Entry point
│   │── routes.dart              # UI navigation structure using GetX
│   │── theme.dart               # Theme configuration
│
│── lib/core/                    # Core utilities and services
│   │── bindings/                # GetX Bindings for dependency injection
│   │   │── auth_binding.dart
│   │   │── event_binding.dart
│   │
│   │── services/                # API services or local storage handling
│   │   │── auth_service.dart
│   │   │── event_service.dart
│   │
│   │── utils/                   # Helper functions like date formatting
│   │   │── date_utils.dart
│   │   │── validation_utils.dart
│
│── lib/logic/                   # Business logic (Replaces `viewmodels/`)
│   │── controllers/             # GetX Controllers
│   │   │── auth_controller.dart
│   │   │── event_controller.dart
│   │
│   │── models/                  # Data models
│   │   │── event_model.dart
│   │   │── user_model.dart
│   │
│   │── repositories/            # Data sources abstraction
│   │   │── auth_repository.dart
│   │   │── event_repository.dart
│



│── lib/views/                   # UI Screens
│   │── home/                    
│   │   │── home_screen.dart     # Home UI
│   │
│   │── login/                   
│   │   │── login_screen.dart    # Login UI
│   │
│   │── register/                   
│   │   │── register_screen.dart    # Login UI
│   │
│   │── welcome/                  
│   │   │── welcome_screen.dart  # Welcome screen UI
│
│── lib/widgets/                 # Reusable UI components
│   │── buttons/                 
│   │   │── primary_button.dart  # Custom button
│   │
│   │── cards/                   
│   │   │── event_card.dart      # Event detail card
│
│── pubspec.yaml                 # Dependencies and configurations
│── README.md                    # Documentation
```

## 📦 How to Use

1. Download the package from Gumroad.
2. Extract the files and integrate them into your Flutter project.
3. Customize the theme, fonts, and colors in `theme.dart`.
4. Modify screens as needed to fit your project requirements.
5. Add your own backend logic by integrating APIs in the `services/` and `repositories/` folders.

## 🎨 Customization

This UI kit is designed to be **highly customizable**. You can modify:
- **Theme & Colors**: Update `theme.dart` to match your brand.
- **Fonts**: Replace fonts in the `pubspec.yaml` file.
- **Navigation**: Modify `routes.dart` to change screen flow.
- **State Management**: By default, we use `GetX`, but you can replace it with `Provider`, `Bloc`, or any other method.

### Example: Changing the Primary Color
In `theme.dart`, update the primary color:
```
dart
ThemeData(
  primaryColor: Colors.blueAccent, // Change to any color you prefer
);

```

## 📌 Future Updates

- **Additional Event Templates**
- **Expanded UI Components**
- **Multi-theme Variants**
- **More State Management Options**

## 📬 Support & Contact

For inquiries or support, contact: `your-email@example.com`.

---

**FlutFest - The Ultimate Event Management UI Kit!** 🎉