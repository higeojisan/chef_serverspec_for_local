# 概要
以下の2つの環境を構築するためのリポジトリ
1. Vagrant + chef-soloでローカル(Mac)にCentOS7 + Nginx + PHP-FPM + Redisのローカル開発環境
2. 

## 前提
ローカルのMacに以下が既にインストールされていること
1. Vagrant(2.1.0)
2. VirtualBox(5.2.16)
3. Ruby(2.3.6) + bundler(1.16.2)
4. Packer(1.2.3)

※(カッコ内は動作確認バージョン)

## 使い方
### Vagrant + chef-soloでローカル(Mac)にCentOS7 + Nginx + PHP-FPM + Redisのローカル開発環境の場合
```
$ git clone git@github.com:higeojisan/chef_serverspec_for_local.git
$ cd chef_serverspec_for_local
$ vagrant up
$ bundle install --path vendor/bundle
$ bundle exec rake spec
```
### Packer + chef-soloでプロビジョニングされたCentOS7のAMIの場合
```
$ git clone git@github.com:higeojisan/chef_serverspec_for_local.git
$ cd chef_serverspec_for_local
$ packer build base-ami.json
```
※.envrcに以下の記載があることが前提
```
export AWS_ACCESS_KEY_ID="xxxxxxxxxxxxx"
export AWS_SECRET_ACCESS_KEY="xxxxxxxxxxxxxxxx"
export AWS_DEFAULT_REGION="ap-northeast-1"
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
