# Pop-up Design Specifications

## Pixel-Perfect Design Documentation

This document contains the exact design specifications for the PasswordPopUp and OtpPopUp components to ensure pixel-perfect implementation matching the provided UI designs.

---

## 🔐 PasswordPopUp Design Specifications

### Container Specifications
| Property | Value | Type |
|----------|-------|------|
| Background Color | `#FFFFFF` (White) | Color |
| Border Radius | `16.r` | Rounded |
| Horizontal Padding | `24.w` | Spacing |
| Vertical Padding | `32.h` | Spacing |
| Horizontal Inset | `24.w` | Dialog Margin |
| Width | `double.infinity` | Full Width |

### Logo Section
| Property | Value | Type |
|----------|-------|------|
| Source | `AppImages.logo` | Asset |
| Height | `80.h` | Dimension |
| Width | `80.w` | Dimension |
| Spacing Below | `16.h` | Margin |

### Title (JOBARMAN)
| Property | Value | Type |
|----------|-------|------|
| Text | "JOBARMAN" | String |
| Font Size | `24.sp` | Size |
| Font Weight | `w700` (Bold) | Weight |
| Color | `#FF8F27` (Orange) | Color |
| Alignment | `Center` | Alignment |
| Spacing Below | `24.h` | Margin |

### Subtitle Text
| Property | Value | Type |
|----------|-------|------|
| Text | "For Security, Enter Your Account Password\nTo Continue To Payment History." | String (Multi-line) |
| Font Size | `12.sp` | Size |
| Font Weight | `w400` (Regular) | Weight |
| Color | `#000000` (Black) | Color |
| Alignment | `Center` | Alignment |
| Max Lines | `3` | Lines |
| Spacing Below | `24.h` | Margin |

### Password Label
| Property | Value | Type |
|----------|-------|------|
| Text | "Password" | String |
| Font Size | `14.sp` | Size |
| Font Weight | `w500` (Medium) | Weight |
| Color | `#000000` (Black) | Color |
| Alignment | `Left` | Alignment |
| Spacing Below | `8.h` | Margin |

### Password Input Field
| Property | Value | Type |
|----------|-------|------|
| Hint Text | "••••••••••" | String |
| Border Radius | `8.r` | Rounded |
| Border Color | `#C8C8C8` | Color |
| Border Width | `1` | Width |
| Fill Color | `#FFFFFF` (White) | Color |
| Font Size | `14.sp` | Size |
| Text Color | `#2F2F2F` | Color |
| Obscure Text | `true` (Toggleable) | Boolean |
| Text Input Action | `done` | Action |
| Spacing Below | `24.h` | Margin |

### Eye Icon (Password Toggle)
| Property | Value | Type |
|----------|-------|------|
| Icon Size | `20.sp` | Size |
| Icon Color | `#2F2F2F` | Color |
| Icons | `visibility_outlined` / `visibility_off_outlined` | Material Icons |
| Position | Suffix (Right) | Position |

### Continue Button
| Property | Value | Type |
|----------|-------|------|
| Text | "Continue" | String |
| Font Size | `16.sp` | Size |
| Font Weight | `w600` (SemiBold) | Weight |
| Text Color | `#FFFFFF` (White) | Color |
| Button Height | `48.h` | Dimension |
| Button Width | `double.infinity` | Full Width |
| Border Radius | `8.r` | Rounded |
| Background | Gradient | Style |
| Gradient Start | `#123499` | Color |
| Gradient End | `#2956DD` | Color |
| Gradient Direction | `Horizontal (0.00, 0.50) to (1.00, 0.50)` | Vector |

---

## 📱 OtpPopUp Design Specifications

### Container Specifications
| Property | Value | Type |
|----------|-------|------|
| Background Color | `#FFFFFF` (White) | Color |
| Border Radius | `16.r` | Rounded |
| Horizontal Padding | `24.w` | Spacing |
| Vertical Padding | `32.h` | Spacing |
| Horizontal Inset | `24.w` | Dialog Margin |
| Width | `double.infinity` | Full Width |

### Title (OTP Verification)
| Property | Value | Type |
|----------|-------|------|
| Text | "OTP Verification" | String |
| Font Size | `20.sp` | Size |
| Font Weight | `w700` (Bold) | Weight |
| Color | `#000000` (Black) | Color |
| Alignment | `Center` | Alignment |
| Spacing Below | `16.h` | Margin |

