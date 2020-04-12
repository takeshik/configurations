if where ssh-agent > /dev/null 2>&1; then
    eval $(ssh-agent) > /dev/null
fi