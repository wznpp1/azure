^/webdav/yandex/*** https://webdav.yandex.com/$1
^/webdav/yandex/ reqHeaders://{yandex.disk.reqHeaders}
^/webdav/yandex/ reqBody://{yandex.disk.reqBody}

``` yandex.disk.reqHeaders
Authorization: OAuth AgAAAAAvgKk0AABFv8O2p1tDFUswhrpplANzml4
Yandex-Cloud-Mobile-Activity: user
Accept-Language: zh-cn
Accept-Encoding: gzip
Yandex-Authorization: OAuth AgAAAAAvgKk0AABFv8O2p1tDFUswhrpplANzml4
Connection: close
User-Agent: Yandex.Disk {"os":"iOS","src":"disk.mobile","vsn":"2.91.18570","id":"8C78DCC0-5B46-427E-BC81-E6B908523A57","device":"phone","uuid":"d976f792d4344852b78424ffe8b5f38a"}
Client-Capabilities: get_redirect,use_autohide,base_location=/,delete_200
Referer: 
```

``` yandex.disk.reqBody
<?xml version="1.0" encoding="utf-8" ?><D:propfind xmlns:D="DAV:"><D:prop><D:getcontentlength/><D:getcontenttype/><D:getlastmodified/><D:resourcetype/></D:prop></D:propfind>
```

