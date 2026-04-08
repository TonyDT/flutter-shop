# 📦 项目结构说明
本项目基于 Flutter 构建，采用模块化分层设计，提升代码可维护性与扩展性。
---
## 🏗️ 架构模式
本项目采用 MVVM 架构：
- Model：数据层（API / 数据结构）
- View：UI层（pages）
- ViewModel：业务逻辑层（viewmodels）
## 🔧 技术选型
- 状态管理：GetX（按你实际写）
- 网络请求：Dio
- 路由管理：GoRouter / Navigator 2.0
- 数据持久化： shared_preferences
## 🚀 设计理念
  📦 模块化：按职责拆分目录
  🔄 解耦：UI 与业务逻辑分离
  ♻️ 可复用：组件与工具统一管理
  📈 可扩展：方便后续功能扩展
## ✨ 建议规范
  页面只处理 UI，不写业务逻辑
  API 请求统一走 api/
  公共组件禁止写业务耦合代码
  工具函数保持纯函数
## 📁 目录结构
```bash
lib/
├── api/           # 接口请求封装（HTTP/Dio等）
├── assets/        # 静态资源（图片、字体、配置文件等）
├── components/    # 公共组件（可复用UI组件）
├── constants/     # 全局常量（配置、枚举等）
├── viewmodels/    # 视图模型（MVVM数据处理层）
├── pages/         # 页面（UI视图）
├── routes/        # 路由配置（页面跳转管理）
├── stores/        # 全局状态管理（Provider / Riverpod / GetX等）
├── utils/         # 工具类（通用方法、工具函数）
└── main.dart      # 应用入口

🧠 分层说明
🔹 api
    封装所有网络请求
    统一处理请求参数、响应数据、错误处理
🔹 components
    可复用 UI 组件
    示例：按钮、弹窗、列表项等
🔹 viewmodels
    负责业务逻辑处理
    连接 UI 与数据层（MVVM 模式）
🔹 pages
    页面级组件
    只负责 UI 渲染和事件分发
🔹 stores
    全局状态管理
    用户信息、主题配置等共享数据
🔹 utils
    通用工具方法
    如：时间处理、格式化、校验等
🔹 routes
    路由统一管理
    支持命名路由 / 动态路由
🔹 constants
    全局常量定义
    API地址、Key、枚举等

## 安装

## 📦 依赖总览（可选）
| 功能 | 依赖包 | 版本 |
|------|--------|------|
| 轮播图 | carousel_slider | ^4.0.0 |
| 网络请求 | dio | ^5.0.0 |
| 状态管理 | provider | ^6.0.0 |

## 🚀 快速开始
1. 安装依赖
   ```bash
   flutter pub add carousel_slider
   flutter pub add dio
   flutter pub add cupertino_icons
   flutter pub add get
   flutter pub add shared_preferences
 

#flutter环境配置
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
#鸿蒙的
export PATH="/Users/taodong/Desktop/flutter/ohpm/flutter_flutter/bin:$PATH"
#官方正常的
#export PATH="$PATH:$HOME/development/flutter/bin"

