# 引数をディレクトリ名として受け取る
DIR = $(shell echo $1)

# ディレクトリ内の.cや.sファイルをすべてリストアップする
SRCS = $(wildcard $(DIR)/*.c $(DIR)/*.s)

# 出力ファイルを指定する
TARGET = cal

# ccでコンパイルする
all: $(TARGET)
$(TARGET): $(SRCS)
	cc -o $(TARGET) $(SRCS)

# ディレクトリ名を指定せずにmakeコマンドを実行した場合は、カレントディレクトリを対象とする
.PHONY: all
all:
	$(MAKE) $(MAKECMDGOALS) $(DIR)
