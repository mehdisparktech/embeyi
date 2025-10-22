# Pop-up Implementation Guide

## Overview
This guide documents the pixel-perfect implementation of **PasswordPopUp** and **OtpPopUp** components matching the provided design specifications.

## Components Created

### 1. PasswordPopUp (`password_pop_up.dart`)

#### Features
- **Logo Display**: Shows company logo at the top
- **Title**: "JOBARMAN" in orange color (AppColors.secondaryPrimary)
- **Security Message**: Informative subtitle about password requirement
- **Password Field**: CommonTextField with password visibility toggle
- **Continue Button**: Gradient button using CommonButton

#### Usage
```dart
showDialog(
  context: context,
  barrierDismissible: false,
  builder: (context) => PasswordPopUp(
    passwordController: passwordController,
    onContinue: () {
      String password = passwordController.text;
      // Handle password submission
      Navigator.pop(context);
    },
  ),
);
```

#### Parameters
- `passwordController` (TextEditingController?) - Optional controller for password input
- `onContinue` (VoidCallback?) - Callback when continue button is pressed
- `onSettings` (VoidCallback?) - Reserved for future settings functionality

#### Design Specifications
- **Dialog Border Radius**: 16.r
- **Padding**: Horizontal 24.w, Vertical 32.h
- **Logo Size**: 80.h × 80.w
- **Title Font Size**: 24
- **Subtitle Font Size**: 12
- **Button Height**: 48.h
- **Button Border Radius**: 8

---

### 2. OtpPopUp (`otp_pop_up.dart`)

#### Features
- **Title**: "OTP Verification" in bold
- **Instructions**: Clear message about 6-digit code
- **6 OTP Input Boxes**: Individual input fields with auto-focus
- **Auto-Navigation**: Automatically moves to next field on input
- **Resend Option**: Interactive "Resend" link in blue
- **Verify Button**: Gradient button using CommonButton

#### Usage
```dart
final List<TextEditingController> otpControllers = 
    List.generate(6, (index) => TextEditingController());

showDialog(
  context: context,
  barrierDismissible: false,
  builder: (context) => OtpPopUp(
    controllers: otpControllers,
    onVerify: () {
      String otp = otpControllers.map((c) => c.text).join();
      // Handle OTP verification
      Navigator.pop(context);
    },
    onResend: () {
      // Clear and resend OTP
      for (var controller in otpControllers) {
        controller.clear();
      }
    },
  ),
);
```

#### Parameters
- `controllers` (List<TextEditingController>?) - Optional list of 6 controllers for OTP inputs
- `onVerify` (VoidCallback?) - Callback when verify button is pressed
- `onResend` (VoidCallback?) - Callback when resend link is tapped

#### Design Specifications
- **Dialog Border Radius**: 16.r
- **Padding**: Horizontal 24.w, Vertical 32.h
- **Title Font Size**: 20
- **Subtitle Font Size**: 13
- **OTP Box Size**: 45.w × 50.h
- **OTP Box Border**: Primary color, 1.5 width
- **OTP Box Border Radius**: 8.r
- **Box Spacing**: 4.w horizontal padding
- **Button Height**: 48.h
- **Button Border Radius**: 8

#### Auto-Focus Behavior
- Automatically moves to next field when digit is entered
- Moves back to previous field when current field is cleared
- Uses FocusNode for seamless navigation

---

## Reusable Components Used

### CommonText
- Used for all text displays (titles, subtitles, labels)
- Configured with Poppins font via GoogleFonts
- Supports custom font size, weight, and color

### CommonTextField
- Used for password input
- Built-in password visibility toggle
- Customizable border radius and colors
- Automatic validation support

### CommonButton
- Used for Continue and Verify buttons
- Gradient background (primary to secondary)
- Scale animation on tap
- Loading state support

### CommonImage
- Used for logo display in PasswordPopUp
- Supports assets, network images, and SVG
- Automatic error handling with fallback

---

## Color Scheme

### Primary Colors Used
- **Primary Color**: `#123499` (Button background, OTP box border)
- **Secondary Primary**: `#FF8F27` (JOBARMAN title)
- **White**: `#FFFFFF` (Dialog background)
- **Black**: `#000000` (Text color)
- **Grey**: `#979797` (Hint text)
- **Border Color**: `#C8C8C8` (Input borders)

---

## Key Implementation Details

