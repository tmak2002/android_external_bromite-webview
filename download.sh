function get_download_url {
	wget -q -nv -O- https://api.github.com/repos/bromite/bromite/releases/latest 2>/dev/null |  jq -r '.assets[] | select(.browser_download_url | contains("arm64_SystemWebView.apk")) | .browser_download_url'
}

function download_apk {
	URL=$(get_download_url)
	mkdir -p prebuilt/arm64/
	wget -q -nv -O prebuilt/arm64/SystemWebView.apk $URL
}

download_apk
