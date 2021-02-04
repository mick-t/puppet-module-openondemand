#!/usr/bin/env python

import json
import os
import shutil
import subprocess
import sys

result = {}
try:
    params = json.load(sys.stdin)
    source = params['source']
    filename = os.path.basename(source)
    announcements_dot_d = '/etc/ood/config/announcements.d'
    if source == 'purge':
        result['purged'] = []
        if os.path.isdir(announcements_dot_d):
            for f in os.listdir(announcements_dot_d):
                f_path = os.path.join(announcements_dot_d, f)
                os.unlink(f_path)
                result['purged'].append(f_path)
    else:
        dest = os.path.join(announcements_dot_d, filename)
        if not os.path.isdir(announcements_dot_d):
            os.mkdir(announcements_dot_d)
        if os.path.isfile(source):
            shutil.copyfile(source, dest)
        else:
            raise Exception("source %s not found" % source)
        result['dest'] = dest
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