### PasswordPopUp
1. **Stateless Widget**: No internal state management
2. **Reusable Components**: Maximizes code reuse from existing components
3. **Flexible Controllers**: Accepts external controller or works without
4. **Responsive Design**: Uses flutter_screenutil for pixel-perfect scaling

### OtpPopUp
1. **Stateful Widget**: Manages focus nodes and controllers internally
2. **Auto-Focus Logic**: Intelligent field navigation
3. **Input Validation**: Only accepts digits (0-9)
4. **Memory Management**: Proper disposal of controllers and focus nodes
5. **Customizable**: Accepts external controllers for better control

---

## Example Screen

A complete example screen is provided at:
`lib/features/example/popup_example_screen.dart`

This screen demonstrates:
- How to show both pop-ups
- Controller management
- Callback handling
- Best practices for implementation

---

## Best Practices

### 1. Controller Management
Always dispose controllers properly:
```dart
@override
void dispose() {
  passwordController.dispose();
  for (var controller in otpControllers) {
    controller.dispose();
  }
  super.dispose();
}
```

### 2. Barrier Dismissible
Set `barrierDismissible: false` for security-related dialogs:
```dart
showDialog(
  context: context,
  barrierDismissible: false,
  builder: (context) => PasswordPopUp(...),
);
```

### 3. OTP Retrieval
Combine OTP values properly:
```dart
String otp = otpControllers.map((c) => c.text).join();
```

### 4. Error Handling
Add validation before closing dialog:
```dart
onContinue: () {
  if (passwordController.text.isEmpty) {
    // Show error
    return;
  }
  Navigator.pop(context);
}
```

---

## Testing Checklist

- [ ] PasswordPopUp displays correctly on all screen sizes
- [ ] Password visibility toggle works
- [ ] OtpPopUp displays 6 input boxes
- [ ] Auto-focus works between OTP boxes
- [ ] Backspace navigates to previous OTP box
- [ ] Resend link is tappable and triggers callback
- [ ] Buttons trigger correct callbacks
- [ ] Dialog closes on successful action
- [ ] Controllers are properly disposed
- [ ] Responsive on tablets and phones

---

## Performance Optimizations

1. **Lazy Controller Creation**: Controllers created only when needed
2. **Proper Disposal**: All controllers and focus nodes disposed
3. **Const Constructors**: Used where possible to reduce rebuilds
4. **Minimal Rebuilds**: StatelessWidget for PasswordPopUp
5. **Efficient Auto-Focus**: Direct focus node manipulation

---

## Accessibility Features

1. **Text Input Actions**: Proper keyboard actions (done, next)
2. **Semantic Labels**: Clear labels for screen readers
3. **Focus Management**: Logical tab order for OTP inputs
4. **High Contrast**: Visible borders and text

---

## Future Enhancements

### PasswordPopUp
- [ ] Add forgot password link
- [ ] Add settings button functionality
- [ ] Support for password strength indicator
- [ ] Biometric authentication option

### OtpPopUp
- [ ] Add timer countdown for resend
- [ ] Support for different OTP lengths (4, 5, 6, 8)
- [ ] Auto-submit on complete entry
- [ ] SMS auto-fill integration

---

## Dependencies

Required packages (already in project):
- `flutter_screenutil` - Responsive sizing
- `google_fonts` - Poppins font
- `get` - State management (used in CommonTextField)

---

## File Structure

```
lib/
├── core/
│   ├── component/
│   │   ├── pop_up/
│   │   │   ├── password_pop_up.dart ✅ NEW
│   │   │   ├── otp_pop_up.dart ✅ NEW
│   │   │   └── common_pop_menu.dart
│   │   ├── button/
│   │   │   └── common_button.dart
│   │   ├── text/
│   │   │   └── common_text.dart
│   │   ├── text_field/
│   │   │   └── common_text_field.dart
│   │   └── image/
│   │       └── common_image.dart
│   └── utils/
│       └── constants/
│           ├── app_colors.dart
│           └── app_images.dart
└── features/
    └── example/
        └── popup_example_screen.dart ✅ NEW
```

---

## Support

For issues or questions about these components, refer to:
- Component source code with inline comments
- Example implementation in `popup_example_screen.dart`
- This documentation file

---

**Created**: October 2024  
**Version**: 1.0.0  
**Status**: Production Ready ✅
