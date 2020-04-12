if where systemctl > /dev/null; then
    alias sc=systemctl
    alias sup='systemctl restart'
    alias sdown='systemctl stop'
    alias sst='systemctl status'
fi
