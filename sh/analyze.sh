#!/bin/sh

# Roslynatorのエラーを検知するためのシェルスクリプト
#
# 戻り値
# 成功                      -> exit 0
# 1つ以上の診断が見つかった場合 -> exit 1
#
# ref. https://github.com/JosefPihrt/Roslynator/blob/master/docs/cli/fix-command.md

roslynator_analyze_commond=`dotnet roslynator analyze`
roslynator_analyze_log=`echo "$roslynator_analyze_commond"`

echo "$roslynator_analyze_log"

if [ "`echo $roslynator_analyze_log | grep '0 diagnostics found'`" ]; then
    echo 'Your code is perfect!'
    exit 0
fi

echo 'Please fix the code.'
exit 1
