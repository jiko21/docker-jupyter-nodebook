# Jupyter-NodeBook
## 概要
[NodeSchoolの教材](https://nodeschool.io/ja/)には以下のデメリットがある.

それは, 復習がしづらい, ということ.

NodeSchoolの教材自体はインタラクティブに設計されており, その場で正誤判定ができるようになっている. ただ, 内容がまとめられているために,
`自分で理解していく`
という作業が大変だったりする.

そこで, それを簡単に行えるよう, Docker Imageを作成した.

## Dockerのインストール

1. [Dockerのホームページ](https://docs.docker.com/engine/installation/)からインストールしましょう.
2. そこからは簡単にインストールができるはずです. (Windowsの場合は, VirtualBoxがいるかもしれません)

## Docker Imageのビルド
Docker Imageのあるディレクトリ内で,
```bash
docker build .
```
と押すと, 自動的にビルドされます.

## Docker Containerの起動
```bash
docker images
```
とすると, 現在, 実行可能なdocker imageがあります.

そのimageの番号をメモっておきましょう...

次に, docker containerそのものを起動させます.
```bash
docker run -it --rm -p 8888:8888 -v /absolute/path/to/your/workspace:/home/nodeschool
 <Dockerのid>
```
で起動可能です!!

## 実行コマンド

```bash
jupyter notebook --ip=0.0.0.0 --allow-root
```
とすると, 起動可能です!!

## 参照
[docker-pyenv - a Docker container for pyenv](https://github.com/mcandre/docker-pyenv)