### Subtitle Text
| Property | Value | Type |
|----------|-------|------|
| Text | "Enter The 6-Digit Code We Sent To\nYour Email To Verify Your Payment." | String (Multi-line) |
| Font Size | `13.sp` | Size |
| Font Weight | `w400` (Regular) | Weight |
| Color | `#000000` (Black) | Color |
| Alignment | `Center` | Alignment |
| Max Lines | `3` | Lines |
| Spacing Below | `32.h` | Margin |

### OTP Input Boxes (Each Box)
| Property | Value | Type |
|----------|-------|------|
| Width | `45.w` | Dimension |
| Height | `50.h` | Dimension |
| Border Radius | `8.r` | Rounded |
| Border Color | `#123499` (Primary Blue) | Color |
| Border Width | `1.5` | Width |
| Background Color | `#FFFFFF` (White) | Color |
| Horizontal Spacing | `4.w` (Between boxes) | Margin |
| Count | `6` | Quantity |

### OTP Input Text Style
| Property | Value | Type |
|----------|-------|------|
| Font Size | `20.sp` | Size |
| Font Weight | `w600` (SemiBold) | Weight |
| Color | `#000000` (Black) | Color |
| Alignment | `Center` | Alignment |
| Max Length | `1` | Character |
| Keyboard Type | `number` | Input Type |
| Input Filter | `Digits Only` | Validation |

### OTP Boxes Row
| Property | Value | Type |
|----------|-------|------|
| Main Alignment | `Center` | Alignment |
| Total Boxes | `6` | Count |
| Spacing Below | `24.h` | Margin |

### Resend Text Section
| Property | Value | Type |
|----------|-------|------|
| Main Text | "Didn't receive a code? " | String |
| Main Text Font Size | `13.sp` | Size |
| Main Text Font Weight | `w400` (Regular) | Weight |
| Main Text Color | `#979797` (Grey) | Color |
| Link Text | "Resend" | String |
| Link Text Font Size | `13.sp` | Size |
| Link Text Font Weight | `w600` (SemiBold) | Weight |
| Link Text Color | `#123499` (Primary Blue) | Color |
| Alignment | `Center` | Alignment |
| Spacing Below | `24.h` | Margin |
| Interactive | `true` (Tappable) | Boolean |

### Verify Button
| Property | Value | Type |
|----------|-------|------|
| Text | "Verify" | String |
| Font Size | `16.sp` | Size |
| Font Weight | `w600` (SemiBold) | Weight |
| Text Color | `#FFFFFF` (White) | Color |
| Button Height | `48.h` | Dimension |
| Button Width | `double.infinity` | Full Width |
| Border Radius | `8.r` | Rounded |
| Background | Gradient | Style |
| Gradient Start | `#123499` | Color |
| Gradient End | `#2956DD` | Color |
| Gradient Direction | `Horizontal (0.00, 0.50) to (1.00, 0.50)` | Vector |

---

## 🎨 Color Palette Reference

### Primary Colors
```dart
AppColors.primaryColor      = #123499  // Primary Blue
AppColors.secondaryPrimary  = #FF8F27  // Orange
AppColors.white             = #FFFFFF  // White
AppColors.black             = #000000  // Black
AppColors.grey              = #979797  // Grey
AppColors.borderColor       = #C8C8C8  // Border Grey
AppColors.primaryText       = #2F2F2F  // Text Dark
AppColors.gradientColor     = #123499  // Gradient Start
AppColors.gradientColor2    = #2956DD  // Gradient End
```

---

## 📏 Spacing System

### Consistent Spacing Values
| Name | Value | Usage |
|------|-------|-------|
| Extra Small | `8.h` | Label to input spacing |
| Small | `16.h` | Logo to title spacing |
| Medium | `24.h` | Between major sections |
| Large | `32.h` | Container padding (vertical) |
| Container Horizontal | `24.w` | Container padding (horizontal) |
| OTP Box Spacing | `4.w` | Between OTP input boxes |

---

## 🔤 Typography System

### Font Family
- **Primary Font**: Poppins (via Google Fonts)

