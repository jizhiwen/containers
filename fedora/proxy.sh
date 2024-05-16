function startproxy() {
	export http_proxy='http://proxy.example.com:3128'
	export HTTPS_PROXY='https://proxy.example.com:3129'
	export ALL_PROXY='socks5://proxy.example.com:3130'
}

function stoproxy() {
	unset http_proxy
	unset HTTPS_PROXY
	unset ALL_PROXY
}
