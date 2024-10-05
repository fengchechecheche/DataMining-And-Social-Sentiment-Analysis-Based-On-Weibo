#!/usr/bin/python3.5

import urllib.request
from collections import OrderedDict
import uuid
import _thread

def get_ip(client_id):
    data = OrderedDict()
    data['client_id'] = str(client_id)

    # 假设这是获取IP的URL: url = "http://localhost:8001/get_proxy"
    request = urllib.request.Request(url="http://localhost:8001/get_proxy", data=urllib.parse.urlencode(data).encode('utf-8'))
    response = urllib.request.urlopen(request)
    print(response.read().decode('utf-8'))


def get_task():
    data = OrderedDict()
    data['\n\n'] = '\n\n'

    request = urllib.request.Request(url="http://localhost:8001/get_task", data=urllib.parse.urlencode(data).encode('utf-8'))
    response = urllib.request.urlopen(request)
    print(response.read().decode('utf-8'))


if __name__ == '__main__':
    # 调用 get_ip 函数并传递一个 UUID 作为客户端ID
    get_ip(uuid.uuid1())
    '''
    # 下面的代码块被注释掉了，因为它会无限循环并不断地启动新线程  
    # 如果您想测试多线程，请取消注释并根据需要调整 count 的值 
    ids = []

    count = 1   # 例如，启动5个线程  
    
    for i in range(count):
        ids.append(uuid.uuid1())
    
    for i in range(count):
        _thread.start_new_thread(get_ip, (ids[i],))

    while input():
        for i in range(count):
            _thread.start_new_thread(get_ip, (ids[i],))
    '''