### Font Weights
| Weight | Value | Usage |
|--------|-------|-------|
| Regular | `w400` | Body text, descriptions |
| Medium | `w500` | Labels |
| SemiBold | `w600` | Buttons, links |
| Bold | `w700` | Titles, headings |

### Font Sizes
| Size | Usage |
|------|-------|
| `12.sp` | Subtitle/description (PasswordPopUp) |
| `13.sp` | Subtitle/description (OtpPopUp), resend text |
| `14.sp` | Labels, input text |
| `16.sp` | Button text |
| `20.sp` | Title (OtpPopUp), OTP digits |
| `24.sp` | Title (PasswordPopUp - JOBARMAN) |

---

## 🎯 Interactive Elements

### Button Interactions
- **Tap Animation**: Scale down by 15% (0.85)
- **Animation Duration**: 100ms
- **Gradient**: Linear gradient from left to right
- **Ripple Effect**: InkWell with border radius matching button

### Password Field Interactions
- **Eye Icon**: Toggle between visible/hidden states
- **Focus**: Border color remains same (no focus change)
- **Input Type**: Password (dots)

### OTP Field Interactions
- **Auto-Focus**: Moves to next field on digit entry
- **Backspace**: Moves to previous field when current is empty
- **Input Validation**: Only numeric digits (0-9)
- **Max Length**: 1 character per box
- **Focus Indicator**: Native cursor

---

## 📱 Responsive Design

All measurements use flutter_screenutil for responsive sizing:
- `.w` - Width responsive
- `.h` - Height responsive
- `.sp` - Font size responsive
- `.r` - Border radius responsive

### Design Reference Resolution
- Assumed design base: 375x812 (iPhone X)
- All sizes scale proportionally

---

## ✅ Pixel-Perfect Checklist

### PasswordPopUp
- [x] Logo size matches exactly (80x80)
- [x] JOBARMAN color is orange (#FF8F27)
- [x] Title font size is 24sp
- [x] Subtitle is centered and multi-line
- [x] Password field has eye icon
- [x] Password dots are visible as placeholder
- [x] Continue button has gradient background
- [x] Button text is white and centered
- [x] All spacing matches design
- [x] Border radius is 16 for dialog, 8 for inputs/buttons

### OtpPopUp
- [x] Title is "OTP Verification" in bold
- [x] Exactly 6 OTP input boxes
- [x] Each box is 45x50 pixels
- [x] Border color is primary blue (#123499)
- [x] Border width is 1.5
- [x] Spacing between boxes is 4w
- [x] Text inside boxes is centered
- [x] Font size for digits is 20sp
- [x] "Resend" link is blue and clickable
- [x] Verify button has gradient background
- [x] All spacing matches design

---

## 🔧 Implementation Notes

### CommonTextField Integration
The PasswordPopUp uses the existing CommonTextField which includes:
- Built-in password visibility toggle
- Automatic obscure text management
- Reactive eye icon (GetX observable)
- Consistent styling with rest of app

### Button Gradient Implementation
Both pop-ups use CommonButton which provides:
- Pre-configured gradient from AppColors
- Scale animation on tap
- Loading state support
- Consistent styling across app

### OTP Custom Implementation
The OTP boxes are custom TextFormFields because:
- Need individual focus control
- Require single-character limitation
- Need custom border styling
- Must support auto-navigation

---

## 📸 Design Comparison

### PasswordPopUp Match Points
1. ✅ Logo placement and size
2. ✅ JOBARMAN text color and size
3. ✅ Subtitle text content and styling
4. ✅ Password label positioning
5. ✅ Password field with dots and eye icon
6. ✅ Continue button gradient and text
7. ✅ Overall spacing and padding
8. ✅ Dialog shape and shadow

### OtpPopUp Match Points
1. ✅ Title text and styling
2. ✅ Subtitle content and formatting
3. ✅ 6 individual OTP boxes
4. ✅ Box size and border styling
5. ✅ Box spacing
6. ✅ Resend text with blue link
7. ✅ Verify button gradient and text
8. ✅ Overall spacing and padding
9. ✅ Dialog shape and shadow

---

**Design Version**: 1.0  
**Last Updated**: October 2024  
**Design Status**: ✅ Pixel-Perfect Match Achieved
