# bs-cra
> 对 create-react-app 进行二次定制的项目启动脚手架。自动为您执行 antd 组件库 和 antd-mobile 组件库的安装，并配置按需加载组件代码和样式。

## 何时使用
在您需要初始化一个 React 的前端项目时使用，本命令可以帮您自动执行 antd 组件库 和 antd-mobile 组件库的安装，并配置按需加载组件代码和样式，加快您的开发效率～

## 安装
```
yarn global add bs-cra
```
或者
``` 
npm i -g bs-cra
```

## 使用
在命令行执行 `cra` 命令：
```
您的项目要叫什么名字?
tmp-app-name
使用什么语言？JavaScript(1) 或者 TypeScript(2)?
2
是否安装 antd 组件库? yes/no
y
是否安装 antd-mobile 组件库? yes/no
y
是否需要开启 sass? yes/no
y
```

## 其他
本命令开发时使用的各主要依赖项版本如下：

- create-react-app：3.2.0
- antd V3
- antd-mobile V2
