#!/bin/sh

# Roslynatorのエラーを検知するためのシェルスクリプト
#
# 戻り値
# 成功                      -> exit 0
# 1つ以上の診断が見つかった場合 -> exit 1
#
# @memo ビルド後でないと正確な診断結果が得られない
# ref. https://github.com/JosefPihrt/Roslynator/blob/master/docs/cli/fix-command.md

set -e;

roslynator_analyze_commond=`dotnet roslynator analyze`
roslynator_analyze_log=`echo "$roslynator_analyze_commond"`
diagnostics_log=`echo "$roslynator_analyze_log" | tail -n1`

echo "$roslynator_analyze_log"

if [ "`echo $diagnostics_log | grep -x '0 diagnostics found'`" ]; then
    echo '\nYour code is perfect!'
    exit 0
fi

echo '\nPlease fix the code.'
exit 1
