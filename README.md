# 概要
Vagrnt + chef-soloでローカル(Mac)にCentOS7 + Nginx + PHP-FPM + Redisの開発環境を構築するためのリポジトリ

## 前提
ローカルのMacに以下が既にインストールされていること
1. Vagrant(2.1.0)
2. VirtualBox(5.2.16)
3. Ruby(2.3.6) + bundler(1.16.2)

※(カッコ内は動作確認バージョン)

## 使い方
```
$ git clone git@github.com:higeojisan/chef_serverspec_for_local.git
$ cd chef_serverspec_for_local
$ vagrant up
$ bundle install --path vendor/bundle
```

### vagrant up時に以下のエラーが発生した場合
```
Vagrant could not detect Chef on the guest! Even after Vagrant
attempted to install Chef, it could still not find Chef on the system.
Please make sure you are connected to the Internet and can access
Chef's package distribution servers. If you already have Chef
installed on this guest, you can disable the automatic Chef detection
by setting the 'install' option in the Chef configuration section of
your Vagrantfile:

    chef.install = false
```
ローカル環境によってはvagrant up時に上記のエラーが発生することがあります。
ローカル環境にインストールされているセキュリティソフトによって、SSL証明書のエラーが発生し、chefのインストールが出来ない場合があります。

## chefのレシピを追加・変更した場合
bundle installでserverspecをインストールしているので、serverspecのテストも追加・変更し、serverspecを実行してエラーがないことを確認してください。
```
$ bundle exec rake spec
```
