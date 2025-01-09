#!/bin/bash

# 设置环境变量避免编码问题
export LC_ALL=C

# 检查输入参数
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <new_package_name>"
  echo "Example: $0 com.codera.streaming"
  exit 1
fi

NEW_PACKAGE_NAME=$1
PROJECT_NAME=$(echo $NEW_PACKAGE_NAME | awk -F. '{print $NF}') # 提取项目名称
OLD_PACKAGE_NAME="com.codera.template"
OLD_DART_PACKAGE="template"

# 克隆模板项目
git clone https://github.com/bakboem/flutter-template.git $PROJECT_NAME
cd $PROJECT_NAME || exit

# 替换 pubspec.yaml 中的项目名称
sed -i "" "s/^name: .*/name: $PROJECT_NAME/" pubspec.yaml

# 替换 Android 包名
sed -i "" "s/$OLD_PACKAGE_NAME/$NEW_PACKAGE_NAME/" android/app/src/main/AndroidManifest.xml
sed -i "" "s/$OLD_PACKAGE_NAME/$NEW_PACKAGE_NAME/" android/app/src/debug/AndroidManifest.xml
sed -i "" "s/$OLD_PACKAGE_NAME/$NEW_PACKAGE_NAME/" android/app/src/profile/AndroidManifest.xml

# 替换 Android 的 build.gradle 文件
sed -i "" "s/$OLD_PACKAGE_NAME/$NEW_PACKAGE_NAME/" android/app/build.gradle

# 替换 Android 包路径
NEW_PATH=$(echo $NEW_PACKAGE_NAME | tr '.' '/')
OLD_PATH=$(echo $OLD_PACKAGE_NAME | tr '.' '/')

# 创建新包路径并移动文件
mkdir -p android/app/src/main/kotlin/$NEW_PATH
if [ -d android/app/src/main/kotlin/$OLD_PATH ]; then
  mv android/app/src/main/kotlin/$OLD_PATH/* android/app/src/main/kotlin/$NEW_PATH/
  rm -rf android/app/src/main/kotlin/$OLD_PATH
fi

# 替换所有 .kt 文件中的 package 和包名字符串
find android/app/src/main/kotlin/$NEW_PATH -type f -name "*.kt" -exec sed -i "" "s/$OLD_PACKAGE_NAME/$NEW_PACKAGE_NAME/g" {} +

# 替换 Dart 文件中的 import 路径和包名
find lib -type f -name "*.dart" -exec sed -i "" "s/package:$OLD_DART_PACKAGE/package:$PROJECT_NAME/g" {} +
find lib -type f -name "*.dart" -exec sed -i "" "s/$OLD_PACKAGE_NAME/$NEW_PACKAGE_NAME/g" {} +

# 替换特定文件 lib/config/app_config.dart 中的包名
APP_CONFIG_FILE="lib/config/app_config.dart"
if [ -f $APP_CONFIG_FILE ]; then
  sed -i "" "s/$OLD_PACKAGE_NAME/$NEW_PACKAGE_NAME/g" $APP_CONFIG_FILE
  sed -i "" "s/package:$OLD_DART_PACKAGE/package:$PROJECT_NAME/g" $APP_CONFIG_FILE
fi

# 替换 iOS 包名
sed -i "" "s/$OLD_PACKAGE_NAME/$NEW_PACKAGE_NAME/" ios/Runner.xcodeproj/project.pbxproj
find ios/Runner.xcodeproj -type f -exec sed -i "" "s/$OLD_PACKAGE_NAME/$NEW_PACKAGE_NAME/g" {} +
sed -i "" "s/$OLD_PACKAGE_NAME/$NEW_PACKAGE_NAME/" ios/Runner/Info.plist

# 替换 iOS AppDelegate.swift 中的引用
APP_DELEGATE="ios/Runner/AppDelegate.swift"
if [ -f $APP_DELEGATE ]; then
  sed -i "" "s/$OLD_PACKAGE_NAME/$NEW_PACKAGE_NAME/g" $APP_DELEGATE
fi

# 打印完成信息
echo "New project $PROJECT_NAME created with package name $NEW_PACKAGE_NAME!"


# icon
dart run flutter_launcher_icons -f '/Users/bakbeom/work/codera/flutter-template/icons_launcher.yaml'