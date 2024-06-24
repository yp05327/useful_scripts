#!/bin/sh
# Thanks for 空巷一人 qq:1530688385
#更改提交中所有邮箱为OLD_EMAIL或用户名为OLD_NAME的为新的用户名和新的邮箱，注释部分的可以变更邮箱

git filter-branch --env-filter '
OLD_NAME="xx"
CORRECT_NAME="yy"
CORRECT_EMAIL="xxx@gmail.com"
OLD_EMAIL="yyy@gmail.com"


if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi

if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi

if [ "$GIT_COMMITTER_NAME" = "$OLD_NAME" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
fi
if [ "$GIT_AUTHOR_NAME" = "$OLD_NAME" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
fi
' -f --tag-name-filter cat -- --branches --tags    #-f为强行覆盖
#取消下面的#注释，将自动强行推送所有修改到主分支
#git push origin master --force
