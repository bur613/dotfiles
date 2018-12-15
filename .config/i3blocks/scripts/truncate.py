#!/usr/bin/env python
import sys
import subprocess
import os

max_length = 200

def truncate(string):
    if len(string) < max_length:
        spaces = int((max_length - len(string)) / 2)
        return spaces * " " + string + spaces * " "
    else:
        start = string[0:int(max_length / 2)]
        end = string[-int(max_length / 2):]
        return start + "..." + end + " "

def main():
    while True:
        p = subprocess.Popen('xtitle', shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        for line in p.stdout.readlines():
            if "Calling an external command in Python" in line:
                if len(line) > 102:
                    sys.stdout.flush()
                    print truncate(line[47:102].strip()+"...")
                else:
                    sys.stdout.flush()
                    print truncate(line[47:].strip())
                break
            else:
                sys.stdout.flush()
                if len(line) > 55:
                    sys.stdout.flush()
                    print truncate(line[:55].strip()+"...")
                else:
                    sys.stdout.flush()
                    print truncate(line.strip())
                break

        #string = 'input()'
        #print(truncate(string))

if __name__ == "__main__":
    main()
