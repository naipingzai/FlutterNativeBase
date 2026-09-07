# FlutterNativeBase

English | [简体中文](#简体中文)

A cross-platform native bridge framework for Flutter, providing efficient FFI integration with C/C++ code. Built with the modern `package_ffi` template and `hook/build.dart` approach — zero configuration needed.

## Features

- **Zero-config FFI**: C code compiles automatically via `hook/build.dart`, no CMakeLists.txt needed
- **Cross-platform**: Linux, Android (iOS/Windows/macOS ready)
- **Internationalization**: Built-in English and Simplified Chinese support
- **Clean Architecture**: Three-layer Dart FFI design (bindings → types → service)
- **Single Header**: All FFI interfaces defined in `native/include/bridge_api.h`


## Material 3 Design Guidelines

### Theme

- Seed color:  (professional teal-green)
- Supports light/dark themes, follows system via 
- All colors generated from seed color for visual consistency

### Components

| Component | M3 Spec |
|-----------|---------|
| AppBar | Surface color, elevation: 0, scrolledUnderElevation: 1 |
| Card | elevation: 0, outlineVariant border, borderRadius: 16 |
| FilledButton.tonal | Tonal fill for action buttons |
| IconButton.filledTonal | Tonal container for AppBar actions |
| Divider | 1px outlineVariant, height: 24 |
| Icon | size: 20, color: primary |

### Layout

- Screen padding: 
- Card padding: 
- Section spacing: 24px
- Section title: titleSmall, primary color, fontWeight: w600
- Info tile: icon(20px) + label(110px fixed) + value(bodyMedium, w500)

### Header Banner

-  hero section
- Logo: 56x56 icon with borderRadius: 16
- Text:  with alpha hierarchy

### Color Hierarchy

| Element | Light | Dark |
|---------|-------|------|
| Background | surface | surface |
| Cards | surface + outlineVariant | surface + outlineVariant |
| Header | primaryContainer | primaryContainer |
| Primary | onSurface | onSurface |
| Secondary | onSurfaceVariant | onSurfaceVariant |
| Accent | primary | primary |

## Project Structure

```
flutter_native_base/
├── lib/
│   ├── flutter_native_base.dart        # Library entry point
│   ├── l10n/                           # Localization (en/zh)
│   └── src/
│       └── ffi/
│           ├── native_bindings.dart     # FFI declarations
│           ├── native_types.dart        # Type mappings & error codes
│           └── native_service.dart      # Service layer
├── native/                             # C source code
│   ├── include/
│   │   └── bridge_api.h               # Single public header
│   ├── src/
│   │   ├── core/
│   │   │   ├── math_utils.c           # Math functions
│   │   │   └── string_utils.c         # String functions
│   │   └── bridge_api.c               # Bridge implementation
│   └── CMakeLists.txt
├── hook/
│   └── build.dart                     # Build hook (auto-compile)
├── assets/icons/                      # App icon
├── ffigen.yaml                        # FFI binding generator config
├── l10n.yaml                          # Localization config
└── pubspec.yaml
```

## Getting Started

### Prerequisites

- Flutter 3.38+
- Dart 3.10+
- C compiler (gcc/clang on Linux, NDK on Android)

### Build

```bash
# Linux
flutter build linux

# Android
flutter build apk
```

### Add New FFI Function

1. Add declaration to `native/include/bridge_api.h`:
   ```c
   FFI_PLUGIN_EXPORT intptr_t my_function(intptr_t arg);
   ```

2. Implement in `native/src/core/` (create new file if needed)

3. Regenerate bindings:
   ```bash
   dart run ffigen --config ffigen.yaml
   ```

4. Add Dart wrapper in `lib/src/ffi/native_bindings.dart`

## Tech Stack

- Flutter 3.38+ with Material 3
- `package:hooks` + `package:native_toolchain_c` for native compilation
- `package:ffigen` for automatic Dart binding generation
- `package:ffi` for Dart FFI utilities
- `flutter_localizations` for i18n

## Repository

- GitHub: [naipingzai/FlutterNativeBase](https://github.com/naipingzai/FlutterNativeBase)
- Package: `com.naipingzai.flutter_native_base`

---

# 简体中文

English | 简体中文

Flutter 跨平台原生桥接基础工程，提供 Flutter 与 C/C++ 原生代码的高效 FFI 桥接。基于 `package_ffi` 模板和 `hook/build.dart` 方案构建，零配置即可添加 FFI 接口。

## 核心特性

- **零配置 FFI**：C 代码通过 `hook/build.dart` 自动编译，无需 CMakeLists.txt
- **跨平台支持**：Linux、Android（iOS/Windows/macOS 就绪）
- **国际化**：内置简体中文和英文支持
- **清晰架构**：三层 Dart FFI 设计（绑定 → 类型 → 服务）
- **单一头文件**：所有 FFI 接口统一定义在 `native/include/bridge_api.h`

## 项目结构

```
flutter_native_base/
├── lib/
│   ├── flutter_native_base.dart        # 库入口
│   ├── l10n/                           # 国际化资源（中/英）
│   └── src/
│       └── ffi/
│           ├── native_bindings.dart     # FFI 函数声明
│           ├── native_types.dart        # 类型映射与错误码
│           └── native_service.dart      # 封装服务层
├── native/                             # C 源代码
│   ├── include/
│   │   └── bridge_api.h               # 唯一公开接口头文件
│   ├── src/
│   │   ├── core/
│   │   │   ├── math_utils.c           # 数学函数
│   │   │   └── string_utils.c         # 字符串函数
│   │   └── bridge_api.c               # 接口实现
│   └── CMakeLists.txt
├── hook/
│   └── build.dart                     # 编译钩子（自动编译）
├── assets/icons/                      # 应用图标
├── ffigen.yaml                        # FFI 绑定生成器配置
├── l10n.yaml                          # 国际化生成配置
└── pubspec.yaml
```

## 快速开始

### 环境要求

- Flutter 3.38+
- Dart 3.10+
- C 编译器（Linux 使用 gcc/clang，Android 使用 NDK）

### 构建

```bash
# Linux
flutter build linux

# Android
flutter build apk
```

### 添加新 FFI 接口

1. 在 `native/include/bridge_api.h` 中添加声明：
   ```c
   FFI_PLUGIN_EXPORT intptr_t my_function(intptr_t arg);
   ```

2. 在 `native/src/core/` 中实现（需要时创建新文件）

3. 重新生成绑定代码：
   ```bash
   dart run ffigen --config ffigen.yaml
   ```

4. 在 `lib/src/ffi/native_bindings.dart` 中添加 Dart 封装

## 技术栈

- Flutter 3.38+ Material 3
- `package:hooks` + `package:native_toolchain_c` 原生编译
- `package:ffigen` 自动生成 Dart FFI 绑定
- `package:ffi` Dart FFI 工具库
- `flutter_localizations` 国际化支持

## 仓库信息

- 仓库地址：[naipingzai/FlutterNativeBase](https://github.com/naipingzai/FlutterNativeBase)
- 包名：`com.naipingzai.flutter_native_base`

