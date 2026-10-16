#!/data/data/com.termux/files/usr/bin/bash
# مولّد أكواد التفعيل — Allakan Apps
# الاستخدام:  bash ~/chef/code.sh رقم-جهاز-الزبون
KEY="${CHEF_KEY:-$HOME/allakan-chef-private.pem}"
[ -s "$KEY" ] || { echo "المفتاح الخاص غير موجود: $KEY"; exit 1; }
[ -n "$1" ] || { echo "اكتب رقم جهاز الزبون: bash code.sh ABCD-EFGH-IJKL"; exit 1; }
ID=$(echo "$1" | tr -d ' -' | tr a-z A-Z); PACK="${2:-p1}"
SIG=$(printf '%s' "$ID|$PACK" | openssl dgst -sha256 -sign "$KEY" | base64 -w0 | tr '+/' '-_' | tr -d '=')
echo ""; echo "الكود (انسخه وابعته للزبون):"; echo ""; echo "$PACK-$SIG"; echo ""
