#!/bin/bash
# 如果遇到权限问题，请先执行 chmod 777 ./cra.sh 或者 chmod +x ./cra.sh

echo '欢迎使用 cra 来初始化您的前端项目👏'
echo ''

echo '您的项目要叫什么名字?'
read name

echo '使用什么语言？JavaScript(1) 或者 TypeScript(2)?'
read lang

echo '是否安装 antd 组件库? yes/no'
read antd

echo '是否安装 antd-mobile 组件库? yes/no'
read antdMobile

echo '是否需要开启 sass? yes/no'
read sass

# 初始化项目
if [ "$lang" == 1 ] || [ "$lang" = "js" ] || [ "$lang" = "JavaScript" ] || [ "$lang" = "javascript" ] ;
then
  yarn create react-app $name
fi

if [ "$lang" == 2 -o "$lang" = "ts" -o "$lang" = "TypeScript" -o "$lang" = "typescript" ];
then
  yarn create react-app $name --typescript
fi
echo '项目初始化完毕！'
# end

cd $name

# 安装 UI 库（按需引入、主题色配置）
if [ $antd == "yes" -o $antd == "y" ] && [ $antdMobile == "yes" -o $antdMobile == "y" ];
then
  yarn add antd antd-mobile less less-loader react-app-rewired customize-cra babel-plugin-import

  sed -i "" 's/react-scripts start/react-app-rewired start/g' package.json
  sed -i "" 's/react-scripts build/react-app-rewired build/g' package.json
  sed -i "" 's/react-scripts test/react-app-rewired test/g' package.json

  echo "const { override, fixBabelImports, addLessLoader } = require('customize-cra')

  module.exports = override(
    fixBabelImports('antd', {
      libraryName: 'antd',
      libraryDirectory: 'es',
      style: true,
    }),
    fixBabelImports('antd-mobile', {
      libraryName: 'antd-mobile',
      style: true,
    }),
    addLessLoader({
      javascriptEnabled: true,
      modifyVars: {
        '@primary-color': '#0A54FF', // 定义 antd 的主题色
        '@brand-primary': '#0A54FF'  // 定义 antd-mobile 的主题色
      },
    }),
  )" > config-overrides.js
elif [ $antd == "yes" -o $antd == "y" ] && [ $antdMobile == "no" -o $antd == "n" ];
then
  yarn add antd react-app-rewired customize-cra babel-plugin-import

  sed -i "" 's/react-scripts start/react-app-rewired start/g' package.json
  sed -i "" 's/react-scripts build/react-app-rewired build/g' package.json
  sed -i "" 's/react-scripts test/react-app-rewired test/g' package.json

  echo "const { override, fixBabelImports, addLessLoader } = require('customize-cra')

  module.exports = override(
    fixBabelImports('import', {
      libraryName: 'antd',
      libraryDirectory: 'es',
      style: true,
    }),
    addLessLoader({
      javascriptEnabled: true,
      modifyVars: {
        '@primary-color': '#0A54FF', // 定义 antd 的主题色
      },
    }),
  )" > config-overrides.js
elif [ $antd == "no" -o $antd == "n" ] && [ $antdMobile == "yes" -o $antdMobile == "y" ];
then
  yarn add antd-mobile react-app-rewired customize-cra babel-plugin-import

  sed -i "" 's/react-scripts start/react-app-rewired start/g' package.json
  sed -i "" 's/react-scripts build/react-app-rewired build/g' package.json
  sed -i "" 's/react-scripts test/react-app-rewired test/g' package.json

  echo "const { override, fixBabelImports, addLessLoader } = require('customize-cra')

  module.exports = override(
    fixBabelImports('import', {
      libraryName: 'antd-mobile',
      style: true,
    }),
    addLessLoader({
      javascriptEnabled: true,
      modifyVars: {
        '@brand-primary': '#0A54FF'  // 定义 antd-mobile 的主题色
      },
    }),
  )" > config-overrides.js
fi
echo 'UI 库安装完毕！'
# end

# 开启 sass
if [ "$sass" == "yes" ];
then
  yarn add node-sass
fi
echo 'sass 开启完毕！'
# end
