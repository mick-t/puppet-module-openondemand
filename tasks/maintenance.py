#!/usr/bin/env python

import json
import os
import sys

result = {}
try:
    params = json.load(sys.stdin)
    ensure = params.get('ensure', 'present')
    enable = '/etc/ood/maintenance.enable'
    if ensure == 'absent':
        if os.path.isfile(enable):
            os.unlink(enable)
        result['status'] = 'removed'
    else:
        with open(enable, 'a'):
            os.utime(enable, None)
        result['status'] = 'created'
    exitcode = 0
except Exception as e:
    exitcode = 1
    result['_error'] = {
        'msg': str(e),
        'kind': 'exception',
        'details': {}
    }

json.dump(result, sys.stdout)
sys.exit(exitcode)
