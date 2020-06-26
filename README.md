# capistrano-hyperf-pm2
使用`capistrano`部署hyperf项目，并使用pm2管理和守护hyperf进程。

## Installation

### capistrano
```bash
# 安装capistrano capistrano的版本号，在部署程序中有配置，需注意
gem install capistrano
# 安装bundler
gem install bundler

# 安装
bundle install
```

### pm2
```bash
npm install pm2 -g
```

## Usage
配置好相关服务器配置和目录信息后执行相关命令，如：
`cap production deploy`