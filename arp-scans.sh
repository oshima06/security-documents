echo "## ip addr && ip route"
ip addr
ip route

###################################
# 入力.
###################################
print_help () {
  printf "1番目の引数に使用するデバイス名を入力してください。\n"
  printf "2番目の引数に使用するネットワークアドレスを入力してください。\n"
  exit 1
}

echo $#
if [ $# != 2 ]; then
    print_help
    exit 1
else
    DEVICE=$1
    echo $DEVICE

    NETWORK=$2
    echo $NETWORK
fi

echo "=================================================="
echo "=================================================="
echo ""

sudo arp-scan -I $DEVICE -l

echo "=================================================="
echo "=================================================="
echo ""

sudo nmap -nA -sn $NETWORK
# sudo nmap -nFA -sn $NETWORK
# -n … ホストを検出した場合でもDNSの逆引きを行わない
# -sN … まったくフラグなしのパケットを送って調べる（TCP Nullスキャン）
# RFC793では「SYN、RST、ACKなどのフラグビットを含まないパケットに対しては、ポートが閉じている場合はRSTが返され、ポートが開いている場合は何の応答も返されない」としているため間接的にオープンポートの情報を与えてしまいます。

# -Aを付けて実行をするとOS検知、可動サービスのバージョン情報、スクリプトスキャンなどを実行
# -Fを付けると最高速になるが、ファイアーウォールにポートスキャンを検知される可能性が高くなる

# nmap -n -sn 192.168.1.0/24
# nmap -nFA 192.168.1.110

# https://at-virtual.net/%E3%82%BB%E3%82%AD%E3%83%A5%E3%83%AA%E3%83%86%E3%82%A3/namp%E3%82%B9%E3%82%AD%E3%83%A3%E3%83%B3%E3%81%AE%E5%85%A8%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%83%BB%E3%82%AA%E3%83%97%E3%82%B7%E3%83%A7%E3%83%B3%E3%82%92%E6%97%A5%E6%9C%AC%E8%AA%9E%E8%A7%A3/
