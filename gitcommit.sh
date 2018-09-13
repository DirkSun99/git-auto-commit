#!/bin/bash

# 文件路径
GIT_LOG_PATH="/opt/shell/git.log"
# 分隔符，与文件路径指定的git.log中的分隔符对应
SEPARATOR="AAAA"
# 提交文件路径（即每次提交需要修改的文件）
COMMIT_FILE_PATH="/opt/gitrep/data.txt"
# Git仓库地址
GIT_REPOSITORY="/opt/gitrep"

for line in $(cat ${GIT_LOG_PATH})
do
	array=(${line//${SEPARATOR}/ })
	# 提交人
	commit_user_name=${array[0]}
	commit_user_email=${array[1]}
	# 提交时间
	commit_time=${array[2]}
	# 提交备注
	commit_comments=${array[3]}
	echo "提交人姓名${commit_user_name}，提交人邮箱${commit_user_email}，提交时间${commit_time}，提交备注${commit_comments}"

	# 文件内容写入
	echo "aaa" >> ${COMMIT_FILE_PATH}

	# 修改系统时间
	date ${commit_time}

	# 进入git目录
	cd ${GIT_REPOSITORY}

	# 设置提交人
	git config user.email ${commit_user_emaill}
	git config user.name ${commit_user_name}

	# 添加修改文件
	git add ${COMMIT_FILE_PATH}

	# 提交到本地库
	git commit -m "${commit_comments}"
done